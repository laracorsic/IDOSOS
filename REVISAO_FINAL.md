# Revisão final do projeto Zelo

## Correções aplicadas

- Corrigidos os links da página inicial para o módulo Bug Hunters.
- Corrigidos os caminhos do logo e do botão de entrada nas páginas Bug Hunters.
- Corrigido o link para a tela de continuidade do Google.
- Removida a referência duplicada a um `zelo-sync.js` inexistente.
- Removidas referências a `script.js` inexistente nas páginas dos jogos.
- Criada a pasta `frontend-vscode/assets/css/` para estilos compartilhados.
- Criada a pasta `frontend-vscode/assets/js/` para scripts compartilhados.
- Atualizadas as referências dos HTMLs para os novos caminhos.
- Mantido `sw.js` na raiz para preservar corretamente o escopo do Service Worker e das notificações.
- Atualizada a documentação com a nova estrutura do frontend.
- Corrigidas as instruções que descreviam incorretamente o H2 local como banco em memória; o perfil local usa H2 em arquivo.

## Validações realizadas

- Todos os 31 arquivos HTML foram carregados por servidor HTTP local com resposta 200.
- Não foram encontradas referências quebradas em `src` ou `href` dos HTMLs.
- Todos os arquivos JavaScript passaram em `node --check`.
- Nenhum arquivo de banco local foi incluído no pacote final.

## Observação sobre o backend

Os testes Maven precisam ser executados em uma máquina com JDK completo, incluindo `javac` 21. O ambiente utilizado para a revisão possuía o runtime Java 21, mas não possuía o compilador Java; por isso a compilação Maven não pôde ser concluída aqui.
