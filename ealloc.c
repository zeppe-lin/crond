/* See LICENSE file for copyright and license details. */
#include <stdlib.h>
#include <string.h>

#include "eprintf.h"
#include "ealloc.h"

void *
emalloc(size_t size)
{
	return enmalloc(1, size);
}

char *
estrdup(const char *s)
{
	return enstrdup(1, s);
}

void *
enmalloc(int status, size_t size)
{
	void *p;

	p = malloc(size);
	if (!p)
		enprintf(status, "malloc: out of memory\n");
	return p;
}

char *
enstrdup(int status, const char *s)
{
	char *p;

	p = strdup(s);
	if (!p)
		enprintf(status, "strdup: out of memory\n");
	return p;
}
