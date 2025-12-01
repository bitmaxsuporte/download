import xml.etree.ElementTree as ET
import json
import os

# Nome do arquivo de entrada
arquivo_xml = '29251129527713000190550010000002141676045580-nfe.xml'
# Nome do arquivo de saída
arquivo_json = 'produtos.json'

def formatar_2_casas_ponto(valor_texto):
    """
    Formata o valor para uma string com 2 casas decimais e PONTO.
    Ex: '11.2500000000' -> '11.25'
    """
    try:
        valor_float = float(valor_texto)
        return f"{valor_float:.2f}"
    except (ValueError, TypeError):
        return valor_texto

def processar_nfe_json(xml_path, json_path):
    if not os.path.exists(xml_path):
        print(f"Erro: Arquivo '{xml_path}' não encontrado.")
        return

    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()

        # Namespace da NFe
        ns = {'nfe': 'http://www.portalfiscal.inf.br/nfe'}

        lista_produtos = []
        itens = root.findall('.//nfe:det', ns)
        
        for item in itens:
            prod = item.find('nfe:prod', ns)

            codigo = prod.find('nfe:cProd', ns).text
            
            qtd_xml = prod.find('nfe:qCom', ns).text
            vlr_xml = prod.find('nfe:vUnCom', ns).text
            
            item_dict = {
                "codigo": codigo,
                "qtd": formatar_2_casas_ponto(qtd_xml),
                "vlr": formatar_2_casas_ponto(vlr_xml)
            }
            
            lista_produtos.append(item_dict)

        with open(json_path, 'w', encoding='utf-8') as f:
            json.dump(lista_produtos, f, indent=4)

        print(f"Sucesso! {len(lista_produtos)} itens salvos em '{json_path}'.")

    except Exception as e:
        print(f"Ocorreu um erro na extração do XML: {e}")

if __name__ == "__main__":
    processar_nfe_json(arquivo_xml, arquivo_json)