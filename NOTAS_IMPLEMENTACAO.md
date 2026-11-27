# Zelo — notas da revisão funcional

## O que foi ajustado

- **Sessão/login:** cookie de sessão persistente por até 30 dias, timeout de inatividade de 30 dias, rotação do ID ao autenticar e restauração automática do perfil nas telas de login, seleção de perfil e início. Os botões de saída invalidam a sessão no servidor e limpam o estado local.
- **Compromissos:** persistência em banco e API compartilhada entre familiar e idoso; criação, consulta futura e exclusão sincronizadas; validação do familiar vinculado; aviso imediato aos perfis vinculados e lembrete automático nas 24 horas anteriores. A tela do idoso mostra os próximos compromissos, e o painel familiar sincroniza o contador com o backend.
- **Medicamentos temporários:** formulário contínuo/temporário com duração em dias, meses ou anos; validação no backend; expiração comparada no fuso `America/Sao_Paulo` (ajustável com `APP_TIMEZONE`) e remoção física do medicamento e das doses relacionadas após o prazo. A lista familiar é sincronizada com o servidor, e a remoção manual desativa o registro e cancela doses pendentes.
- **Notificações:** cadastro de medicamento notifica o idoso e familiares com vínculo aprovado; compromissos notificam idoso/familiares e recebem lembrete de 24 horas; cada push ganhou identificador próprio para não substituir notificações anteriores. As páginas relevantes carregam o registro do dispositivo Web Push.
- **Consistência e segurança:** removidos IDs fictícios do fluxo de medicamentos, corrigidos o contador de compromissos e a data mínima local, e adicionadas verificações de vínculo/perfil às rotas de medicamentos.

## Antes de publicar

1. Configure `ZELO_API_BASE_URL` em `frontend-vscode/assets/js/api-config.js` com a URL real do backend. O padrão identifica `localhost`/`127.0.0.1` para desenvolvimento.
2. Em produção, use HTTPS, configure `APP_FRONTEND_URL`, `SESSION_COOKIE_SECURE=true`, `SESSION_COOKIE_SAME_SITE=None`, VAPID válido e banco persistente via `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME` e `SPRING_DATASOURCE_PASSWORD`.
3. O navegador precisa permitir notificações e o usuário precisa ativar Web Push em cada dispositivo; uma resposta HTTP aceita pelo provedor não garante exibição no aparelho. Navegadores que bloqueiam cookies de terceiros podem impedir a sessão quando frontend e backend estão em domínios diferentes (por exemplo, Vercel e Render); prefira domínios próprios same-site ou proxy/reverse proxy sob uma origem comum.
4. O cookie dura 30 dias, mas a sessão server-side atual é mantida em memória pelo container. Uma reinicialização/reimplantação do backend encerra sessões existentes; para manter login também através de reinícios, configure Spring Session com JDBC/Redis e banco compartilhado persistente. O perfil local usa H2 em arquivo para desenvolvimento e não deve ser usado como armazenamento de produção.
5. O expurgo temporário também exclui as doses relacionadas para satisfazer a chave estrangeira. Isso elimina o histórico de doses daquele tratamento temporário; se o histórico clínico precisar ser mantido, deve-se substituí-lo por arquivamento/anonimização em tabela própria em vez de exclusão física das doses.

## Verificação executada

`mvn test`: **BUILD SUCCESS**, 3 testes existentes aprovados (0 falhas/erros). Os scripts JavaScript alterados passaram em `node --check`. O fluxo de push real depende das chaves VAPID, do HTTPS e da permissão/configuração do dispositivo no ambiente publicado.


## Correção adicional: eventos criados pelo idoso

Os formulários de **lazer** e **esportes** antes apenas mostravam uma confirmação, sem fazer qualquer chamada de salvamento. Agora exigem data/horário, enviam os dados para `POST /api/compromissos` com a sessão autenticada e só mostram sucesso após a confirmação do backend. Categoria e lembrete são salvos junto ao evento. A API aceita criação pelo idoso somente no próprio perfil, persiste a autoria e envia push para cada familiar com vínculo aprovado; o evento aparece na lista compartilhada do familiar e do idoso. Um teste de regressão foi acrescentado para cobrir gravação e notificação.


## Correção adicional: histórico do sino de notificações

O dropdown da tela de medicamentos familiar dependia apenas de `localStorage` e de um evento Web Push recebido com a página aberta, por isso ficava vazio depois de reabrir o site. Agora todas as chamadas de notificação registram o aviso no banco por usuário antes de tentar o push. `GET /notificacoes` retorna as últimas 50 notificações da sessão atual; `DELETE /notificacoes` limpa somente o histórico da própria conta. O sino carrega do servidor ao abrir, ao receber push e quando a página volta ao foco; erro de sessão/conexão é mostrado no painel, em vez de parecer que não há avisos. Notificações antigas são expurgadas após 90 dias.


## Atualização: chat e notificações imediatas
- Foi criado o chat persistido `tbl_chat_mensagem`, com acesso somente entre familiar e idoso com vínculo aprovado. O backend expõe `GET/POST /api/chat/mensagens` e envia uma notificação ao destinatário a cada mensagem.
- O painel do familiar agora carrega todos os idosos vinculados, permite selecionar um deles, oferece o atalho **Escanear outro idoso** e inclui a conversa na mesma tela.
- O painel do idoso ganhou sino de notificações e conversa com familiar vinculado, com controles grandes e mensagens com leitura ao vivo.
- `chat.js` atualiza mensagens e notificações a cada 2 segundos, além do Web Push já existente, para reduzir a sensação de atraso quando a página está aberta.
- O cookie de sessão local mantém validade de 30 dias; a configuração de produção já usa `max-age` e `timeout` de 30 dias. A persistência após reinício do servidor continua dependendo de Spring Session com JDBC/Redis, conforme a nota anterior.


## Atualização: sincronização automática
As telas de início agora sincronizam automaticamente, sem exigir F5: mensagens, vínculos, notificações e contatos são atualizados enquanto a página está aberta. O chat consulta o backend a cada 2 segundos e os cartões/lista de idosos do familiar a cada 5 segundos; quando um vínculo é criado pelo telefone, ele aparece no chat sem recarregar a página.


## Atualização: acessibilidade por áudio
O chat agora possui leitura em voz alta de cada mensagem, botão para ler a última mensagem, opção de leitura automática de novas mensagens e ditado por microfone para preencher a resposta. O recurso usa as APIs nativas do navegador em português do Brasil; se o navegador não oferecer reconhecimento de voz, a interface informa a limitação sem bloquear o restante do chat.


## Atualização: refinamento visual das páginas iniciais
As telas iniciais receberam uma camada visual dedicada com fundo neutro, hierarquia de conteúdo, blocos primários e secundários, espaçamento mais generoso, sombras suaves, navegação mais clara e contraste consistente. No painel do idoso, as áreas menos usadas ficam recolhidas para reduzir confusão; no familiar, resumo, atalhos, vínculos e conversa têm ritmos visuais distintos. Os controles de áudio permanecem disponíveis nos dois perfis.


## Atualização: autenticação e validações por perfil
- Senhas novas são salvas com BCrypt; senhas legadas em texto puro são migradas para hash no primeiro login válido. Login sem sucesso usa resposta genérica e a sessão é rotacionada ao autenticar.
- O cadastro exige nome, e-mail, telefone nacional válido e senha de pelo menos 8 caracteres com letra e número. Para perfil IDOSO, exige e persiste idade de 1 a 120 anos; para FAMILIAR, idade não é exigida.
- Os dois formulários podem manter o aparelho conectado por até 365 dias. Um cookie `HttpOnly` contém token aleatório; somente o hash é armazenado no banco. O token é renovado durante o uso e revogado ao sair. A opção é marcada por padrão para reduzir a necessidade de lembrar a senha, mas deve ser desativada em dispositivos compartilhados.
- Os perfis só podem alterar/excluir a própria conta. Um familiar só pode consultar o perfil de idoso com vínculo aceito. H2 local foi alterado para arquivo para preservar dados/token entre reinicializações; produção precisa usar banco persistente.
- O valor padrão literal de chave de IA foi removido da configuração. Se o valor que constava no projeto original era real, revogue-o e crie outro segredo no ambiente do backend.


## Atualização: configurações de conta para idoso e familiar
- A nova tela `frontend-vscode/configuracoes.html` é acessível pelos dois painéis e permite editar nome, e-mail e telefone, trocar senha, alterar/remover foto e excluir a conta com confirmação da senha atual.
- As fotos passam pelo navegador em canvas, são redimensionadas e recodificadas para JPEG; o backend limita tamanho e verifica assinatura do arquivo. A imagem e o nome atualizados também aparecem nos painéis.
- Foram adicionadas preferências locais de texto ampliado e alto contraste, ativação de notificações Web Push e revogação de sessões lembradas de todos os dispositivos.
- A troca de senha revoga os tokens de outros dispositivos e renova o do dispositivo atual se ele estava lembrado. A exclusão exige senha atual e confirmação explícita.
- A troca de e-mail é imediata; não há fluxo de verificação de posse do novo endereço no projeto atual.
