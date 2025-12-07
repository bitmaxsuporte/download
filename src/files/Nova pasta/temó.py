from pynput import mouse
from pynput import keyboard
import sys

# 1. Inicializa o controlador do mouse
mouse_controller = mouse.Controller()

def on_press(key):
    """Função chamada toda vez que uma tecla é pressionada."""
    try:
        # A biblioteca pynput representa a barra de espaço como 'Key.space'
        if key == keyboard.Key.space:
            
            # Captura a posição atual do mouse
            posicao_x, posicao_y = mouse_controller.position
            
            # Imprime a posição
            print(f"|--- TECLA ESPAÇO PRESSIONADA ---|")
            print(f"Posição Capturada: X={posicao_x}, Y={posicao_y}")
            print("-" * 40)
            
    except AttributeError:
        # Ignora outras teclas que não são chaves especiais
        pass

def iniciar_monitoramento():
    """Inicia o monitoramento do teclado."""
    print("----------------------------------------")
    print("Monitoramento iniciado.")
    print("Pressione a barra de espaço para capturar a posição do mouse.")
    print("Pressione Ctrl+C para sair.")
    print("----------------------------------------")
    
    # Cria e inicia o listener de teclado
    with keyboard.Listener(on_press=on_press) as listener:
        try:
            # Mantém o script rodando até que o listener pare
            listener.join()
        except KeyboardInterrupt:
            # Sai graciosamente ao pressionar Ctrl+C
            print("\nMonitoramento encerrado pelo usuário.")
            sys.exit(0)

if __name__ == "__main__":
    iniciar_monitoramento()