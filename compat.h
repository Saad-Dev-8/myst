/* See LICENSE for license details. */
#ifndef COMPAT_H
#define COMPAT_H

#include <stddef.h>

#if defined(__linux__) || defined(__CYGWIN__)
size_t strlcpy(char *dst, const char *src, size_t dsize);
size_t strlcat(char *dst, const char *src, size_t dsize);
#endif

#endif
