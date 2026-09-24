# 🗺️ Roadmap & Backlog do Foundation Hub

> Planejamento estratégico, status operacional e visão de futuro para os utilitários de sistema e acervo técnico de Gabriel Frigo.

---

## 📊 Status dos Módulos & Sistemas

| Módulo       | Foco Operacional                                   | Maturidade | Tecnologias Centrais               |
| :----------- | :------------------------------------------------- | :--------: | :--------------------------------- |
| **Sysutils** | Utilitários de elevação de privilégios e automação | 🟢 Estável | C99, POSIX.1-2024, FreeBSD / Linux |
| **Library**  | Acervo bibliográfico e referências de CS & Math    |  🟢 Ativo  | Git, Markdown, PDF, LaTeX          |
| **Raw Text** | Acervo atemporal de conhecimento em texto puro     |  🟢 Ativo  | Plaintext, ASCII, UTF-8            |
| **Hub**      | Orquestrador de utilitários e governança canônica  | 🟢 Estável | POSIX Makefile, Shell, GitHub CI   |

---

## 🎯 Grandes Épicos do Hub

### 1. ⚙️ Sysutils: `rtdo` e `rtgo`

- [ ] **Hardening de Segurança:** Auditar manipuladores de sinais e sanitização de variáveis de ambiente (`$PATH`, `$IFS`).
- [ ] **Integração com PAM & Capsicum:** Suporte a restrição estrita de privilégios e sandboxing em FreeBSD.
- [ ] **Testes de Regressão Automatizados:** Suíte de testes em C com simulação de privilégios.

### 2. 📚 Library & Raw Text: Acervo Técnico

- [ ] **Catalogação Indexada:** Manter sumário navegável de livros clássicos de algoritmos, sistemas e matemática.
- [ ] **Hermeticidade dos Textos:** Validar que 100% dos textos mantêm conformidade com padrões POSIX / FHS.
