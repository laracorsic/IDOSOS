<div align="center">

# 💚 ZELO — Sua saúde nas suas mãos

**Aplicativo web acessível para idosos tomarem seus remédios, organizarem a rotina, pedirem compras e se manterem conectados à família.**

Projeto desenvolvido pela equipe **Zelo** — alunos do **SENAI**

[🌐 Acessar o sistema](https://zelo-frontend.onrender.com/) 

</div>

---

## 📦 Pacote consolidado do projeto

Este repositório também reúne a versão consolidada mais recente do ZELO, migrada de [`kevinacorrea/zelo-projeto-integrado`](https://github.com/kevinacorrea/zelo-projeto-integrado). Para preservar os materiais e versões anteriores já existentes neste repositório, o código foi mantido em dois arquivos compactados na raiz:

| Arquivo | Conteúdo |
| --- | --- |
| `frontend-source.zip` | Frontend estático (HTML, CSS e JavaScript), telas do idoso e familiar, jogos, loja e assistente. |
| `backend-source.zip` | API Spring Boot, Maven Wrapper, persistência local H2 e documentação para execução no IntelliJ. |
| `Dockerfile` e `render.yaml` | Build e configuração de implantação do backend. As variáveis marcadas como `sync: false` devem ser configuradas no ambiente de deploy. |
| `NOTAS_IMPLEMENTACAO.md` e `REVISAO_FINAL.md` | Histórico das alterações funcionais, observações de segurança e verificações feitas na origem. |

Os arquivos compactados contêm o código completo. Extraia-os para pastas separadas antes de executar; não é necessário extrair sobrescrevendo os materiais antigos do repositório:

```bash
mkdir -p backend-intellij frontend-vscode
unzip -q backend-source.zip -d backend-intellij
unzip -q frontend-source.zip -d frontend-vscode
```

Consulte também as instruções incluídas nos próprios pacotes: `backend-intellij/COMO_EXECUTAR_INTELLIJ.md` e `frontend-vscode/COMO_EXECUTAR_VSCODE.md`.

---

## 📑 Sumário

1. [Pacote consolidado do projeto](#-pacote-consolidado-do-projeto)
2. [Tema](#-tema)
3. [Contexto e problema](#-contexto-e-problema)
4. [Objetivos](#-objetivos)
5. [Público-alvo e persona](#-público-alvo-e-persona)
6. [Funcionalidades](#-funcionalidades)
7. [Requisitos](#-requisitos)
8. [Design](#-design)
9. [Tecnologias](#-tecnologias)
10. [Arquitetura](#-arquitetura)
11. [Modelagem (fluxograma e diagrama de classes)](#-modelagem)
12. [Como executar](#-como-executar)
13. [Estrutura do repositório](#-estrutura-do-repositório)
14. [Evoluções futuras](#-evoluções-futuras)
15. [Equipe](#-equipe)

---

## 🎯 Tema

**Tecnologia assistiva para o cuidado e a autonomia da pessoa idosa.**

O **ZELO** é um aplicativo web com interface simplificada, pensado para quem tem pouca familiaridade com tecnologia, dificuldade de leitura, de visão ou de memória. Ele conecta o **idoso** ao seu **familiar responsável** por meio de lembretes, painéis de acompanhamento e notificações dentro do próprio aplicativo.

## 🧩 Contexto e problema

Com o envelhecimento, é comum surgirem dificuldades que afetam a rotina:

- esquecer de tomar remédios, ou confundir medicamentos e horários;
- esquecer consultas, contas a pagar e outros compromissos;
- ter dificuldade para escrever listas de compras ou usar teclados;
- não saber a quem recorrer rapidamente em uma emergência;
- depender de ligações constantes da família para saber se está tudo bem.

A maioria dos aplicativos existentes foi desenhada para adultos acostumados com tecnologia: telas cheias de informações, textos pequenos e muitos passos. Para uma parte dos idosos isso se torna uma barreira.

**O ZELO propõe o contrário:** botões grandes e coloridos, poucas escolhas por tela, apoio de imagens, ícones e voz, e uma única ideia por vez.

## 🏁 Objetivos

**Objetivo geral:** oferecer uma plataforma simples e acessível que dê mais autonomia e segurança ao idoso e mais tranquilidade à família.

**Objetivos específicos:**

- Reduzir esquecimentos e erros no uso de medicamentos.
- Organizar a rotina do idoso (consultas, lazer, finanças, compromissos).
- Permitir que o idoso peça compras sem precisar digitar.
- Manter o familiar informado, mesmo à distância, sobre doses não confirmadas e pedidos.
- Dar acesso rápido a ajuda de emergência em todas as telas.
- Estimular memória e atenção com jogos simples.

## 👥 Público-alvo e persona

| Perfil | Descrição |
| --- | --- |
| 👵 **Idoso (usuário principal)** | Pessoa que precisa de apoio com a rotina de medicamentos e atividades, e que pode ter dificuldade com leitura, escrita, visão ou tecnologia. |
| 👨‍👩‍👧 **Familiar / responsável** | Pessoa que acompanha e organiza o cuidado de forma prática, mesmo morando longe. Recomenda-se que o familiar crie e configure a conta do idoso. |

> 📎 A persona detalhada está no arquivo `PERSONA_MIQUEIAS.docx` (na raiz do repositório). *(Se quiser, inclua aqui um resumo: nome, idade, rotina, dores e necessidades.)*

## ✨ Funcionalidades

### 💊 Remédios
O familiar cadastra o medicamento uma única vez e o sistema gera sozinho a agenda de doses.

- Cadastro com nome, dosagem, unidade (comprimido, cápsula, gota, mL, sachê), quantidade por dose, primeiro horário e intervalo (4, 6, 8, 12 ou 24 horas).
- **Identificação visual da caixa por cor e número/letra** (ex.: "🟦 Procure a caixa AZUL com o número 2"), para que o idoso não dependa de ler o nome.
- Lembrete no horário, com botão **"Tomei o remédio"** para confirmar.
- Reenvio do aviso se a dose não for confirmada e **alerta ao familiar** se continuar pendente.
- Tratamentos com **data final** (encerram sozinhos e avisam a família) ou de **uso contínuo** (a agenda se renova automaticamente).
- Cada dose tem um estado: `Pendente`, `Notificado`, `Tomado`, `Atrasado` ou `Cancelado`, com **histórico** completo.

### 📅 Eventos
Uma agenda que faz uma pergunta de cada vez: *O que você vai fazer? → Quando será? → Quer adicionar algo? → Está tudo certo?*

- Categorias: Lazer, Esportes, Atividades físicas, Finanças, Encontros, Compromissos e Compras.
- Data, horário e descrição (inclusive **por áudio**).
- Eventos futuros e anteriores, edição, exclusão com confirmação e **lembretes no próprio aplicativo**.

### 🛒 Compras
Uma "lojinha" feita para tocar, não para ler.

- Fluxo: **Ver → Escolher → Quantidade → Carrinho → Enviar**.
- Três categorias grandes: 🧹 Produtos de Limpeza, 🍎 Alimentos e 📦 Itens.
- Produtos apresentados com imagens e ícones; descrição opcional por **áudio**.
- O familiar recebe a lista organizada e uma notificação no aplicativo.
- Histórico de compras e opção de repetir uma compra anterior.

### 🗣️ Zelo, o assistente com IA
Companheiro por voz que entende português, abre as telas por comando ("abrir meus remédios"), explica cada página e responde falando (a voz pode ser ligada ou desligada). Ao dizer "socorro", exibe os botões de emergência.

### 🚨 Ajuda e saúde
- Botões de emergência em todas as telas: **Polícia (190)**, **Bombeiros (193)**, **SAMU (192)** e **Familiar**.
- **Médico online:** ligar, escrever o que sente ou gravar um áudio. Depois, o Zelo pergunta se o idoso está bem e, se não estiver, abre a ajuda de emergência.

### 👨‍👩‍👧 Painel da família
- Resumo do dia (remédios tomados, pendentes e compromissos).
- Cadastro de remédios (com cor da gaveta), lembretes e compromissos.
- Avisos na hora, pelo sininho de notificações do aplicativo.
- **Vínculo por QR Code:** o idoso mostra o código, o familiar escaneia e as contas ficam conectadas.

### 🎮 Jogos
Cinco jogos simples para exercitar memória e atenção: jogo das frutas, jogo da memória, quebra-cabeça, jogo das cores e jogo de cartas.

## 📋 Requisitos

> Os requisitos abaixo foram levantados a partir dos documentos de especificação dos módulos **Medicamentos**, **Eventos** e **Compras**.

### Requisitos funcionais

| ID | Requisito | Módulo |
| --- | --- | --- |
| RF01 | O sistema deve permitir cadastro e login de idosos e familiares. | Acesso |
| RF02 | O sistema deve vincular um familiar a um idoso (por QR Code ou convite). | Vínculo |
| RF03 | O familiar deve poder cadastrar, editar e desativar medicamentos. | Remédios |
| RF04 | O sistema deve gerar automaticamente a agenda de doses a partir do primeiro horário e do intervalo. | Remédios |
| RF05 | O sistema deve identificar cada medicamento por cor e número/letra da caixa. | Remédios |
| RF06 | O sistema deve enviar lembrete no horário da dose e permitir a confirmação com um toque. | Remédios |
| RF07 | O sistema deve repetir o aviso e notificar o familiar quando a dose não for confirmada. | Remédios |
| RF08 | O sistema deve suportar tratamentos com data final e de uso contínuo. | Remédios |
| RF09 | O sistema deve manter o histórico de cada dose. | Remédios |
| RF10 | O usuário deve poder criar, listar, editar e excluir eventos por categoria, com data, horário e descrição (texto ou áudio). | Eventos |
| RF11 | O sistema deve notificar lembretes de eventos dentro do aplicativo. | Eventos |
| RF12 | O idoso deve poder montar um carrinho escolhendo produtos por imagem, com quantidade e descrição opcional por áudio. | Compras |
| RF13 | O sistema deve enviar a lista de compras ao familiar, com notificação no aplicativo. | Compras |
| RF14 | O sistema deve manter histórico de compras e permitir repetir uma compra. | Compras |
| RF15 | O sistema deve exibir botões de emergência (190, 192, 193 e familiar) em todas as telas. | Ajuda |
| RF16 | O assistente Zelo deve responder a comandos de voz e navegar entre as telas. | Assistente |
| RF17 | O familiar deve acompanhar o resumo do dia e receber avisos de dose, compras e eventos. | Painel |

### Requisitos não funcionais

| ID | Requisito |
| --- | --- |
| RNF01 | **Acessibilidade:** botões grandes, alto contraste, ajuste do tamanho da fonte (A+ / A−) e modo escuro. |
| RNF02 | **Usabilidade:** poucos passos por tarefa, uma decisão por tela, linguagem curta e simples. |
| RNF03 | **Dispensar digitação:** sempre que possível usar imagens, ícones, cores e voz. |
| RNF04 | **Prevenção de erros:** confirmação antes de ações irreversíveis (excluir, enviar compra). |
| RNF05 | **Previsibilidade:** a ordem das perguntas e a posição dos elementos se mantêm iguais entre as telas. |
| RNF06 | **Disponibilidade:** sistema hospedado na nuvem (Vercel e Render), acessível pelo navegador. |
| RNF07 | **Segurança:** sessão por cookie `HttpOnly` e `Secure`, CORS configurado e credenciais fora do código-fonte. |
| RNF08 | **Compatibilidade:** funcionar em navegador de computador e de celular (design responsivo). |

## 🎨 Design

- **Conceito:** "Toque na cor. É só isso." — cada cor leva a uma parte do aplicativo, sem menus escondidos nem letras pequenas.
- **Paleta:** tons de **verde** (identidade do cuidado e da saúde), com cores de apoio fortes para diferenciar áreas e estados (vermelho para emergência, azul, amarelo, roxo e rosa para categorias).
- **Tipografia:** *Bricolage Grotesque*, com fallback para Arial.
- **Recursos de acessibilidade na interface:** botões **A+ / A−** para o tamanho do texto, **modo escuro** e uso intenso de emojis e ícones como segunda forma de reconhecimento.
- **Protótipo e identidade visual:** logo da equipe em `Logo Equipe.png`. *(Se houver protótipo no Figma, coloque o link aqui.)*
- **Landing page:** `ZELO - Landing page.html`, que apresenta o produto com demonstrações interativas.

## 🛠️ Tecnologias

| Camada | Tecnologias |
| --- | --- |
| **Frontend** | HTML5, CSS3 e JavaScript |
| **Backend** | Java 21, Spring Boot 3.2.5 (Spring Web, Spring Data JPA/Hibernate, Bean Validation), Maven |
| **Banco de dados** | PostgreSQL (hospedado no Render); H2 para testes |
| **Notificações** | Notificações internas do aplicativo (sininho e avisos na tela), geradas pelo backend |
| **Vínculo por QR Code** | ZXing (Google) |
| **Assistente de IA** | Groq (modelo de linguagem), voz do navegador (reconhecimento e síntese de fala) |
| **Infraestrutura** | Docker (build multi-stage), Render (backend e banco), Vercel (frontend) |
| **Ferramentas** | Git/GitHub, IntelliJ IDEA, VS Code (Live Server) |

## 🏗️ Arquitetura

```
┌──────────────┐   HTTPS / JSON    ┌──────────────────────────┐        ┌────────────┐
│   Frontend   │ ────────────────▶ │  Backend Spring Boot     │ ─────▶ │ PostgreSQL │
│   (Vercel)   │ ◀──────────────── │  (Render)                │        └────────────┘
└──────────────┘                   │                          │
                                   │  • Schedulers de doses,  │
                                   │    eventos e compras     │
                                   │  • Notificações no app   │
                                   └──────────────────────────┘

                     Idoso e familiar recebem lembretes e alertas
                     dentro do próprio aplicativo (sininho e avisos)
```

**Principais endpoints da API** (prefixos): `/login`, `/usuarios`, `/idosos`, `/familiares`, `/medicamentos`, `/doses`, `/historico`, `/api/vinculos`, `/api/qrcode`, `/api/webapp`.

## 📐 Modelagem

### Fluxograma do sistema

Mostra como o **idoso** e o **familiar** interagem nos quatro grandes processos: vínculo por QR Code, gestão de remédios, carrinho de compras e eventos/lembretes.

![Fluxograma do sistema ZELO](<fluxograma.png>)

### Diagrama de classes

Representa as principais entidades do domínio (Familiar, Idoso, Remédio, Carrinho de Compra, Evento e Lembrete) e seus relacionamentos.

![Diagrama de classes do ZELO](<Diagrama de Classes Familiar e Idoso.png>)

## 🚀 Como executar

### Acesso online

| Parte | Link |
| --- | --- |
| Frontend (endereço indicado pelo projeto) | https://zelo-frontend.onrender.com/ |
| Backend | URL gerada pelo Render conforme a implantação descrita em `render.yaml`. |

> ℹ️ Confirme que a implantação continua ativa antes de distribuir o link. No plano gratuito do Render, a primeira requisição após um período sem uso pode demorar alguns segundos.

### Executar localmente

**Pré-requisitos:** Java 21, VS Code e a extensão Live Server. O Maven Wrapper está incluído no pacote do backend; PostgreSQL não é necessário para desenvolvimento local.

**1. Extraia os pacotes** conforme as instruções da seção [Pacote consolidado do projeto](#-pacote-consolidado-do-projeto).

**2. Inicie o backend** a partir da pasta extraída:

```bash
cd backend-intellij
SPRING_PROFILES_ACTIVE=local ./mvnw spring-boot:run
```

No Windows, use `mvnw.cmd`. O perfil `local` usa H2 em arquivo e a API fica disponível em `http://localhost:8080`. O arquivo local do banco não deve ser versionado.

**3. Inicie o frontend:** abra `frontend-vscode` no VS Code, clique com o botão direito em `paginainicial/paginainicial.html` e escolha **Open with Live Server**. Não abra o arquivo diretamente com `file://`. A URL da API está em `frontend-vscode/assets/js/api-config.js` (`window.ZELO_API_BASE_URL`); para desenvolvimento local, deve apontar para `http://localhost:8080`.

**Assistente Zelo (opcional):** sem `ASSISTENTE_IA_CHAVE`, o backend continua funcionando em modo local limitado. Para respostas generativas, configure uma chave válida somente como variável de ambiente/segredo do backend; nunca a grave nos arquivos do projeto.

**Docker:** o `Dockerfile` na raiz constrói o backend a partir de `backend-source.zip`:

```bash
docker build -t zelo-backend .
# Com as variáveis de banco definidas no ambiente local:
docker run -p 8080:8080 -e SPRING_DATASOURCE_URL \
  -e SPRING_DATASOURCE_USERNAME -e SPRING_DATASOURCE_PASSWORD zelo-backend
```

Para produção, use banco persistente, HTTPS, cookies seguros e configure as variáveis indicadas em `render.yaml`. Veja `NOTAS_IMPLEMENTACAO.md` para limitações e recomendações adicionais de sessão, Web Push e armazenamento.

### 🔐 Segurança das credenciais

Nunca grave senhas de banco ou chaves de API no código ou no repositório. Use sempre **variáveis de ambiente** (no Render e na Vercel, em *Environment Variables*).

## 📁 Estrutura do repositório

```
IDOSOS/
├── .gitignore                    # exclusão de build, banco local e segredos
├── backend-source.zip           # backend consolidado (Spring Boot)
├── frontend-source.zip          # frontend consolidado (HTML/CSS/JavaScript)
├── Dockerfile                   # imagem do backend a partir do ZIP
├── render.yaml                  # configuração de implantação Render
├── NOTAS_IMPLEMENTACAO.md       # notas da revisão funcional e implantação
├── REVISAO_FINAL.md             # correções e verificações da origem
├── projeto-TCC/
│   └── 18_09_2026.zip           # pacote anterior do projeto
├── Projeto-integrado-visual-final-corrigido (2).zip
├── frontend-vscodefinal.zip     # versões anteriores/materiais de referência
├── loja-idosos-demo (2).zip
├── ZELO — Landing Page.html     # página de apresentação
├── ZELO_Roteiro_de_Pitches.pdf
├── ZELO_apresentação.pdf
├── Diagrama de Classes Familiar e Idoso.png
├── fluxograma.png
├── landingPageZelo.png
├── Logo Equipe.png
├── PERSONA_MIQUEIAS.docx
├── link_landingpage.txt
└── README.md
```

Os diretórios executáveis `backend-intellij/` e `frontend-vscode/` são criados ao extrair os dois pacotes principais; eles não são duplicados como pastas na raiz do Git.

**Organização do frontend após extrair `frontend-source.zip` (por tela):**

```
paginainicial/      entrarcomo/        entraridoso/       entrarfamiliar/
inicioidoso/        iniciofamiliar/    remedioidoso/      remediofamiliar/
eventosidoso/       lazeridoso/        esporteidoso/      lembretefamilia/
medicoidoso/        paginasocorro/     jogoidoso/         vinculo/
assistente/         fmlamgsidoso/      bughunters/ (sobre nós e contato)
```

**Organização do backend após extrair `backend-source.zip` (`com.auth.simpleauth`):**

```
controller/   REST controllers
service/      regras de negócio, schedulers e notificações
repository/   acesso a dados (Spring Data JPA)
entity/       Usuario, Idoso, Familiar, Medicamento, Dose, VinculoFamiliarIdoso
dto/          objetos de entrada e saída da API
enums/        Perfil, StatusDose, StatusVinculo, TipoTratamento, UnidadeMedida...
config/       CORS, interceptor de autenticação, tarefas assíncronas
```

## 🔭 Evoluções futuras

- **Compras:** favoritos, controle e leitura por voz, confirmação do familiar.
- **Eventos:** eventos recorrentes (semanais e mensais), mais de um lembrete, local do evento, filtros por categoria e busca.
- Confirmação de participação e compartilhamento de eventos com o familiar.
- Mais jogos e acompanhamento de desempenho cognitivo.

## 👨‍💻 Equipe

**Bug Hunters** — alunos do SENAI

| Integrante | Função no projeto | GitHub |
| --- | --- | --- |
| **Lara** | Documentação, Analista e Full Stack | [@laracorsic](https://github.com/laracorsic) |
| **Kevin Correa** | Full Stack | [@kevinacorrea](https://github.com/kevinacorrea) |
| **Ruan Fernandes da Silva** | Back-end | [@RuanFernandesdaSilva](https://github.com/RuanFernandesdaSilva) |
| **Maria Isabelle** | Front-end | [@mariaisabellecastro](https://github.com/mariaisabellecastro) |

### 🎓 Orientação

| | |
| --- | --- |
| **Professor** | Wesley Pecoraro |
| **Turma** | 2IDS-B |
| **Instituição** | Faculdade de Tecnologia e Escola SENAI Antonio Adolpho Lobbe |

---

<div align="center">

Feito com 💚 para quem cuida e para quem é cuidado.

</div>
