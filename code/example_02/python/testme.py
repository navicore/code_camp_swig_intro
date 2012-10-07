#!/usr/bin/python
import holder

myobj = holder.Object();

m = "rusty is a cowboy!";

myobj.setText(m);

r = myobj.getText();

if m != r: raise AsertionError

print "m and r should be the same:"
print "     m=", m
print "     r=", r

myholder = holder.ObjectHolder();
#myholder.setObject("hiya");
myholder.setObject(myobj);

other = myholder.getObject();
if other.getText() != r: raise AsertionError

