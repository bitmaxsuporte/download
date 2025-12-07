import xml.etree.ElementTree as ET
import openpyxl # Importa a biblioteca para Excel
import os

# Nome do arquivo de entrada (XML da NFe)
arquivo_xml = '29251129527713000190550010000002141676045580-nfe.xml'
# Nome do arquivo de saída (Excel)
# ALTERADO: Mudando a extensão para .xlsx
arquivo_excel = 'produtos_nfe.xlsx' 

def formatar_2_casas(valor_texto):
    """
    Retorna um FLOAT formatado com 2 casas decimais.
    Ex: '11.251' vira 11.25
    """
    try:
        # Converte para float e arredonda/limita para 2 casas
        return round(float(valor_texto), 2)
    except (ValueError, TypeError):
        # Retorna 0.00 ou trata o erro se o valor for crucial
        return 0.00 

def processar_nfe_excel(xml_path, excel_path):
    if not os.path.exists(xml_path):
        print(f"Erro: Arquivo '{xml_path}' não encontrado.")
        return

    try:
        # 1. Carrega o XML
        tree = ET.parse(xml_path)
        root = tree.getroot()

        # Namespace da NFe
        ns = {'nfe': 'http://www.portalfiscal.inf.br/nfe'}

        # 2. Configura o Excel (Workbook e Worksheet)
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "Produtos NFe"

        # Define os cabeçalhos
        cabecalhos = ["Código", "Quantidade", "Valor Unitário"]
        ws.append(cabecalhos) # Adiciona a linha de cabeçalho

        # 3. Extrai os dados
        itens = root.findall('.//nfe:det', ns)
        
        for item in itens:
            prod = item.find('nfe:prod', ns)

            codigo = prod.find('nfe:cProd', ns).text
            
            # Pega valores originais
            qtd_xml = prod.find('nfe:qCom', ns).text
            vlr_xml = prod.find('nfe:vUnCom', ns).text
            
            # Formata para float com 2 casas decimais
            qtd_formatada = formatar_2_casas(qtd_xml)
            vlr_formatado = formatar_2_casas(vlr_xml)
            
            # Monta a linha de dados
            linha_dados = [
                codigo, 
                qtd_formatada,
                vlr_formatado
            ]
            
            # Adiciona a linha ao Excel
            ws.append(linha_dados)

        # 4. Salva o arquivo Excel
        wb.save(excel_path)

        print(f"Sucesso! {len(itens)} itens salvos em '{excel_path}'.")
        print("Abra o arquivo .xlsx para conferir os dados.")

    except Exception as e:
        print(f"Ocorreu um erro: {e}")

if __name__ == "__main__":
    # ALTERADO: Usando o novo nome de arquivo de saída
    processar_nfe_excel(arquivo_xml, arquivo_excel)