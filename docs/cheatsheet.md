# 🚀 Neovim Advanced Cheatsheet & Workflow Guide

Este guia é a sua "colinha" definitiva (*sheetcode*) cobrindo tanto os **plugins modernos instalados** quanto o **poder nativo do Neovim**, projetado para acelerar o desenvolvimento, leitura rápida de código e notas.

---

## 📑 Índice
1. [Movimentação Rápida & Leitura no Arquivo](#1-movimentação-rápida--leitura-no-arquivo)
2. [Edição & Manipulação Cirúrgica de Código](#2-edição--manipulação-cirúrgica-de-código)
3. [Navegação Global, Sessões & Arquivos](#3-navegação-global-sessões--arquivos)
4. [Testes Automatizados](#4-testes-automatizados)
5. [Diagnósticos & Qualidade de Código](#5-diagnósticos--qualidade-de-código)
6. [Markdown, LaTeX & Zathura](#6-markdown-latex--zathura)
7. [Poder Nativo do Neovim (Core Essentials)](#7-poder-nativo-do-neovim-core-essentials)

---

## 1. Movimentação Rápida & Leitura no Arquivo

### ⚡ Flash (`flash.nvim`)
Pula para qualquer lugar visível na tela sem contar linhas ou dar dezenas de `w/b`:
* **`s` + 2 letras**: Digite `s` e as duas primeiras letras da palavra de destino. O Flash exibe marcadores coloridos na tela; pressione a letra indicada para pousar exatamente no alvo.
* **`S`**: Ativa a seleção por escopo **Tree-sitter**. Pressione repetidamente para expandir a seleção sintática (ex: palavra ➔ expressão ➔ função ➔ classe).
* **`r` (em modo operador)**: Executa um salto remoto. Exemplo: `yr` + 2 letras copia a palavra distante sem tirar o cursor de onde você está.

### 🌳 Code Outline & TOC (`aerial.nvim`)
Visualização estrutural de arquivos longos (componentes React, classes, funções, seções Markdown/LaTeX):
* **`<leader>o`** (`<space>o`): Abre/fecha a barra lateral com a árvore de símbolos do arquivo.
* **`{` e `}`**: Pula diretamente para o símbolo/função anterior ou seguinte no código.

### 📏 Guias de Indentação & Escopos (`indent-blankline.nvim`)
* Exibe linhas verticais sutis que delimitam a indentação do código.
* **Scope Tracking**: O bloco ou função onde o seu cursor está posicionado no momento recebe um destaque colorido automático na guia lateral, facilitando o rastreamento de fechamento de blocos em Fennel/Lisp e tags aninhadas em TSX/JSX.

---

## 2. Edição & Manipulação Cirúrgica de Código

### 📦 Delimitadores com `nvim-surround`
Manipule aspas, parênteses, colchetes, tags HTML/JSX e símbolos LaTeX num piscar de olhos:
* **Adicionar ao redor (Normal Mode):** `ys<motion><delimitador>`
  * `ysiw"` ➔ Envolve a palavra atual com aspas duplas: `palavra` ➔ `"palavra"`
  * `ysiw)` ➔ Envolve a palavra com parênteses: `palavra` ➔ `(palavra)`
  * `ysiw$` ➔ Envolve em LaTeX inline: `alpha` ➔ `$alpha$`
  * `ys$)` ➔ Envolve do cursor até o final da linha em parênteses.
* **Adicionar ao redor (Visual Mode):**
  * Selecione o texto em modo visual (`v` ou `V`) e aperte **`S<delimitador>`** (ex: `S"` ou `S{`).
* **Trocar delimitador:** `cs<antigo><novo>`
  * `cs"'` ➔ Troca aspas duplas por aspas simples: `"texto"` ➔ `'texto'`
  * `cs([` ➔ Troca `(texto)` por `[texto]`
* **Deletar delimitador:** `ds<delimitador>`
  * `ds"` ➔ Remove as aspas mantendo o conteúdo interno.
  * `ds$` ➔ Remove os delimitadores `$` de uma equação LaTeX.

### 🎨 Formatação de Código (`conform.nvim`)
* **`<leader>lf`** ou **`<leader>cf`**: Formata o arquivo atual de forma assíncrona usando o melhor formatador da linguagem (Prettier/Biome para TS/JS, Stylua para Lua, Black para Python, Latexindent para LaTeX) com fallback suave para o LSP.

---

## 3. Navegação Global, Sessões & Arquivos

### 💾 Gerenciador de Sessões (`persistence.nvim`)
* **`<leader>qs`**: Restaura a sessão do projeto atual (reabre todos os buffers, splits e posições do cursor exatamente onde você parou).
* **`<leader>ql`**: Restaura a última sessão aberta no Neovim.
* **`<leader>qd`**: Interrompe o salvamento automático da sessão ativa (ótimo para quando você abre um arquivo temporário e não quer sobrescrever seu layout de trabalho).

### 🔍 Telescope + FZF Nativo
* **`<C-p>`**: Localizador rápido de arquivos no projeto (*fuzzy finder* com binário C ultrarrápido).
* **`<leader>fg`**: Busca textual no projeto inteiro (*Live Grep* via Ripgrep).
* **`<leader>fb`**: Lista buffers abertos para troca rápida.
* **`<leader>fh`**: Busca na documentação do Neovim/plugins.

### 📌 Harpoon 2 (Marcadores de alta frequência)
Para alternar instantaneamente entre os 4 arquivos em que você está trabalhando:
* **`<leader>a`**: Adiciona o buffer atual à lista do Harpoon.
* **`<C-w>`**: Pula para o 1º arquivo fixado.
* **`<C-e>`**: Pula para o 2º arquivo fixado.
* **`<C-r>`**: Pula para o 3º arquivo fixado.
* **`<C-t>`**: Pula para o 4º arquivo fixado.
* **`<C-q>`**: Abre o menu flutuante do Harpoon para reordenar ou ver os arquivos.

### 🪟 Tmux + Neovim Navigator
* **`<C-h>`**, **`<C-j>`**, **`<C-k>`**, **`<C-l>`**: Navega perfeitamente entre os splits do Neovim e os painéis do Tmux usando as mesmas teclas direcionais.

---

## 4. Testes Automatizados (`neotest`)

Rode seus testes (Jest, Vitest, etc.) diretamente no Neovim sem precisar sair para o terminal:
* **`<leader>tr`**: Executa o teste mais próximo (*nearest*) sob o cursor.
* **`<leader>tf`**: Executa todos os testes do arquivo atual (*file*).
* **`<leader>ts`**: Executa a suíte de testes inteira (*suite*).
* **`<leader>to`**: Abre/fecha o painel com a árvore de testes e status (*summary outline*).
* **`<leader>tp`**: Abre a janela flutuante com a saída detalhada e traceback de erro do teste (*output popup*).
* **`<leader>tS`**: Interrompe a execução do runner atual (*stop*).

---

## 5. Diagnósticos & Qualidade de Código

### ⚠️ Trouble (`trouble.nvim`)
* **`<leader>xx`**: Abre o painel inferior de diagnósticos do projeto inteiro (erros e warnings do LSP agrupados por arquivo).
* **`<leader>xX`**: Mostra diagnósticos apenas do buffer ativo.
* **`<leader>cs`**: Exibe símbolos e referências do buffer.
* **`<leader>xL` / `<leader>xQ`**: Visualizador rico de Location List e Quickfix List.

### 💬 LSP & Auto-Complete (`blink.cmp`)
* **`gd`**: Pula para a definição do símbolo.
* **`K`**: Documentação flutuante sob o cursor (*hover*).
* **`<leader>la`**: Code Actions (ações rápidas e correções automáticas).
* **`<leader>ln`**: Renomear variável/símbolo em todo o projeto (*rename*).
* **`<Tab>` / `<CR>`**: Navega e confirma sugestões do autocompletion (*ghost text* pré-visualiza a sugestão).

---

## 6. Markdown, LaTeX & Zathura

### 📝 Markdown no Neovim
* **`render-markdown.nvim`**: Renderiza cabeçalhos, caixas de seleção, blocos de código e matemática inline automaticamente com `conceallevel = 2`. O cursor sobre a linha revela a sintaxe bruta para edição sem atrito.
* **`nabla.nvim`**:
  * **`<leader>p`**: Abre um **popup flutuante** com a renderização em arte ASCII/Unicode da fórmula LaTeX sob o cursor.
  * **`<leader>P`**: Alterna o **virtual text** com fórmulas renderizadas inline ao longo de todo o documento.

### 📐 LaTeX + Zathura (SyncTeX Bidirecional)
* **`,ll`** (`<localleader>ll`): Inicia a compilação contínua em segundo plano (`latexmk -pvc`).
  * **A cada `:w`, o Zathura atualiza o PDF automaticamente.**
* **`,lv`** (`<localleader>lv`): **Forward Search** ➔ Foca o Zathura e salta diretamente para a página e linha correspondente ao cursor no Neovim.
* **`Ctrl + Clique Esquerdo` no Zathura**: **Inverse Search** ➔ Clique em qualquer palavra/fórmula no PDF do Zathura para fazer o Neovim pular para a linha exata no arquivo `.tex`.

---

## 7. Poder Nativo do Neovim (Core Essentials)

### 🎯 Text Objects (A gramática do Vim: `Operador` + `i/a` + `Objeto`)
* `ciw`: *Change inside word* (apaga a palavra atual e entra em modo inserção).
* `caw`: *Change around word* (apaga a palavra e o espaço após ela).
* `ci"` / `ci'`: Altera o conteúdo dentro das aspas.
* `ci(` ou `cib`: Altera o conteúdo dentro dos parênteses.
* `ci{` ou `ciB`: Altera o bloco de chaves (função/objeto).
* `cit`: Altera o conteúdo dentro de uma tag HTML/JSX (`<div>conteúdo</div>` ➔ altera `conteúdo`).
* `dat`: Deleta a tag HTML/JSX inteira e o seu conteúdo ao redor.
* `vip`: Seleciona o parágrafo inteiro visualmente.
* `yap`: Copia o parágrafo inteiro sem precisar mover o cursor.

### 🚀 Rolagem Centralizada & Busca Fluida
* **`<C-d>` / `<C-u>`**: Rola meia página para baixo/cima mantendo a linha do cursor sempre centralizada na tela (`zz`).
* **`n` / `N`**: Pula para o próximo/anterior resultado de busca mantendo a tela centralizada (`zzzv`).
* **`*`**: Busca instantânea pela palavra sob o cursor para frente.
* **`#`**: Busca instantânea pela palavra sob o cursor para trás.

### 🪄 O Truque do `cgn` (Substituição Inteligente)
Substitua ocorrências sem precisar digitar regex complexo:
1. Posicione o cursor sobre a palavra e aperte `*` (ou `/palavra<CR>`).
2. Digite **`cgn`** (ele apaga a ocorrência atual e entra em modo inserção).
3. Digite o novo texto e aperte `<Esc>`.
4. Aperte **`.`** (ponto) para substituir a próxima ocorrência, ou **`n`** para pular se não quiser alterar!

### 📋 Registradores (Nunca mais perca o texto copiado)
* **`"0p`**: Cola o último texto que você realmente copiou com `y` (ignora coisas que você deletou com `d`, `x` ou `c`).
* **`"_d`**: Deleta enviando para o "buraco negro" (*blackhole register*), sem substituir o que estava no clipboard.
* **`<C-r>"` (em modo de inserção ou no terminal do `:`):** Cola o texto copiado diretamente na digitação sem sair do modo inserção.

### 📼 Macros Rápidas
* **`qa`**: Inicia a gravação da macro no registrador `a`.
* Faça a sequência de edições desejada.
* **`q`**: Finaliza a gravação.
* **`@a`**: Executa a macro gravada.
* **`@@`**: Repete a última macro executada (ou use `10@a` para rodar 10 vezes seguidas).
