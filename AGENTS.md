# ⚡ Foundation — AI Agent Briefing

> Este é o **repositório hub** do ecossistema **Foundation** de Gabriel Frigo. Ele orquestra os repositórios fundamentais de utilitários POSIX de baixo nível, acervo digital de ciência da computação e bases textuais puras.

---

## 🧭 Identidade e Papel

O **Foundation** é o **meta-repositório e ponto de entrada** para a base estável do ecossistema. Ele centraliza a governança, integridade de submódulos e orquestração de testes cruzados dos três pilares fundamentais:

| Componente                  | Papel                                                                                                | Repositório Remoto         |
| :-------------------------- | :--------------------------------------------------------------------------------------------------- | :------------------------- |
| **[`Sysutils`](Sysutils/)** | Utilitários de sistema C99/POSIX com foco em elevação segura de privilégios (`rtdo`/`rtgo`)          | `GabrielFrigo4/core-posix` |
| **[`Library`](Library/)**   | Acervo técnico curado e preservação digital de obras em Ciência da Computação, Matemática e Sistemas | `GabrielFrigo4/core-tech`  |
| **[`Raw Text`](Raw Text/)** | Base em texto puro, manifestos, handbooks e templates de engenharia                                  | `GabrielFrigo4/raw-data`   |

---

## 📦 Os Repositórios Federados

```text
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
├── PRINCIPLES.md              # 22 Princípios de Engenharia adaptados
├── README.md                  # Apresentação executiva do Foundation Hub
└── TODO.md                    # Matriz de status operacional e roadmap
```

---

## ⚠️ Regras Críticas para Agentes de IA

1. **A Regra de Ouro:** Ao entrar em qualquer sub-repositório (`Sysutils`, `Library`, `Raw Text`), leia seus respectivos `AGENTS.md` e `PRINCIPLES.md` antes de efetuar alterações.
2. **Autonomia Federada:** Cada sub-repositório é independente. Commits, tags e branches de código de produção devem ser efetuados dentro do respectivo submódulo.
3. **Hermetismo de Produção (`rm -rf .agents`):** O código de produção e automações de build NUNCA devem depender de diretórios `.agents/`. Se deletado, todo o repositório deve compilar e rodar com perfeição.
4. **Makefile como Orquestrador:** Comandos em lote (`make pull`, `make status`, `make test`, `make audit`) devem ser disparados a partir da raiz deste hub.
5. **Zero-Tweaks Invariant:** O repositório deve ser 100% navegável imediatamente após um `git clone --recursive`.

---

## 🛡️ Regra da Proatividade e Correção Contínua (Boy Scout Rule)

O agente de IA atua de forma proativa na manutenção e aplicação dos padrões canônicos deste repositório.

Ao identificar linhas ou artefatos fora dos padrões estabelecidos:

1. **Notificar concisamente** o usuário sobre o ajuste realizado.
2. **Corrigir a inconformidade**, aplicando o padrão correspondente:
    - **Comentários Narrativos:** Eliminar comentários óbvios que apenas narram código executável.
    - **Banners Estruturais:** Ajustar réguas para exatamente 64 hífens no topo ou 32 caracteres com `### ` no corpo.
    - **Portabilidade POSIX:** Substituir bashismos (`[[ ]]`, `&>`, arrays, `source`) por sintaxe estrita POSIX `/bin/sh`.
    - **Shebang Universal:** Garantir sempre `#!/usr/bin/env sh` ou `#!/usr/bin/env python3`.
    - **Sequências ANSI & Escapes:** Não use octais (`\033`, `\001`) para caracteres ou escapes. Use `[ -t 1 ] && echo -n $\x27\e...\x27` ou notação hexadecimal (`\x01`, `\x1b`). Octal é exclusivo para permissões POSIX (`chmod 0755`, `chmod 0644`, `umask`).
    - **Redirecionamento Seguro:** Envolver destinos em aspas duplas (ex: `> "/dev/null" 2>&1`).
    - **Makefiles:** Assegurar cabeçalho `.POSIX: .SILENT:`, `MAKEFLAGS += --no-print-directory -s`, alinhamento estético de variáveis e zero `@` redundante.
    - **Permissões Canônicas:** Aplicar 4 dígitos octais (`chmod 0755`, `chmod 0644`, `chmod 0700`, `chmod 0600`).
    - **Invariante Out-of-the-Box:** Garantir modos octais corretos no Git Index e auto-cura em tempo de execução sem requerer intervenção manual pós-clone.
    - **Emissão Semântica de UI:** Substituir `echo` avulsos com emojis pelas rotinas canônicas `_ui_*`.
    - **Antifragilidade & Resiliência:** Resolução ativa de caminhos em cascata, auto-cura de permissões (0600 em chaves/segredos) e validação defensiva de pré-requisitos.
    - **Curadoria Cognitiva:** Capturar decisões estruturais e regras tácitas em skills locais compactas (`.agents/skills/`), mantendo-as atualizadas e expurgando ruído obsoleto.
    - **Refatoração Sem Legado:** Expurgar aliases obsoletos, variáveis mortas e shims de compatibilidade em renomeações.
    - **Elevação Antifrágil & Shift Seguro:** Usar o bloco explícito `if [ "$(id -u)" -ne 0 ]` para resolução de `ELEVATE` (evitando término fatal sob `set -e` como root) e proteger todo comando `shift` com validação prévia de parâmetros (`[ "$#" -ge N ] && shift N`).
    - **Simetria de Documentação:** Mover regras ou invariantes universais documentadas erroneamente em sub-membros específicos para o documento de arquitetura do grupo correspondente, eliminando falsas assimetrias.

---

## 🚀 Comandos de Verificação Rápida (Quality Gates)

| Comando            | Finalidade Operacional                                      |
| :----------------- | :---------------------------------------------------------- |
| `make help`        | Exibe o catálogo completo de tarefas operacionais           |
| `make status`      | Inspeciona o estado Git de todos os submódulos              |
| `make pull`        | Sincroniza todos os submódulos com seus remotos             |
| `make test`        | Valida sintaxe de scripts e conformidade nos submódulos     |
| `make audit`       | Executa rotinas de auditoria nos componentes                |
| `make format`      | Aplica formatação automática em arquivos suportados         |
| `make prettier`    | Formata arquivos Markdown e JSON com Prettier               |
| `make lint-format` | Valida conformidade de formatação sem modificar arquivos    |
| `make hooks`       | Configura permissões e ganchos Git em todos os repositórios |
| `make ci`          | Executa pipeline local completa de validação integrada      |

---

## 📖 Referências Obrigatórias

Antes de qualquer modificação neste ecossistema, consulte:

- [README.md](README.md) — Apresentação executiva do Foundation Hub
- [PRINCIPLES.md](PRINCIPLES.md) — 22 Princípios de Engenharia adaptados
- [TODO.md](TODO.md) — Matriz de status operacional e roadmap
- [LICENSE](LICENSE) — Licença MIT do projeto
