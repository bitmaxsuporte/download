import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
import shutil
import zipfile
import os
import datetime
import threading
import tkinter.ttk as ttk
import sys

# Função para obter o diretório do executável
def get_executable_dir():
    executable_path = sys.executable
    executable_dir = os.path.dirname(executable_path)
    return executable_dir

# Classe responsável pela manipulação do arquivo de configuração
class ConfigManager:
    CONFIG_FILE = "config.txt"

    @staticmethod
    def save_caminho_instalacao(caminho_instalacao):
        caminho_arquivo = os.path.join(get_executable_dir(), ConfigManager.CONFIG_FILE)
        with open(caminho_arquivo, "w") as f:
            f.write(caminho_instalacao)

    @staticmethod
    def load_caminho_instalacao():
        caminho_arquivo = os.path.join(get_executable_dir(), ConfigManager.CONFIG_FILE)
        caminho_instalacao = ""
        if os.path.exists(caminho_arquivo):
            with open(caminho_arquivo, "r") as f:
                caminho_instalacao = f.read().strip()
        return caminho_instalacao

    @staticmethod
    def load_caminho_backup():
        caminho_arquivo = os.path.join(get_executable_dir(), ConfigManager.CONFIG_FILE)
        caminho_backup = ""
        if os.path.exists(caminho_arquivo):
            with open(caminho_arquivo, "r") as f:
                caminho_backup = f.read().strip()
        caminho_backup = os.path.join(caminho_backup, "Backup")
        return caminho_backup

    @staticmethod
    def existe_arquivo_config():
        caminho_arquivo = os.path.join(get_executable_dir(), ConfigManager.CONFIG_FILE)
        return os.path.exists(caminho_arquivo)

# Classe responsável pela exibição da barra de progresso
class ProgressBar:
    def __init__(self, root):
        self.progress_percentage = tk.StringVar()

        self.frame = tk.Frame(root)
        self.frame.pack(side=tk.BOTTOM, pady=10)

        self.progress_bar = ttk.Progressbar(
            self.frame,
            mode="determinate",
            variable=self.progress_percentage,
            style="TProgressbar",
            length=300,
        )
        self.progress_bar.pack(pady=5)

        self.progress_label = tk.Label(
            self.frame,
            textvariable=self.progress_percentage,
            font=("Helvetica", 14),
            fg="#000000",
        )
        self.progress_label.pack()

    def update_progress(self, percentage):
        self.progress_percentage.set(f"{percentage}%")
        self.progress_bar["value"] = percentage
        self.progress_bar.update()

# Classe responsável pela execução do backup
class BackupManager:
    def __init__(self, caminho_instalacao, progress_bar):
        self.caminho_instalacao = caminho_instalacao
        self.progress_bar = progress_bar
        self.pasta_backup = os.path.join(self.caminho_instalacao, "Backup")
        self.pasta_temp = os.path.join(self.pasta_backup, "Temp")

    def iniciar_backup(self):
        if self.caminho_instalacao:
            self.progress_bar.update_progress(0)
            backup_thread = threading.Thread(target=self.executar_backup)
            backup_thread.start()
        else:
            messagebox.showwarning("Pasta de Instalação", "A pasta de instalação não foi selecionada.")

    def executar_backup(self):
        try:
            self.criar_pasta_temporaria()

            self.realizar_copia_arquivo_bitmax()
            self.realizar_copia_pastas_nfce_nfe()

            self.progress_bar.update_progress(33)

            nome_arquivo_zip_xml = self.criar_arquivo_zip_xml("XML_Bitmax")
            nome_arquivo_zip_backup = self.criar_arquivo_zip_backup("Backup_Bitmax")

            self.progress_bar.update_progress(66)

            self.mover_arquivo_zip_xml(nome_arquivo_zip_xml)
            self.criar_arquivo_zip_bitmax(nome_arquivo_zip_backup)

            self.progress_bar.update_progress(100)

            messagebox.showinfo("Backup Concluído", "O backup foi concluído com sucesso.")

        except Exception as e:
            messagebox.showerror("Erro", f"Ocorreu um erro durante o backup: {str(e)}")

        finally:
            self.excluir_pasta_temporaria()

    def criar_pasta_temporaria(self):
        if not os.path.exists(self.pasta_temp):
            os.makedirs(self.pasta_temp)

    def realizar_copia_arquivo_bitmax(self):
        pasta_origem_bitmax = os.path.join(self.caminho_instalacao, "DB")
        arquivo_origem_bitmax = "BITMAX.FDB"
        caminho_origem_bitmax = os.path.join(pasta_origem_bitmax, arquivo_origem_bitmax)
        arquivo_destino_bitmax_temp = os.path.join(self.pasta_temp, arquivo_origem_bitmax)
        shutil.copy(caminho_origem_bitmax, arquivo_destino_bitmax_temp)

    def realizar_copia_pastas_nfce_nfe(self):
        pasta_origem_nfce = os.path.join(self.caminho_instalacao, "Bin", "Arquivos NFCe", "NFCE")
        pasta_origem_nfe = os.path.join(self.caminho_instalacao, "Bin", "Arquivos NFe", "NFE")
        pasta_destino_nfce_temp = os.path.join(self.pasta_temp, "XML", "NFCE")
        pasta_destino_nfe_temp = os.path.join(self.pasta_temp, "XML", "NFE")
        if os.path.exists(pasta_origem_nfce):
            shutil.copytree(pasta_origem_nfce, pasta_destino_nfce_temp)
        if os.path.exists(pasta_origem_nfe):
            shutil.copytree(pasta_origem_nfe, pasta_destino_nfe_temp)

    def criar_arquivo_zip(self, nome_arquivo_zip, pasta_origem, pasta_destino):
        dia_da_semana = datetime.datetime.now().strftime("%A")
        dia_da_semana_pt = {
            "Monday": "Segunda",
            "Tuesday": "Terça",
            "Wednesday": "Quarta",
            "Thursday": "Quinta",
            "Friday": "Sexta",
            "Saturday": "Sábado",
            "Sunday": "Domingo",
        }
        nome_arquivo_zip = f"{nome_arquivo_zip}_{dia_da_semana_pt.get(dia_da_semana, '')}.zip"
        pasta_destino_temp = os.path.join(self.pasta_temp, pasta_destino)
        arquivo_destino_temp = os.path.join(self.pasta_temp, nome_arquivo_zip)
        shutil.make_archive(arquivo_destino_temp[:-4], "zip", pasta_destino_temp)
        return nome_arquivo_zip

    def criar_arquivo_zip_xml(self, nome_arquivo_zip):
        return self.criar_arquivo_zip(nome_arquivo_zip, "XML", "XML")

    def criar_arquivo_zip_backup(self, nome_arquivo_zip):
        return self.criar_arquivo_zip(nome_arquivo_zip, "BITMAX.FDB", "Backup")

    def mover_arquivo_zip_xml(self, nome_arquivo_zip_xml):
        arquivo_destino_xml_temp = os.path.join(self.pasta_temp, nome_arquivo_zip_xml)
        arquivo_destino_xml_final = os.path.join(self.pasta_backup, nome_arquivo_zip_xml)
        shutil.move(arquivo_destino_xml_temp, arquivo_destino_xml_final)

    def criar_arquivo_zip_bitmax(self, nome_arquivo_zip_backup):
        arquivo_origem_bitmax_temp = os.path.join(self.pasta_temp, "BITMAX.FDB")
        arquivo_destino_bitmax_final = os.path.join(self.pasta_backup, nome_arquivo_zip_backup)
        with zipfile.ZipFile(arquivo_destino_bitmax_final, "w") as zipf:
            zipf.write(arquivo_origem_bitmax_temp, arcname="BITMAX.FDB")

    def excluir_pasta_temporaria(self):
        if os.path.exists(self.pasta_temp):
            shutil.rmtree(self.pasta_temp)


# Classe responsável pela interface gráfica
class BackupApplication:
    def __init__(self, root):
        self.root = root
        self.root.title("Backup Bitmax")
        self.root.geometry("400x150")

        self.root.resizable(False, False)  # Impede o redimensionamento da janela

        # Obtém a largura e altura da tela
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()

        # Calcula as coordenadas para centralizar o aplicativo na tela
        x = (screen_width - 400) // 2
        y = (screen_height - 150) // 2

        # Define a nova posição do aplicativo
        self.root.geometry(f"400x150+{x}+{y}")

        self.style = ttk.Style()
        self.style.configure(
            "TButton",
            padding=6,
            relief="flat",
            font=("Helvetica", 12),
            background="#5C94E1",
            foreground="#000000",
            bordercolor="#5C94E1",
            highlightthickness=0,
        )
        self.style.configure(
            "TButton.TButton",
            background="#A0A0A0",
        )
        self.style.map(
            "TButton",
            background=[("pressed", "#3E81D8"), ("active", "#78A9F5")],
            foreground=[("pressed", "#000000"), ("active", "#000000")],
        )

        self.progress_bar = ProgressBar(self.root)

        self.backup_button = ttk.Button(
            self.root,
            text="Backup",
            command=self.iniciar_backup,
            state=tk.DISABLED,
            style="TButton",
        )
        self.backup_button.pack(side=tk.LEFT, padx=5)

        self.open_folder_button = ttk.Button(
            self.root, text="📂", command=self.abrir_pasta_backup, style="TButton"
        )
        self.open_folder_button.pack(side=tk.LEFT, padx=5)

        self.instalacao_button = ttk.Button(
            self.root,
            text="⚙️",
            command=self.selecionar_instalacao,
            style="TButton",
        )
        self.instalacao_button.pack(side=tk.LEFT, padx=5)
        self.instalacao_button.configure(state=tk.DISABLED)

        self.caminho_instalacao = ""
        self.backup_manager = None

        self.load_caminho_instalacao()

    def selecionar_instalacao(self):
        selected_dir = filedialog.askdirectory()
        if selected_dir:
            self.caminho_instalacao = selected_dir
            self.save_caminho_instalacao()
            self.backup_manager = BackupManager(self.caminho_instalacao, self.progress_bar)
            self.backup_button.config(state=tk.NORMAL)
            self.instalacao_button.config(state=tk.DISABLED)
        else:
            messagebox.showwarning("Selecione um Diretório", "Nenhum diretório selecionado.")

    def save_caminho_instalacao(self):
        ConfigManager.save_caminho_instalacao(self.caminho_instalacao)

    def load_caminho_instalacao(self):
        self.caminho_instalacao = ConfigManager.load_caminho_instalacao()
        if self.caminho_instalacao:
            self.backup_manager = BackupManager(self.caminho_instalacao, self.progress_bar)
            self.backup_button.config(state=tk.NORMAL)
            self.instalacao_button.config(state=tk.DISABLED)
        elif not ConfigManager.existe_arquivo_config():
            self.instalacao_button.config(state=tk.NORMAL)

    def abrir_pasta_backup(self):
        caminho_backup = ConfigManager.load_caminho_backup()
        if caminho_backup and os.path.exists(caminho_backup):
            # Usar o módulo subprocess para abrir a pasta com o gerenciador de arquivos padrão do sistema
            try:
                if sys.platform == "win32":
                    subprocess.Popen(["explorer", caminho_backup])
                elif sys.platform == "darwin":
                    subprocess.Popen(["open", caminho_backup])
                else:
                    subprocess.Popen(["xdg-open", caminho_backup])
            except Exception as e:
                messagebox.showwarning("Erro ao Abrir Pasta", f"Não foi possível abrir a pasta: {str(e)}")
        else:
            messagebox.showwarning("Pasta de Backup", "A pasta de backup não foi configurada.")

    def iniciar_backup(self):
        self.backup_button.config(state=tk.ACTIVE)
        self.backup_manager.iniciar_backup()

    def run(self):
        self.root.mainloop()


# Define o diretório de trabalho como o diretório do executável
import os

if hasattr(sys, "_MEIPASS"):
    os.chdir(sys._MEIPASS)

# Cria o arquivo "config.txt" se ele não existir no diretório de trabalho
config_file_path = os.path.join(get_executable_dir(), "config.txt")
if not os.path.exists(config_file_path):
    with open(config_file_path, "w") as config_file:
        config_file.write("")

# Cria a janela principal
root = tk.Tk()

# Cria a instância da aplicação
app = BackupApplication(root)

# Executa a aplicação
app.run()
