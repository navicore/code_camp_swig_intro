%module holder

%{
#include "holder.h"
%}

/**
 *  
 * There are two structs here, an "Object" that has one text 
 * field, and an "ObjectHolder" 
 *  
 * The purpose of this code is to show state and type safety. 
 *  
 * When you try to call Object.setText with something that is 
 * not a string, you get an error.  When you try to set 
 * ObjectHolder.setObject with something other than an Object, 
 * you get an error.  Fails fast, very unlike C. 
 *  
 */

typedef struct {
    
    %extend {  //  <--------- swig keyword!

        //
        //constructor
        //
        Object() {
            Object *object;
            object = calloc(1, sizeof(Object));
            //
            //add state stuff here like db and net connections, etc...
            //
            return object;
        }

        //
        //destructor
        //
        ~Object() {
            //
            //cleanup state stuff here like db and net connections, etc...
            //
            if ($self->text) {
                //warning!  a real app would have made a safe copy of text and 
                // probably want to 'free' it here
            }
            free($self);
        }

        //
        //setters
        //
        void setText(char *text) {

            //warning!  a real app would make a safe copy of the object
            $self->text = text;
        }

        //
        //getters
        //
        char *getText() {
            return $self->text;
        }
    }
} Object;

typedef struct {
    
    %extend {

        //
        //constructor
        //
        ObjectHolder() {
            ObjectHolder *holder;
            holder = calloc(1, sizeof(ObjectHolder));
            //
            //add state stuff here like db and net connections, etc...
            //
            return holder;
        }

        //
        //destructor
        //
        ~ObjectHolder() {
            //
            //cleanup state stuff here like db and net connections, etc...
            //
            free($self);
        }

        //
        //setters
        //
        void setObject(Object *object) {

            $self->object = object;
        }

        //
        //getters
        //
        Object *getObject() {
            return $self->object;
        }
    }
} ObjectHolder;

