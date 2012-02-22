### About

Although we expect our favourite websites on the internet to run all the time,
sometimes it is just not the case for variety of reasons. For the system 
administrators it is useful to know, that the website is not working any more.
And there are a lot of tools which do monitor just that.

Bus as a user, it is sometimes frustrating to sit in front of a timeout page
of the browser hitting the 'reload' button.

_IsUpYet_ is a small program, which does the reloading for us in the background.
It tries to check if the webpage is online and if yes, notifies you via growl
message.

### Requirements

* OS X with [Growl](http://growl.info) installed
* [growlnotify](http://growl.info/extras.php#growlnotify) command-line program

### Usage

The program is written in haskell. I've created it on GHC 7.0.3.

For now, 

- please clone the repository
- run `cabal install`
- run the program `isupyet <hostname>`