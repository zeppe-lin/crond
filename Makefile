include config.mk

LIBS = ealloc.c eprintf.c strsep.c

all:	crond crond.8

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@

crond:
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $@.c $(LIBS) $(LDLIBS)

install: all
	install -m 0755 -D -t $(DESTDIR)$(PREFIX)/sbin     crond
	install -m 0644 -D -t $(DESTDIR)$(MANPREFIX)/man8  crond.8

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/sbin/crond
	rm -f $(DESTDIR)$(MANPREFIX)/man8/crond.8

clean:
	rm -f cron cron.1 *.o

.PHONY:
	all install uninstall clean
