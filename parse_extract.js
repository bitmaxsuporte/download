const fs = require('fs');
const text = fs.readFileSync('D:/Site Suporte/extrato_temp.txt', 'utf8');
const rawLines = text.split('\n');

function parseBR(str) {
  if (!str) return null;
  str = str.trim().replace(/\s/g, '');
  const neg = str.startsWith('-');
  const num = parseFloat(str.replace(/[^0-9,]/g, '').replace(',', '.'));
  return isNaN(num) ? null : (neg ? -num : num);
}

function col(line, s, e) {
  if (!line || line.length <= s) return '';
  return line.substring(s, Math.min(e, line.length)).trim();
}

// Group lines into blocks: each block starts with a date line
const blocks = [];
let curBlock = null;

for (const line of rawLines) {
  if (!line.trim() || line.trim().length < 5) continue;
  if (/^aviso|^novos lan|^atualizado|^Em caso|^0728|^Fale Conosco|^Se n.o ficar/i.test(line.trim())) continue;

  const dateMatch = line.match(/^(\d{2}\/\d{2}\/\d{4})/);
  if (dateMatch) {
    if (curBlock) blocks.push(curBlock);
    curBlock = { date: dateMatch[1], lines: [line] };
  } else if (line.match(/^\s{10,}/)) {
    if (curBlock) curBlock.lines.push(line);
  }
}
if (curBlock) blocks.push(curBlock);

// For each block, extract all 6 columns
const transactions = [];
const dailyBalances = [];

for (const block of blocks) {
  const allText = block.lines.join('\n');
  const lancText = col(block.lines[0], 12, 46).toUpperCase();
  const fullText = allText.toUpperCase().replace(/\r/g, '');

  // Check if SALDO TOTAL line
  if (/SALDO\s+TOTAL\s+DISPON/.test(fullText)) {
    // Extract saldo from this block
    const valRegex = /(-?\d{1,3}(?:\.\d{3})*,\d{2})/g;
    const vals = [];
    let match;
    while ((match = valRegex.exec(allText)) !== null) {
      vals.push(parseBR(match[1]));
    }
    if (vals.length > 0) {
      const saldo = vals[vals.length - 1];
      if (saldo !== null && saldo > 0) {
        dailyBalances.push({ date: block.date, balance: saldo });
      }
    }
    continue;
  }

  // Skip non-transactions
  if (/SALDO\s+ANTERIOR/.test(lancText)) continue;
  if (/^CD\d{8,}/.test(lancText)) continue;
  if (/^DB\d{8,}/.test(lancText)) continue;
  if (/^PAGAMENTO\s+S\.A/i.test(lancText)) continue;
  if (/^REDECARD/.test(lancText)) continue;
  if (/^AUT\s+MAIS/i.test(lancText)) continue;
  if (/^AUTOM/i.test(lancText)) continue;
  if (/^BANCO\s+\d+/.test(lancText)) continue;
  if (/^TIT\s+COB/.test(lancText)) continue;
  if (/^PI\d+\//.test(lancText)) continue;

  // Also check continuation lines for skip patterns
  let skipBlock = false;
  for (const ln of block.lines) {
    const txt = col(ln, 12, 46).toUpperCase();
    if (/SALDO\s+TOTAL\s+DISPON/.test(txt)) { skipBlock = true; break; }
    if (/^CD\d{8,}/.test(txt)) { skipBlock = true; break; }
    if (/^DB\d{8,}/.test(txt)) { skipBlock = true; break; }
    if (/^PAGAMENTO\s+S\.A/i.test(txt)) { skipBlock = true; break; }
  }
  if (skipBlock) continue;

  // Extract columns from first line
  let lanc = col(block.lines[0], 12, 46);
  let razao = col(block.lines[0], 47, 74);
  let cnpj = col(block.lines[0], 75, 94);

  // Collect CNPJ/CPF from all lines
  const cnpjMatches = allText.match(/\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}|\d{3}\.\d{3}\.\d{3}-\d{2}/g);
  if (cnpjMatches) {
    const realCnpjs = cnpjMatches.filter(c => {
      return !c.startsWith('119.403') && !c.startsWith('42.795') && !c.startsWith('49.678');
    });
    if (realCnpjs.length > 0 && !cnpj) cnpj = realCnpjs[0];
  }

  // Collect values from all lines
  const valRegex = /(-?\d{1,3}(?:\.\d{3})*,\d{2})/g;
  const allValues = [];
  let match;
  while ((match = valRegex.exec(allText)) !== null) {
    allValues.push({ str: match[1], val: parseBR(match[1]) });
  }

  // The LAST value in the block is the saldo (running balance)
  // The SECOND TO LAST value is the transaction value
  let valor = null;
  let saldo = null;

  if (allValues.length >= 2) {
    saldo = allValues[allValues.length - 1].val;
    valor = allValues[allValues.length - 2].val;
  } else if (allValues.length === 1) {
    valor = allValues[0].val;
  }

  // Clean up description
  lanc = lanc.replace(/\s+/g, ' ').trim();

  // If no description found, try to get from continuation lines
  if (!lanc || lanc.length < 3) {
    for (const ln of block.lines) {
      const desc = col(ln, 12, 46);
      if (desc && desc.length > 3 && !/^CD\d/.test(desc) && !/^DB\d/.test(desc)) {
        lanc = desc.replace(/\s+/g, ' ').trim();
        break;
      }
    }
  }

  // If still no description, skip
  if (!lanc || lanc.length < 3) continue;

  // Clean up razao social - concatenate multi-line
  if (block.lines.length > 1) {
    const razaoParts = [];
    for (const ln of block.lines) {
      const r = col(ln, 47, 74);
      if (r && r.length > 2 && !/^\d/.test(r) && !r.startsWith('PAGAMENTO') && !r.startsWith('REDECARD')) {
        razaoParts.push(r);
      }
    }
    if (razaoParts.length > 0) razao = razaoParts.join(' ');
  }

  transactions.push({
    date: block.date,
    lanc: lanc,
    razao: razao.replace(/\s+/g, ' ').trim(),
    cnpj: cnpj.replace(/\s+/g, ' ').trim(),
    valor: valor,
    saldo: saldo
  });
}

// Sort by date
transactions.sort((a, b) => {
  const [da, ma, ya] = a.date.split('/').map(Number);
  const [db, mb, yb] = b.date.split('/').map(Number);
  return new Date(ya, ma-1, da) - new Date(yb, mb-1, db);
});

// Remove duplicates
const seen = new Set();
const clean = [];
for (const t of transactions) {
  const key = `${t.date}_${t.lanc}_${t.valor}`;
  if (!seen.has(key)) {
    seen.add(key);
    clean.push(t);
  }
}

// Clean daily balances
const cleanBalances = [];
const seenDates = new Set();
for (const b of dailyBalances) {
  const key = `${b.date}|${b.balance}`;
  if (!seenDates.has(key)) {
    seenDates.add(key);
    cleanBalances.push(b);
  }
}
cleanBalances.sort((a, b) => {
  const [da, ma, ya] = a.date.split('/').map(Number);
  const [db, mb, yb] = b.date.split('/').map(Number);
  return new Date(ya, ma-1, da) - new Date(yb, mb-1, db);
});

console.log(`Total: ${clean.length} transacoes`);
console.log(`Total saldos diarios: ${cleanBalances.length}\n`);

console.log('Data       | Lancamentos                          | Razao Social                   | CNPJ/CPF            |    Valor     |      Saldo');
console.log('-'.repeat(140));
clean.slice(0, 15).forEach(t => {
  const v = t.valor !== null ? (t.valor >= 0 ? '+' : '') + t.valor.toFixed(2).replace('.',',') : '';
  const s = t.saldo !== null ? t.saldo.toFixed(2).replace('.',',') : '-';
  console.log(`${t.date} | ${(t.lanc||'').substring(0,38).padEnd(38)} | ${(t.razao||'').substring(0,30).padEnd(30)} | ${(t.cnpj||'').padEnd(19)} | ${v.padStart(12)} | ${s.padStart(12)}`);
});

console.log('\n...');
clean.slice(-10).forEach(t => {
  const v = t.valor !== null ? (t.valor >= 0 ? '+' : '') + t.valor.toFixed(2).replace('.',',') : '';
  const s = t.saldo !== null ? t.saldo.toFixed(2).replace('.',',') : '-';
  console.log(`${t.date} | ${(t.lanc||'').substring(0,38).padEnd(38)} | ${(t.razao||'').substring(0,30).padEnd(30)} | ${(t.cnpj||'').padEnd(19)} | ${v.padStart(12)} | ${s.padStart(12)}`);
});

// Monthly summary
const months = {};
clean.forEach(t => {
  const m = t.date.substring(3);
  if (!months[m]) months[m] = { e: 0, s: 0, count: 0 };
  if (t.valor !== null) {
    if (t.valor >= 0) months[m].e += t.valor;
    else months[m].s += Math.abs(t.valor);
  }
  months[m].count++;
});

console.log('\nResumo Mensal:');
Object.entries(months).forEach(([m, d]) => {
  console.log(`${m}: ${d.count} tx | Entradas: R$ ${d.e.toFixed(2)} | Saidas: R$ ${d.s.toFixed(2)} | Saldo: R$ ${(d.e-d.s).toFixed(2)}`);
});

const totalE = clean.filter(t => t.valor > 0).reduce((s, t) => s + t.valor, 0);
const totalS = clean.filter(t => t.valor < 0).reduce((s, t) => s + Math.abs(t.valor), 0);
console.log(`\nTotal Geral: ${clean.length} transacoes`);
console.log(`Total Entradas: R$ ${totalE.toFixed(2)}`);
console.log(`Total Saidas: R$ ${totalS.toFixed(2)}`);
console.log(`Saldo: R$ ${(totalE - totalS).toFixed(2)}`);

// Save
fs.writeFileSync('D:/Site Suporte/apuração/transactions.json', JSON.stringify(clean, null, 2), 'utf8');
fs.writeFileSync('D:/Site Suporte/apuração/daily_balances.json', JSON.stringify(cleanBalances, null, 2), 'utf8');
console.log('\nSaved transactions.json and daily_balances.json');
