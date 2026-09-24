# ⚡ Foundation — AI Agent Briefing

> Este é o **repositório hub** do ecossistema **Foundation** de Gabriel Frigo. Ele orquestra os repositórios fundamentais de utilitários POSIX de baixo nível, acervo digital de ciência da computação e bases textuais puras.

---

## 🧭 1. Identidade e Papel

O **Foundation** é o **meta-repositório e ponto de entrada** para a base estável do ecossistema. Ele centraliza a governança, integridade de submódulos e orquestração de testes cruzados dos três pilares fundamentais:

| Componente                  | Papel                                                                                                | Repositório Remoto         |
| :-------------------------- | :--------------------------------------------------------------------------------------------------- | :------------------------- |
| **[`Sysutils`](Sysutils/)** | Utilitários de sistema C99/POSIX com foco em elevação segura de privilégios (`rtdo`/`rtgo`)          | `GabrielFrigo4/core-posix` |
| **[`Library`](Library/)**   | Acervo técnico curado e preservação digital de obras em Ciência da Computação, Matemática e Sistemas | `GabrielFrigo4/core-tech`  |
| **[`Raw Text`](Raw Text/)** | Base em texto puro, manifestos, handbooks e templates de engenharia                                  | `GabrielFrigo4/raw-data`   |

---

## ⚠️ 2. Regras Críticas para Agentes de IA

1. **A Regra de Ouro:** Ao entrar em qualquer sub-repositório (`Sysutils`, `Library`, `Raw Text`), leia seus respectivos `AGENTS.md` e `PRINCIPLES.md` antes de efetuar alterações.
2. **Autonomia Federada:** Cada sub-repositório é independente. Commits, tags e branches de código de produção devem ser efetuados dentro do respectivo submódulo.
3. **Hermetismo de Produção (`rm -rf .agents`):** O código de produção e automações de build NUNCA devem depender de diretórios `.agents/`. Se deletado, todo o repositório deve compilar e rodar com perfeição.
4. **Makefile como Orquestrador:** Comandos em lote (`make pull`, `make status`, `make test`, `make audit`) devem ser disparados a partir da raiz deste hub.
5. **Zero-Tweaks Invariant:** O repositório deve ser 100% navegável imediatamente após um `git clone --recursive`.

---

## 🌲 3. Estrutura do Repositório

```
Foundation/
├── .agents/                   # Governança e runbooks locais de IA
├── .githooks/                 # Quality gates de pre-commit e commit-msg
├── .github/                   # Workflows de CI
├── Library/                   # Acervo e catalogação de obras clássicas
├── Raw Text/                  # Documentos, manifestos e conhecimento puro
├── Sysutils/                  # Utilitários C99/POSIX de sistema
├── AGENTS.md                  # Este briefing de engenharia
├── LICENSE                    # Licença MIT
├── Makefile                   # Orquestrador POSIX silencioso
├── PRINCIPLES.md              # 18 Princípios de Engenharia adaptados
└── README.md                  # Apresentação executiva do Foundation Hub
```

---

## ⚡ 4. Comandos de Verificação Rápida

| Comando       | Finalidade                                        |
| :------------ | :------------------------------------------------ |
| `make help`   | Exibe o catálogo completo de tarefas operacionais |
| `make status` | Inspeciona o estado Git de todos os submódulos    |
| `make pull`   | Sincroniza todos os submódulos com seus remotos   |
| `make test`   | Valida sintaxe de scripts e conformidade          |
| `make audit`  | Executa rotinas de auditoria nos componentes      |
