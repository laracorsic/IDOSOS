<div align="center">

# 💚 ZELO — Sua saúde nas suas mãos

**Aplicativo web acessível para idosos tomarem seus remédios, organizarem a rotina, pedirem compras e se manterem conectados à família.**

Projeto desenvolvido pela equipe **Bug Hunters** — alunos do **SENAI**

[🌐 Acessar o sistema](https://connecthub-frontend-three.vercel.app/) · [⚙️ API (backend)](https://connecthub-backend-s06j.onrender.com)

</div>

---

## 📑 Sumário

1. [Tema](#-tema)
2. [Contexto e problema](#-contexto-e-problema)
3. [Objetivos](#-objetivos)
4. [Público-alvo e persona](#-público-alvo-e-persona)
5. [Funcionalidades](#-funcionalidades)
6. [Requisitos](#-requisitos)
7. [Design](#-design)
8. [Tecnologias](#-tecnologias)
9. [Arquitetura](#-arquitetura)
10. [Modelagem (fluxograma e diagrama de classes)](#-modelagem)
11. [Como executar](#-como-executar)
12. [Estrutura do repositório](#-estrutura-do-repositório)
13. [Evoluções futuras](#-evoluções-futuras)
14. [Equipe](#-equipe)

---

## 🎯 Tema

**Tecnologia assistiva para o cuidado e a autonomia da pessoa idosa.**

O **ZELO** é um aplicativo web com interface simplificada, pensado para quem tem pouca familiaridade com tecnologia, dificuldade de leitura, de visão ou de memória. Ele conecta o **idoso** ao seu **familiar responsável** por meio de lembretes, painéis de acompanhamento e notificações via **Telegram**.

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
- Eventos futuros e anteriores, edição, exclusão com confirmação e **lembretes pelo Telegram**.

### 🛒 Compras
Uma "lojinha" feita para tocar, não para ler.

- Fluxo: **Ver → Escolher → Quantidade → Carrinho → Enviar**.
- Três categorias grandes: 🧹 Produtos de Limpeza, 🍎 Alimentos e 📦 Itens.
- Produtos apresentados com imagens e ícones; descrição opcional por **áudio**.
- O familiar recebe a lista organizada no Telegram.
- Histórico de compras e opção de repetir uma compra anterior.

### 🗣️ Zelo, o assistente com IA
Companheiro por voz que entende português, abre as telas por comando ("abrir meus remédios"), explica cada página e responde falando (a voz pode ser ligada ou desligada). Ao dizer "socorro", exibe os botões de emergência.

### 🚨 Ajuda e saúde
- Botões de emergência em todas as telas: **Polícia (190)**, **Bombeiros (193)**, **SAMU (192)** e **Familiar**.
- **Médico online:** ligar, escrever o que sente ou gravar um áudio. Depois, o Zelo pergunta se o idoso está bem e, se não estiver, abre a ajuda de emergência.

### 👨‍👩‍👧 Painel da família
- Resumo do dia (remédios tomados, pendentes e compromissos).
- Cadastro de remédios (com cor da gaveta), lembretes e compromissos.
- Avisos na hora (sininho e Telegram).
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
| RF11 | O sistema deve enviar lembretes de eventos pelo Telegram. | Eventos |
| RF12 | O idoso deve poder montar um carrinho escolhendo produtos por imagem, com quantidade e descrição opcional por áudio. | Compras |
| RF13 | O sistema deve enviar a lista de compras ao familiar pelo Telegram. | Compras |
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
| **Notificações** | Telegram Bot API (`telegrambots-spring-boot-starter` 6.8.0), com 4 bots: Hub, Medicamentos, Eventos e Compras |
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
                                   │  • Schedulers de doses,  │        ┌────────────┐
                                   │    eventos e compras     │ ─────▶ │  Telegram  │
                                   │  • Notificadores         │        │  (4 bots)  │
                                   └──────────────────────────┘        └─────┬──────┘
                                                                              │
                                                              Idoso e familiar recebem
                                                              lembretes e alertas
```

**Principais endpoints da API** (prefixos): `/login`, `/usuarios`, `/idosos`, `/familiares`, `/medicamentos`, `/doses`, `/historico`, `/api/vinculos`, `/api/qrcode`, `/api/webapp`, `/telegram/links`.

## 📐 Modelagem

### Fluxograma do sistema

Mostra como o **idoso** e o **familiar** interagem nos quatro grandes processos: vínculo por QR Code, gestão de remédios, carrinho de compras e eventos/lembretes.

![Fluxograma do sistema ZELO](docs/fluxograma.png)

### Diagrama de classes

Representa as principais entidades do domínio (Familiar, Idoso, Remédio, Carrinho de Compra, Evento e Lembrete) e seus relacionamentos.

![Diagrama de classes do ZELO](docs/diagrama-de-classes.png)

## 🚀 Como executar

### Acesso online

| Parte | Link |
| --- | --- |
| Frontend (Vercel) | https://connecthub-frontend-three.vercel.app/ |
| Backend (Render) | https://connecthub-backend-s06j.onrender.com |

> ℹ️ No plano gratuito do Render, a primeira requisição após um período sem uso pode demorar alguns segundos.

### Executar localmente

**Pré-requisitos:** JDK 21, Maven (ou o `mvnw` incluso), PostgreSQL e os tokens dos bots do Telegram.

**1. Backend**

```bash
# entre na pasta do backend
cd connecthub-backend

# defina as variáveis de ambiente (exemplo em Linux/macOS)
export SPRING_DATASOURCE_URL="jdbc:postgresql://localhost:5432/connecthub"
export SPRING_DATASOURCE_USERNAME="seu_usuario"
export SPRING_DATASOURCE_PASSWORD="sua_senha"
export TELEGRAM_BOT_HUB_TOKEN="..."
export TELEGRAM_BOT_MED_TOKEN="..."
export TELEGRAM_BOT_EVENTO_TOKEN="..."
export TELEGRAM_BOT_COMPRA_TOKEN="..."
export APP_FRONTEND_URL="http://localhost:5500"

# execute
./mvnw spring-boot:run
```

A API ficará disponível em `http://localhost:8080`. As tabelas são criadas automaticamente (`ddl-auto=update`); o arquivo `bd-projetos.sql` do repositório também pode ser usado como base.

**Com Docker:**

```bash
docker build -t zelo-backend .
docker run -p 8080:8080 --env-file .env zelo-backend
```

**2. Frontend**

1. Abra a pasta do frontend no **VS Code** e instale a extensão **Live Server**.
2. Clique com o botão direito em `paginainicial/paginainicial.html` e escolha **Open with Live Server**.
3. Não abra o arquivo direto com `file://`, pois o navegador bloqueia as chamadas à API.
4. Confirme que a constante `API_BASE_URL` aponta para `http://localhost:8080`.

**3. Assistente Zelo (opcional)**
Configure a variável `ASSISTENTE_IA_CHAVE` (chave da Groq) antes de iniciar o backend. Sem ela, o assistente funciona em "modo acolhedor", com respostas limitadas.

### 🔐 Segurança das credenciais

Nunca grave senhas de banco ou tokens de bots no código ou no repositório. Use sempre **variáveis de ambiente** (no Render e na Vercel, em *Environment Variables*).

## 📁 Estrutura do repositório

```
IDOSOS/
├── projeto-TCC/                 # versões organizadas do projeto
├── connecthub-backend-*.zip     # backend (Spring Boot)
├── connecthub-frontend-*.zip    # frontend publicado na Vercel
├── Idoso 23.10.zip              # frontend estático (HTML/CSS/JS)
├── ZELO - Landing page.html     # página de apresentação do produto
├── bd-projetos.sql              # script do banco de dados
├── PERSONA_MIQUEIAS.docx        # persona
├── User Stories.docx            # histórias de usuário
├── Logo Equipe.png              # identidade visual da equipe
├── docs/
│   ├── fluxograma.png           # fluxograma do sistema
│   └── diagrama-de-classes.png  # diagrama de classes
└── README.md
```

**Organização do frontend (por tela):**

```
paginainicial/      entrarcomo/        entraridoso/       entrarfamiliar/
inicioidoso/        iniciofamiliar/    remedioidoso/      remediofamiliar/
eventosidoso/       lazeridoso/        esporteidoso/      lembretefamilia/
medicoidoso/        paginasocorro/     jogoidoso/         vinculo/
assistente/         fmlamgsidoso/      bughunters/ (sobre nós e contato)
```

**Organização do backend (`com.auth.simpleauth`):**

```
controller/   REST controllers
service/      regras de negócio, schedulers e notificadores do Telegram
repository/   acesso a dados (Spring Data JPA)
entity/       Usuario, Idoso, Familiar, Medicamento, Dose, VinculoFamiliarIdoso
dto/          objetos de entrada e saída da API
enums/        Perfil, StatusDose, StatusVinculo, TipoTratamento, UnidadeMedida...
config/       CORS, interceptor de autenticação, Telegram, tarefas assíncronas
telegram/     bot principal (ConnectHubBot)
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
