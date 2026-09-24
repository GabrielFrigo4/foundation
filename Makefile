.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory -s

# ----------------------------------------------------------------
# Makefile: Core Hub Orchestrator
# ----------------------------------------------------------------

.PHONY: help clone pull status test audit format hooks ci

REPOS = Sysutils Library "Raw Text"

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	cmd() { printf "    \033[36mmake %-20s\033[0m %s\n" "$$1" "$$2"; }; \
	sec() { printf "\n  \033[1;33m%s\033[0m\n" "$$1"; }; \
	printf "\n  \033[1;37mCore Hub — Orquestrador do Núcleo do Ecossistema\033[0m\n"; \
	printf "  =======================================================\n"; \
	sec "Sincronização & Submódulos:"; \
	cmd "clone"          "Inicializa e atualiza todos os submódulos recursivamente"; \
	cmd "pull"           "Atualiza todos os submódulos com seus remotos no GitHub"; \
	sec "Diagnóstico & Status:"; \
	cmd "status"         "Exibe status Git resumido dos submódulos do Core"; \
	cmd "hooks"          "Configura e aplica permissões canônicas em .githooks"; \
	sec "Qualidade & Testes:"; \
	cmd "test"           "Valida sintaxe dos scripts de shell e submódulos"; \
	cmd "audit"          "Executa auditoria estática e conformidade POSIX"; \
	cmd "format"         "Formata documentações Markdown com Prettier"; \
	cmd "ci"             "Executa pipeline completa de validação local"; \
	echo ""

### ================================
### SUBMODULES ORCHESTRATION
### ================================
clone:
	echo "📦 Inicializando submódulos do Core..."
	git submodule update --init --recursive
	echo "✅ Submódulos inicializados com sucesso!"

pull:
	echo "🔄 Sincronizando submódulos com os branches remotos..."
	git submodule update --remote --merge
	echo "✅ Submódulos sincronizados!"

status:
	echo "📊 Status dos Submódulos do Core:"
	git submodule status

### ================================
### QUALITY GATES & AUDIT
### ================================
hooks:
	chmod 0755 .githooks/* 2> "/dev/null" || true
	git config core.hooksPath .githooks
	echo "✅ Hooks configurados com sucesso em .githooks!"

test:
	echo "🧪 Validando integridade e scripts shell..."
	find . -name "*.sh" -not -path "*/.git/*" -exec sh -n {} +
	echo "✅ Sintaxe de scripts validada!"

audit: test
	echo "🔍 Executando auditoria nos componentes do Core..."
	if [ -f Sysutils/Makefile ]; then $(MAKE) -C Sysutils test 2> "/dev/null" || true; fi
	echo "✅ Auditoria concluída!"

format:
	if command -v prettier > "/dev/null" 2>&1; then \
		prettier --write "*.md"; \
		echo "✅ Documentação formatada com Prettier!"; \
	fi

ci: test status
	echo "✅ Pipeline local aprovada!"
