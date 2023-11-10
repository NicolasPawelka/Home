#include <string>
#include <sstream>
#include <iostream>
#include <csignal>
#include <mqueue.h>
#include <unistd.h>
#include <fcntl.h>

using namespace std;

int main (){
    const int MSG_SIZE = 100;
    const string CLIENT = "/client";
    string sqname_server = "/server";
    mqd_t mq_client, mq_server;
    int bytes_read;

    struct mq_attr attr;
    attr.mq_flags = 0;
    attr.mq_maxmsg = 10;
    attr.mq_msgsize = MSG_SIZE;
    attr.mq_curmsgs = 0;

    mq_server = mq_open(sqname_server.c_str(), O_CREAT | O_RDONLY, 0644, &attr);

    mq_client = mq_open(CLIENT.c_str(),O_WRONLY);

    while (true) {
        string message;
        int erg;
        string client;
        string oper;
        int a = 0;
        int b = 0;

        char* buffer = new char[MSG_SIZE];
        if ((bytes_read = mq_receive(mq_server, buffer, MSG_SIZE, NULL)) == -1){
            perror("SERVER RECEIVE");
            return -1;
        }
        message = buffer;
        delete[] buffer;

        if (mq_send(mq_client, message.c_str(), MSG_SIZE, 0) == -1) {
            perror("SERVER SEND");
            return -1;
        }

        stringstream sstr(message);
        sstr >> client >> oper >> a >> b;
        if(oper == "+"){
            erg = a + b;
        }
        else{ 
            erg = a - b;
        }
        
        message = sqname_server + " " + to_string(erg);
    }

    return 0;
}