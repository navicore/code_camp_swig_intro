#!/usr/bin/python
import holder

myobj = holder.Object();

m = "rusty is a cowboy!";

#myobj.setText(None);
myobj.setText(m);

r = myobj.getText();

if m != r: raise AsertionError

print "m and r should be the same:"
print "     m=", m
print "     r=", r

myholder = holder.ObjectHolder();

try:
  #myholder.setObject("hiya");
  myholder.setObject(myobj);
except TypeError as te:
  print("bad type! %s" % te)
except Exception as e:
  print("unknown reason fail! %s" % e)

other = myholder.getObject();
if other.getText() != r: raise AsertionError

