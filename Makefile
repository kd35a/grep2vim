SRC	= ./bin/grep2vim.sh
BIN	= grep2vim

all:
	@echo "Nothing to compile, run 'make install' to install"

install: $(SRC)
	install -m 755 -T $(SRC) ~/bin/$(BIN)

uninstall:
	rm ~/bin/$(BIN)
