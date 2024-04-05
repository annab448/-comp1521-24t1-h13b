// Method 1 - strerror
#include <errno.h>      // for `errno' values
#include <string.h>     // for `strerror(3)`

errno = ENOENT;
char *error = strerror(errno);
assert(strcmp(error, "No such file or directory") == 0);


// Method 2 - perror (MOST COMMON)
#include <errno.h>      // for `errno' values
#include <stdio.h>      // for `perror(3)'

errno = ENOENT;
perror("");             // prints "No such file or directory"


// NONSTANDARD WAYS
// warn
#include <err.h>        // for `err(3)', `warn(3)', etc.
#include <errno.h>      // for `errno' values

errno = ENOENT;
warn(NULL);             // prints "<progname>: No such file or directory"

// err
#include <err.h>        // for `err(3)', `warn(3)', etc.
#include <errno.h>      // for `errno' values

errno = ENOENT;
err(1, NULL);           // prints "<progname>: No such file or directory"
                        // and terminates the program with exit code 1.

// error
#include <error.h>      // for `error(3)', etc.
#include <errno.h>      // for `errno' values

error(1, ENOENT, NULL); // prints "<progname>: No such file or directory"
                        // and terminates the program with exit code 1.
