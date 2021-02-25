include config.mk

LIBS = ealloc.c eprintf.c strsep.c

all:	cron cron.1

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@

cron:
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $@.c $(LIBS) $(LDLIBS)

install: all
	install -m 0755 -D cron    $(DESTDIR)$(PREFIX)/bin/cron
	install -m 0644 -D cron.1  $(DESTDIR)$(MANPREFIX)/man1/cron.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cron
	rm -f $(DESTDIR)$(MANPREFIX)/man1/cron.1

clean:
	rm -f cron cron.1 *.o

.PHONY:
	all install uninstall clean
