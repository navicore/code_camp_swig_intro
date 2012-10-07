%module holder

%{
#include "holder.h"
#include "except.h"
#include <assert.h>
#include <stdbool.h>
%}

/**
 * this is a general exception handler. all methods/functions
 * get wrapped by it.
 *  
 */
%exception {
    char *err;
    clear_exception();
    $action
    if ((err = check_exception())) {
#ifdef SWIGPERL
       croak(err);
       return NULL;
#endif
#ifdef SWIGPYTHON
    PyErr_SetString(PyExc_RuntimeError, err);
    return NULL;
#endif
#ifdef SWIGRUBY
    void *runerror = rb_define_class("HolderRuntimeError", rb_eStandardError);
    rb_raise(runerror, err);
    return NULL;
#endif
    }
}

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
            if (text == NULL) {
                throw_exception("text is null!");
                return;
            }
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

