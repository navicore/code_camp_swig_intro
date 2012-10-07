#!/usr/bin/ruby
require 'holder'

myobj = Holder::Object.new();

m = "rusty is a cowboy";

myobj.setText(m);

r = myobj.getText();

print "m and r should be the same:\n"
print "     m=", m,"\n"
print "     r=", r,"\n"

myholder = Holder::ObjectHolder.new();
#myholder.setObject("hiya");
myholder.setObject(myobj);

