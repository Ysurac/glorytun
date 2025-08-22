AC_PREREQ(2.59)
AC_INIT([glorytun],
        [m4_esyscmd([./version.sh])],
        [https://github.com/angt/glorytun/issues],
        [glorytun],
        [https://github.com/angt/glorytun])
AC_DEFINE_UNQUOTED([VERSION_MAJOR], [m4_esyscmd([./version.sh major])])
AC_CONFIG_AUX_DIR(m4)
AC_CONFIG_SRCDIR([src/common.h])
AM_MAINTAINER_MODE

AC_PROG_CC

AM_INIT_AUTOMAKE(subdir-objects)
# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_MEMCMP

AC_SEARCH_LIBS([getaddrinfo], [resolv nsl])
AC_SEARCH_LIBS([socket], [socket])
AC_CHECK_LIB([rt], [clock_gettime])
AC_CHECK_FUNCS([clock_gettime])
PKG_CHECK_MODULES([libsodium], [libsodium >= 1.0.4])
AC_CONFIG_FILES(Makefile)
AC_OUTPUT
