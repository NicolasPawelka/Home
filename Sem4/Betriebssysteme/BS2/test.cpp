#include <cstddef>
#include <cstdlib>
#include <ostream>
#include <stdio.h>
#include <string>
#include <string.h>
#include <sstream>
#include <iostream>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

using namespace std;

int main (void){
    char *line = NULL, *line_cpy = NULL, *token = NULL;
    const char *delim = " \n";
    size_t n = 0;
    int argc = 0, i = 0, status = 1;
    char **argv = NULL;
    const char* myexit = "exit";
    pid_t pid;

    while (status) {
        pid = fork();

        if(pid == -1){
            perror("Error");
        }
        else if(pid == 0){
            cout<<"myShell> ";
            if(getline(&line,&n,stdin) == -1){
                return -1;
            }
            line_cpy = strdup(line);
            token = strtok(line, delim);
            while (token) {
                token = strtok(NULL, delim);
                argc++;
            }
            argv = (char **) malloc(sizeof(char *) * argc);
            token = strtok(line_cpy, delim);

            while(token){
                argv[i] = token;
                token = strtok(NULL, delim);
                i++;
            }
            argv[i] = NULL;
            i = 0;
            if (strcmp(argv[0] ,myexit) == 0) {
                cout<<"Check 1"<<endl;
                exit (0);
                return 0;
                status = 0;
            }
            int exec_ret = execvp(argv[0],argv);

            if (exec_ret == -1) {
                perror("Error");
            }
        }
        else{
            wait(NULL);
        }
    }
    free(line), free(line_cpy), free(argv);
    return 0;
}