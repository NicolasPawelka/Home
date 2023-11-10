#include "listmodel2.h"

listmodel2::listmodel2(QObject* parent):QObject(parent){
    DataBase::readAllUser(m_UserList);
}

QQmlListProperty<User> listmodel2::userlist(){
    return QQmlListProperty<User>(this,&m_UserList);
}

void listmodel2::add(QString name,QString email,QString password,bool isAdmin){
    User* user = new User();
    user->setName(name);
    user->setEmail(email);
    user->setPassword(password);
    user->setCredit(0);
    user->setTo_pay(0);
    user->setKaffee(0);
    user->setIsAdmin(isAdmin);
    m_UserList.push_back(user);
    DataBase::addUser(user);
    emit userlistChanged();
}
int listmodel2::findUser(QString name){
    for(int i = 0; i < m_UserList.size(); ++i){
        if(m_UserList[i]->name() == name){
            return i;
        }
    }
    return -1;
}
bool listmodel2::checkUser(QString name){
    for(int i = 0; i < m_UserList.size(); ++i){
        if(m_UserList[i]->name() == name){
            return false;
        }
    }
    return true;
}
bool listmodel2::deletUser(QString name){
    int var = findUser(name);
    if(var == -1 || m_UserList[var]->isAdmin())
        return false;
    m_UserList.removeAt(var);
    DataBase::deleteUser(name);
    emit userlistChanged();
    return true;
}
bool listmodel2::password(QString name,QString password){
    for(int i = 0; i < m_UserList.size(); ++i){
        qDebug()<<m_UserList[i]->name()<<m_UserList[i]->password()<<m_UserList[i]->isAdmin()<<m_UserList[i]->email();
        if(m_UserList[i]->name() == name && m_UserList[i]->password() == password && m_UserList[i]->isAdmin() == 1)
            return true;
    }
    return false;
}
bool listmodel2::passwordVerify(int i,QString password){
    if(m_UserList[i]->password() == password){
        return true;
    }else{
        return false;
    }

}

bool listmodel2::isEmpty(){
    if(m_UserList.size() == 0)
        return true;
    return false;
}



void listmodel2::change2(int i,double pay){
    qDebug()<<i;
    qDebug()<<pay;
  int newKaffe = m_UserList[i]->kaffee() + 1;
  int newCredit = m_UserList[i]->credit() - pay;
  m_UserList[i]->setKaffee(newKaffe);
  if(newCredit < 0){
      int newToPay = m_UserList[i]->to_pay() + pay;
      m_UserList[i]->setCredit(0);
      m_UserList[i]->setTo_pay(newToPay);
  }else{
      m_UserList[i]->setCredit(newCredit);
  }
  DataBase::changeUser(m_UserList[i]);
  emit userlistChanged();
}
void listmodel2::addCash(int i, double cash){
    int newToPay = m_UserList[i]->to_pay() - cash;
    int newCredit = m_UserList[i]->credit()- newToPay;
    if(newToPay > 0){
        m_UserList[i]->setTo_pay(newToPay);
    }else{
        m_UserList[i]->setTo_pay(0);
        m_UserList[i]->setCredit(newCredit);
    }
    DataBase::changeUser(m_UserList[i]);
    emit userlistChanged();
}
void listmodel2::update(){
    for(int i = 1; i < m_UserList.size();++i ){
        int j = i;
        while((j > 0) && (m_UserList[j-1]->kaffee() < m_UserList[j]->kaffee())){
            User* temp = m_UserList[j-1];
            m_UserList[j-1] = m_UserList[j];
            m_UserList[j] = temp;
            --j;
        }
    }
    emit userlistChanged();
}
