#include <stdio.h>
#include <syslog.h>

void write_to_file(char *write_file, char *write_str) {
    FILE *fp = fopen(write_file, "w");
    if (fp != NULL) {
        syslog(LOG_DEBUG, "Writing %s to %s\n", write_str, write_file);
        fclose(fp);
    } else {
        syslog(LOG_ERR, "Cannot create file!");
    }
}

int main(int argc, char *argv[]) {
    openlog(NULL, LOG_NDELAY,LOG_USER);

    if (argc < 3) {
        syslog(LOG_ERR, "Error: Less than 2 arguments were passed.");
        return 1;
    }

    char *write_file = argv[1];
    char *write_str = argv[2];
    write_to_file(write_file, write_str);
    closelog();
}
