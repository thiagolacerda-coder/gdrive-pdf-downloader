# 📄 Google Drive Protected PDF Downloader

<p align="center">
  <img src="https://img.shields.io/badge/JavaScript-ES6+-yellow.svg" alt="JavaScript">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-blue.svg" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/Dependencies-ImageMagick%20%7C%20jsPDF-orange.svg" alt="Dependencies">
</p>

Uma solução eficiente para extrair e converter documentos e arquivos PDF em modo **"Apenas Visualização" (Protected / View-Only)** hospedados no Google Drive ou Google Docs.

---

## 📑 Sumário
- [Características](#-características)
- [Comparativo de Métodos](#-comparativo-de-métodos)
- [Como Usar](#-como-usar)
  - [Método 1: Alta Performance (Recomendado)](#método-1-alta-performance-processamento-local--recomendado)
  - [Método 2: Conversão Direta no Navegador](#método-2-conversão-direta-no-navegador-para-documentos-pequenos)
- [Dicas de Uso e Otimização](#-dicas-de-uso-e-otimização)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Créditos e Dependências](#-créditos-e-dependências)

---

## ✨ Características

* **Extração Fiel:** Mantém a qualidade original das imagens e páginas do documento.
* **Auto-Scroll Inteligente:** Detecta automaticamente a área de rolagem e varre o documento para forçar o carregamento dinâmico de todas as páginas (*lazy-loading*).
* **Detecção Automática de Dimensões:** Ajusta o tamanho da página e a orientação (Retrato/Paisagem) com base no documento de origem.
* **Suporte a Processamento em Lote (Bulk Processing):** Extraia múltiplos arquivos `.PDF_DataFile` de uma vez via CLI.
* **Saída Modular:** Organiza e salva as páginas convertidas em formato individual `.png` dentro de pastas estruturadas.

---

## 📊 Comparativo de Métodos

| Funcionalidade | Método 1 (CLI + Extrator) | Método 2 (jsPDF Direto) |
| :--- | :---: | :---: |
| **Tamanho do Documento** | **Sem limite de páginas** | Recomendado até 20 páginas |
| **Uso de Memória/RAM** | Otimizado (Baixo consumo) | Elevado em documentos grandes |
| **Geração do PDF** | Local via compilador executável | Diretamente via aba do navegador |
| **Dependências Externas** | Requer o runner `.cmd` / binário | Requer conexão CDN (`jsPDF`) |
| **Processamento em Lote** | Sim (vários arquivos na pasta `/Input`) | Não (processamento individual) |

---

## 🚀 Como Usar

### Método 1: Alta Performance (Processamento Local — Recomendado)

Este método é ideal para arquivos grandes, livros ou documentos com muitas páginas.

#### Passo 1: Extrair o arquivo de dados
1. Abra o arquivo PDF protegido no seu navegador (Chrome, Firefox, Edge).
2. Abra o Console do Desenvolvedor (Pressione `F12` ou `Ctrl + Shift + I` e vá na aba **Console**).
3. Copie todo o código contido em `Method_1_Script.js`.
4. Cole o código no console e pressione `Enter`.
5. O script rolará o documento automaticamente para carregar todas as páginas.
6. Ao finalizar, o navegador baixará um arquivo com a extensão **`.PDF_DataFile`**.

#### Passo 2: Gerar o PDF Final
1. Mova o arquivo `.PDF_DataFile` baixado para a pasta **`Input/`** do projeto.
2. Execute o assistente de compilação:
   * **Windows:** Clique duas vezes no arquivo `GeneratePDF.cmd`.
   * **Linux:** Execute o binário `GeneratePDF` localizado no diretório `Linux/`.
3. O terminal processará o arquivo e mostrará a mensagem de sucesso `[SUCESSO] Processamento concluído com código [0]`.
4. O seu PDF pronto estará na pasta **`Output/`**.

---

### Método 2: Conversão Direta no Navegador (Para documentos pequenos)

Ideal para documentos de poucas páginas que precisam de conversão rápida sem uso de scripts locais.

1. Acesse o documento protegido no Google Drive.
2. Abra o Console do Desenvolvedor (`F12`).
3. Copie todo o conteúdo do arquivo `Method_2_Script.js`.
4. Cole no console e pressione `Enter`.
5. O script injetará dinamicamente a biblioteca **jsPDF**, rolará o documento e acionará o download do arquivo `.pdf` diretamente.

---

## 💡 Dicas de Uso e Otimização

### Definindo um Nome Personalizado
Por padrão, o arquivo será gerado com o nome `Document`. Para alterar, edite a linha inicial dos scripts JS antes de colá-los no console:

```javascript
// Altere isto:
let pdfDocumentName = "Document";

// Para isto (não inclua a extensão .pdf):
let pdfDocumentName = "Meu_Relatorio_Final";
```

* Inspirado no conceito de extração de DOM do [CodingCat](https://codingcat.codes/2019/01/09/download-view-protected-pdf-google-drive-js-code/).