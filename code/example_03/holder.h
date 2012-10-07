#ifndef HELLOWORLD_H
#define HELLOWORLD_H

struct Object;

typedef struct Object {
    //some fields needed for the state of your
    //object, db apis, net connections, etc...

    char *text;

} Object;


struct ObjectHolder;

typedef struct ObjectHolder {

    Object *object;

} ObjectHolder;

#endif

