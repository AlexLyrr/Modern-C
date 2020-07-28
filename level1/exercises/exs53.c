/*
Observe the behavior of the program by running it with zero,
 one, and two command-line arguments.
*/


/**
 * With zero arguments: Everything is flushed immediately to stdout
 * With 1 argument: Only the first sentence is flushed immediately
 * to stdout. The dots appear after program termination.
 * With 2 or more arguments: Nothing is flushed to stdout untl
 * program termination
 *
 * Note: Perhaps with abort() the string may never gets flushed
 */

# include <stdio.h>
/* delay execution with some crude code ,
should use thrd_sleep , once we have that */
void delay(double secs) {
    double const magic = 4E8; // works just on my machine
    unsigned long long const nano = secs * magic ;
    for (unsigned long volatile count = 0;
            count < nano ;
            ++ count) {
        /* nothing here */
    }
}
int main(int argc , char* argv [ argc + 1]) {
    fputs(" waiting  10  seconds  for  you to  stop  me", stdout);
    if (argc < 3) fflush(stdout);
    for (unsigned i = 0; i < 10; ++i) {
        fputc('.', stdout);
        if (argc < 2) fflush(stdout);
        delay(1.0) ;
    }
    fputs("\n", stdout);
    fputs(" You  did   ignore  me , so  bye  bye\n", stdout);
    return 0;
}
