undeaD
======

Need an obsolete Phobos module? Here they are, back from the dead and upgraded to work with the latest D

Current modules included:

* std.bitarray
* std.date
* std.datebase
* std.dateparse
* std.regexp
* std.stream and friends
* std.xml

Some individual functions have been moved here rather than full Phobos modules. They are

* undead.doformat: Contains the `doFormat` function from std.format
* undead.string: Contains regex style pattern matching functions from std.string

The dmdsamples folder contains a list of code samples which used to be located 
in the dmd installation directory, but which have not been kept up to date, so
they are now located here as well.

