import pyautogui
import time
import json
import os

# --- CONFIGURAÇÕES DE SEGURANÇA E TEMPO ---
pyautogui.FAILSAFE = True 
pyautogui.PAUSE = 0.5   # Pausa de 0.5s entre comandos

# Nome do arquivo JSON
arquivo_json = 'produtos.json'

def carregar_dados_da_memoria(arquivo_json):
  """Carrega o arquivo JSON e retorna a lista de produtos."""
  if not os.path.exists(arquivo_json):
    print(f"Erro: O arquivo '{arquivo_json}' não foi encontrado.")
    return None
  try:
    with open(arquivo_json, 'r', encoding='utf-8') as f:
      dados = json.load(f)
      return dados if isinstance(dados, list) else None
  except Exception as e:
    print(f"Erro ao ler JSON: {e}")
    return None

# --- FUNÇÕES DE DIGITAÇÃO ---

def limpar_e_escrever_numeral(texto):
  """
  Limpa e digita valores de QTD/VLR.
  Faz a conversão de PONTO para VÍRGULA, conforme o padrão brasileiro.
  """
  # 1. Garante seleção total
  pyautogui.doubleClick(interval=0.1)
  time.sleep(0.1)
  pyautogui.hotkey('ctrl', 'a')
  
  # 2. Apaga de todas as formas
  pyautogui.press('delete') 
  time.sleep(0.1)
  
  # 3. Troca PONTO por VÍRGULA e digita (Ex: "11.25" vira "11,25")
  texto_formatado = str(texto).replace('.', ',')
  pyautogui.write(texto_formatado, interval=0.05)


def limpar_e_escrever_codigo(texto):
  """
  Limpa o campo CÓDIGO e digita o valor bruto. 
  **NÃO** faz conversão de ponto para vírgula.
  """
  # 1. Garante que o foco está no campo (Triple Click é robusto)
  pyautogui.tripleClick(interval=0.05) 
  time.sleep(0.1)
  
  # 2. Seleciona TUDO e limpa agressivamente
  pyautogui.hotkey('ctrl', 'a')
  pyautogui.press('delete') 
  time.sleep(0.1)
  
  # 3. Digita o valor puro do código (Ex: "1735")
  # O texto é tratado como string pura, sem formatação.
  pyautogui.write(str(texto), interval=0.05)
  
  # Pausa crítica para o sistema registrar o código
  time.sleep(0.5) 


def preencher_sistema():
  print("=== INICIANDO ROBÔ V7 (DIGITAÇÃO PURA DE CÓDIGO) ===")
  
  # 1. Carrega o JSON para a lista na memória
  dados_produtos = carregar_dados_da_memoria(arquivo_json)
  if dados_produtos is None:
    return

  print(f"Total de itens carregados na memória: {len(dados_produtos)}")
  print("CLIQUE NA JANELA DO SISTEMA AGORA!")
  print("Começando em 5 segundos...")
  
  time.sleep(5)

  try:
    contador = 1
    for item in dados_produtos:
      # Obter código como string pura do JSON (Ex: '1735')
      cod = item['codigo']
      qtd = item['qtd']
      vlr = item['vlr']

      print(f"-> Item {contador}/{len(dados_produtos)}: Código {cod}")
      

      # --- 1. CÓDIGO (DIGITAÇÃO PURA) ---
      pyautogui.click(498, 420)
      time.sleep(0.5) 
      limpar_e_escrever_codigo(cod) 
      pyautogui.press('enter')

      # --- 2. QUANTIDADE (CONVERSÃO PONTO->VÍRGULA) ---
      pyautogui.click(974, 425)
      time.sleep(0.5) 
      limpar_e_escrever_numeral(qtd)
      pyautogui.press('enter')

      # --- 3. VALOR (CONVERSÃO PONTO->VÍRGULA) ---
      pyautogui.click(1054, 425)
      time.sleep(0.5)
      limpar_e_escrever_numeral(vlr)
      pyautogui.press('enter')

      # --- 4. CONFIRMAR ---
      pyautogui.click(1408, 428)

      time.sleep(3)
      
      contador += 1
        
    print("=== FINALIZADO ===")

  except pyautogui.FailSafeException:
    print("\n!!! PARADA DE EMERGÊNCIA !!!")
  except Exception as e:
    print(f"Ocorreu um erro: {e}")

if __name__ == "__main__":
  preencher_sistema()