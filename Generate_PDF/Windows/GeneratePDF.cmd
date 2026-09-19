@ECHO OFF
TITLE Google Drive PDF Engine - Runner
COLOR 0A

ECHO ==============================================================================
ECHO                   DOCUMENT CONVERT
ECHO ==============================================================================
ECHO.

:: Navega para o diretório onde o script .bat está salvo
CD /D "%~dp0"
ECHO [LOG %TIME:~0,8%] Diretorio atual: %CD%

SET "EXE_PATH=..\Source_Files\GeneratePDF.exe"

ECHO [LOG %TIME:~0,8%] Buscando executavel em: %EXE_PATH%
ECHO.

:: Trava de Segurança 1: Verifica se o arquivo .exe realmente existe no caminho
IF NOT EXIST "%EXE_PATH%" (
    COLOR 0C
    ECHO [ERRO CRITICO] O executavel NAO foi encontrado!
    ECHO [DETALHE] Verifique se a pasta Source_Files esta no local correto.
    ECHO.
    GOTO FINALIZAR
)

ECHO [LOG %TIME:~0,8%] Executavel localizado. Iniciando processo...
ECHO ------------------------------------------------------------------------------
ECHO.

:: Executa o binario e armazena o codigo de resposta
"%EXE_PATH%"
SET "EXIT_CODE=%ERRORLEVEL%"

ECHO.
ECHO ------------------------------------------------------------------------------
IF %EXIT_CODE% EQU 0 (
    ECHO [SUCESSO] Processamento concluido com codigo [0].
) ELSE (
    COLOR 0C
    ECHO [ALERTA] O programa finalizou com erro/codigo: %EXIT_CODE%
)

:FINALIZAR
ECHO.
ECHO ==============================================================================
ECHO Processo finalizado. A janela permanecera aberta para leitura dos logs.
ECHO ==============================================================================
ECHO.
PAUSE
CMD /k