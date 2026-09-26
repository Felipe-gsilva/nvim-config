# Guia Completo de Comandos do Neovim

Este documento é a referência única da sua configuração, organizado por fluxo de trabalho. Ele reúne os plugins configurados e os comandos nativos essenciais para navegação, edição de código, desenvolvimento Lisp/Fennel, depuração, testes e escrita técnica (Markdown e LaTeX).

---

## Índice
1. [Movimentação e navegação no buffer](#1-movimentação-e-navegação-no-buffer)
2. [Edição de texto e histórico](#2-edição-de-texto-e-histórico)
3. [Navegação global, arquivos e janelas](#3-navegação-global-arquivos-e-janelas)
4. [LSP, diagnósticos e autocompletion](#4-lsp-diagnósticos-e-autocompletion)
5. [Desenvolvimento Lisp, Fennel e Clojure (Conjure)](#5-desenvolvimento-lisp-fennel-e-clojure-conjure)
6. [Depuração (DAP)](#6-depuração-dap)
7. [Testes automatizados (Neotest)](#7-testes-automatizados-neotest)
8. [Escrita, Markdown e LaTeX](#8-escrita-markdown-e-latex)
9. [Objetos de texto e atalhos essenciais do Vim](#9-objetos-de-texto-e-atalhos-essenciais-do-vim)

---

## 1. Movimentação e navegação no buffer

### Flash (`flash.nvim`)
Pulos rápidos para qualquer palavra visível na tela sem precisar contar linhas ou pressionar repetidamente `w` ou `b`:
* **`s` + 2 letras**: Digite `s` e as duas primeiras letras do seu destino. O Flash destaca as posições com letras na tela; aperte a letra correspondente para pular diretamente até lá.
  * *Observação sobre a tecla `s`:* No Vim padrão, `s` substitui o caractere sob o cursor (equivalente a `cl`). O Flash assume essa tecla nos modos Normal, Visual e Operador por ser uma tecla central e ergonômica. Se você precisar do comportamento tradicional de substituir um único caractere, use **`cl`** (ou `xi`).
* **`S`**: Seleção por escopo sintático via Tree-sitter. Pressione repetidamente para expandir a seleção do bloco de código (da palavra para a expressão, função ou classe).
* **`r` (em modo operador)**: Salto remoto. Por exemplo, `yr` + 2 letras permite copiar uma palavra distante sem tirar o cursor de onde você está.

### Estrutura do arquivo e símbolos (`aerial.nvim`)
Exibe a árvore de símbolos (funções, classes, seções de Markdown):
* **`<leader>o`** (Espaço + `o`): Abre ou fecha a barra lateral com o sumário de símbolos do arquivo atual.
* **`{` e `}`**: Pula diretamente para o símbolo ou função anterior/seguinte.

### Guias de indentação (`indent-blankline.nvim`)
* Exibe linhas verticais delimitando os blocos de código.
* Destaca automaticamente a linha de indentação do escopo onde o cursor está posicionado, facilitando a leitura de blocos longos em TSX, Clojure ou Fennel.

### Rolagem centralizada
* **`<C-d>` / `<C-u>`**: Rola meia página para baixo ou para cima mantendo a linha do cursor centralizada na tela (`zz`).
* **`n` / `N`**: Pula para o próximo/anterior resultado de busca mantendo a tela centralizada (`zzzv`).

---

## 2. Edição de texto e histórico

### Delimitadores (`nvim-surround`)
Adiciona, altera ou remove aspas, parênteses, colchetes e tags:
* **Adicionar ao redor (Modo Normal):** `ys<movimento><delimitador>`
  * `ysiw"`: Coloca aspas duplas na palavra atual (`palavra` -> `"palavra"`).
  * `ysiw)`: Coloca parênteses na palavra atual (`palavra` -> `(palavra)`).
  * `ysiw$`: Envolve a palavra em sintaxe LaTeX inline (`alpha` -> `$alpha$`).
  * `ys$)`: Envolve do cursor até o final da linha com parênteses.
* **Adicionar ao redor (Modo Visual):**
  * Selecione o texto (`v` ou `V`) e aperte **`S<delimitador>`** (exemplo: `S"` ou `S{`).
* **Trocar delimitador:** `cs<antigo><novo>`
  * `cs"'`: Troca aspas duplas por simples (`"texto"` -> `'texto'`).
  * `cs([`: Troca parênteses por colchetes (`(texto)` -> `[texto]`).
* **Remover delimitador:** `ds<delimitador>`
  * `ds"`: Remove as aspas mantendo o conteúdo interno.
  * `ds$`: Remove os delimitadores `$` de uma fórmula LaTeX.

### Formatação de código (`conform.nvim`)
* **`<leader>lf`** ou **`<leader>cf`**: Formata o arquivo atual de forma assíncrona usando o formatador apropriado da linguagem (Prettier para TS/JS/Markdown, Stylua para Lua, Black para Python, Latexindent para LaTeX), com fallback para o LSP se não houver formatador dedicado.

### Árvore visual de histórico (`undotree`)
* **`<leader>u`**: Abre ou fecha o painel visual do Undotree, permitindo navegar por ramificações de edições anteriores mesmo após salvar e reabrir o arquivo.

### Busca e substituição rápida com `cgn`
Substitui várias ocorrências de uma palavra sem precisar escrever expressões regulares:
1. Posicione o cursor sobre a palavra e aperte `*` para iniciar a busca.
2. Digite **`cgn`** (isso apaga a palavra atual e entra em modo de inserção).
3. Digite o novo texto e volte ao modo normal com `<Esc>`.
4. Aperte **`.`** (ponto) para substituir a próxima ocorrência, ou **`n`** para pular para a seguinte sem alterar.

### Registradores
* **`"0p`**: Cola o último texto copiado com `y` (ignora coisas apagadas com `d`, `x` ou `c`).
* **`"_d`**: Apaga sem enviar para a área de transferência (*blackhole register*).
* **`<C-r>"`**: Cola o texto copiado diretamente na linha de comando (`:`) ou no modo de inserção, sem precisar sair dele.

### Gravação de macros
* **`qa`**: Inicia a gravação no registrador `a`.
* Faça a sequência de edições desejada.
* **`q`**: Finaliza a gravação.
* **`@a`**: Executa a macro gravada.
* **`@@`**: Repete a última macro executada (ou use `10@a` para executar 10 vezes seguidas).

---

## 3. Navegação global, arquivos e janelas

### Busca de arquivos e texto (`telescope.nvim`)
* **`<C-p>`**: Localizador rápido de arquivos no projeto (busca por nome).
* **`<leader>fg`**: Busca textual no projeto inteiro via Ripgrep (live grep).
* **`<leader>fb`**: Lista de buffers abertos para troca rápida.
* **`<leader>fh`**: Busca na documentação e ajuda do Neovim.

### Explorador de arquivos (`neo-tree.nvim`)
* **`<leader>ff`**: Abre ou fecha a barra lateral da árvore de arquivos.

### Marcadores de alta frequência (`harpoon`)
Para alternar instantaneamente entre até 4 arquivos principais de trabalho:
* **`<leader>a`**: Adiciona o arquivo atual à lista do Harpoon.
* **`<C-w>`**: Pula para o 1º arquivo fixado.
* **`<C-e>`**: Pula para o 2º arquivo fixado.
* **`<C-r>`**: Pula para o 3º arquivo fixado.
* **`<C-t>`**: Pula para o 4º arquivo fixado.
* **`<C-q>`**: Abre o menu flutuante do Harpoon para visualizar ou reorganizar a lista.

### Sessões de trabalho (`persistence.nvim`)
* **`<leader>qs`**: Restaura a sessão do projeto atual (reabre todos os buffers e splits na posição onde você parou).
* **`<leader>ql`**: Restaura a última sessão aberta no Neovim.
* **`<leader>qd`**: Desativa o salvamento automático da sessão atual (útil ao abrir arquivos rápidos sem querer sobrescrever o layout de trabalho).

### Integração Neovim e Tmux (`vim-tmux-navigator`)
* **`<C-h>`**, **`<C-j>`**, **`<C-k>`**, **`<C-l>`**: Navega de forma contínua entre os splits do Neovim e os painéis do Tmux usando as mesmas teclas direcionais.

---

## 4. LSP, diagnósticos e autocompletion

### LSP (Navegação de código)
* **`gd`**: Pula para a definição do símbolo sob o cursor.
* **`K`**: Exibe a documentação flutuante do símbolo (*hover*).
* **`<leader>ld`**: Pula para a declaração do símbolo.
* **`<leader>lt`**: Pula para a definição de tipo.
* **`<leader>lh`**: Exibe a ajuda de assinatura da função (*signature help*).
* **`<leader>la`**: Exibe ações de código e correções sugeridas (*code actions*).
* **`<leader>ln`**: Renomeia a variável ou função em todo o projeto (*rename*).
* **`<leader>le`**: Abre a janela flutuante com a mensagem de erro da linha.
* **`<leader>lw`**: Lista todos os diagnósticos do workspace no Telescope.
* **`<leader>lr`**: Lista todas as referências do símbolo no Telescope.
* **`<leader>li`**: Lista implementações no Telescope.
* **`[d` / `]d`**: Pula para o diagnóstico anterior ou seguinte.

### Lista de diagnósticos rica (`trouble.nvim`)
* **`<leader>xx`**: Abre o painel inferior com todos os erros e avisos do projeto agrupados por arquivo.
* **`<leader>xX`**: Mostra diagnósticos apenas do arquivo atual.
* **`<leader>cs`**: Exibe símbolos e referências do buffer no painel inferior.
* **`<leader>xL` / `<leader>xQ`**: Abre a Location List ou a Quickfix List no formato do Trouble.

### Sugestões e Autocompletion

A sua configuração possui dois sistemas de autocompletion, dependendo do contexto:

#### No código em geral (`blink.cmp`)
* **`<Tab>`**: Seleciona a próxima sugestão da lista.
* **`<CR>`** (Enter): Confirma a sugestão selecionada.
* **`<C-Space>`**: Dispara manualmente o menu de sugestões.

#### No CoC (`coc.nvim` / LTeX para Markdown e LaTeX)
Quando o menu de sugestões do CoC estiver aberto na tela, use as teclas nativas de popup do Vim:
* **`<C-n>`** (Ctrl + n): Pula para a **próxima** sugestão.
* **`<C-p>`** (Ctrl + p): Volta para a sugestão **anterior**.
* **`<Down>` / `<Up>`**: Navega para baixo ou para cima na lista.
* **`<C-y>`** (Ctrl + y): **Aceita / confirma** a sugestão selecionada.
* **`<C-e>`** (Ctrl + e): **Fecha / cancela** o menu de sugestões.

---

## 5. Desenvolvimento Lisp, Fennel e Clojure (Conjure)

O Conjure conecta o Neovim ao ambiente interativo das linguagens Lisp (Fennel, Clojure, Janet, Common Lisp), permitindo avaliar código linha por linha sem reiniciar o processo.

### Avaliação de código no buffer
* **`<leader>er`**: Avalia a forma sob o cursor (*current form* / expressão entre parênteses).
* **`<leader>eb`**: Avalia todo o buffer ativo.
* **`<leader>ef`**: Avalia o arquivo inteiro no disco.
* **`<leader>sv`**: Abre o log de saídas e resultados do REPL em um split vertical.
* **`K`**: Consulta a documentação da palavra sob o cursor diretamente no REPL.

### Comandos do REPL interativo
* `,h`: Mostra o menu de ajuda do REPL.
* `,q`: Encerra a sessão do REPL.
* `,r`: Recarrega o módulo atual.
* `,d`: Mostra a documentação detalhada do símbolo.
* `,v`: Exibe informações de versão do ambiente.

### Formas essenciais do Fennel
* `(fn [args] body)`: Define uma função.
* `(let [nome valor] corpo)`: Cria variáveis com escopo local.
* `(when condicao corpo)`: Condicional simples (executa se verdadeiro).
* `(if condicao entao senao)`: Condicional com alternativa.
* `(require :modulo)`: Importa um módulo.
* `(doc simbolo)`: Exibe a documentação do símbolo no Fennel.
* `(macrodebug forma)`: Inspeciona a expansão de uma macro.

---

## 6. Depuração (DAP)

O DAP (Debug Adapter Protocol) permite definir breakpoints, inspecionar variáveis e navegar passo a passo na execução do código (configurado para GDB/C/C++, Python e outros adaptadores).

### Pontos de interrupção (Breakpoints)
* **`<leader>b`**: Alterna um breakpoint na linha atual.
* **`<leader>B`**: Define um breakpoint condicional (abre um prompt para você digitar a condição).

### Controle de fluxo de execução
* **`<F5>`**: Inicia a sessão de depuração ou continua a execução até o próximo breakpoint.
* **`<F1>`**: Entra na função chamada na linha atual (*step into*).
* **`<F2>`**: Avança para a próxima linha sem entrar em funções (*step over*).
* **`<F3>`**: Executa até sair da função atual (*step out*).

### Painéis e inspeção
* **`<leader>dui`**: Abre ou fecha a interface visual completa do DAP UI (pilha de chamadas, variáveis, watches e breakpoints).
* **`<leader>dr`**: Abre o console REPL de depuração.
* **`<leader>dh`**: Exibe o valor da variável sob o cursor em uma janela flutuante (*hover*).
* **`<leader>dp`**: Abre a janela de prévia do elemento sob o cursor.
* **`<leader>df`**: Exibe a lista centralizada de frames da pilha de execução.
* **`<leader>ds`**: Exibe os escopos e variáveis ativas no momento.

---

## 7. Testes automatizados (Neotest)

Executa testes (Jest, Vitest, etc.) diretamente no Neovim sem precisar alternar para o terminal:
* **`<leader>tr`**: Executa o teste mais próximo sob o cursor (*nearest*).
* **`<leader>tf`**: Executa todos os testes do arquivo atual (*file*).
* **`<leader>ts`**: Executa toda a suíte de testes do projeto (*suite*).
* **`<leader>to`**: Abre ou fecha o painel lateral com a lista e status dos testes (*outline*).
* **`<leader>tp`**: Abre uma janela flutuante com a saída detalhada e o traceback de erro (*output popup*).
* **`<leader>tS`**: Interrompe o runner de testes em execução (*stop*).

---

## 8. Escrita, Markdown e LaTeX

### Markdown no Neovim
* **`render-markdown.nvim`**: Renderiza cabeçalhos, tabelas, caixas de seleção, blocos de código e fórmulas em tempo real no buffer com `conceallevel = 2`. Ao mover o cursor sobre a linha, o texto original é exibido para edição sem atrito.
* **`nabla.nvim`**:
  * **`<leader>p`**: Abre uma janela flutuante com a fórmula sob o cursor renderizada em arte ASCII/Unicode.
  * **`<leader>P`**: Ativa ou desativa o texto virtual (*virtual text*), mostrando a prévia das fórmulas inline diretamente no arquivo.

### LaTeX com VimTeX e Zathura (SyncTeX Bidirecional)
* **`,ll`** (`<localleader>ll`): Inicia a compilação contínua em segundo plano com `latexmk`. Ao salvar (`:w`), o PDF no Zathura é atualizado automaticamente.
* **`,lv`** (`<localleader>lv`): *Forward search* — foca o visualizador Zathura exatamente na página e linha onde o cursor está posicionado no Neovim.
* **`Ctrl + Clique Esquerdo` no Zathura**: *Inverse search* — ao clicar em qualquer palavra ou equação no PDF dentro do Zathura, o Neovim salta diretamente para a linha correspondente no arquivo `.tex`.

---

## 9. Objetos de texto e atalhos essenciais do Vim

### Objetos de texto (Operador + `i/a` + Alvo)
* `ciw`: Apaga a palavra atual e entra em modo de inserção (*change inside word*).
* `caw`: Apaga a palavra atual e o espaço seguinte.
* `ci"` ou `ci'`: Altera o texto dentro das aspas.
* `ci(` ou `cib`: Altera o texto dentro dos parênteses.
* `ci{` ou `ciB`: Altera o conteúdo de um bloco de chaves.
* `cit`: Altera o conteúdo de uma tag HTML/JSX (`<div>conteúdo</div>`).
* `dat`: Deleta a tag HTML/JSX inteira com seu conteúdo ao redor.
* `vip`: Seleciona todo o parágrafo atual em modo visual.
* `yap`: Copia o parágrafo inteiro sem mover o cursor.
