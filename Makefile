CC=cl
CFLAGS=/O2
SOURCES=sudo.c
EXE=sudo.exe

$(EXE): $(SOURCES)
	$(CC) $(CFLAGS) /Fe$(EXE) $(SOURCES)

clean:
	del /q *.obj *.exe
