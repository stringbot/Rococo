Rococo
======

Rococo fetches a provided GitHub source (blob) url, runs it through Rocco and
then opens it in your local browser.

Install it in a script directory and chmod it +x, then call it like

<pre>
  $ rococo.rb http://github.com/path/to/blob/file.rb
</pre>

Dependencies
------------
* Rocco [https://github.com/rtomayko/rocco]()
* Pygments [http://pygments.org/]()

TODO's
------

* Right now it only works on Mac OS X because it uses the system command 'open' to display the output in your browser.

* Maybe make it suck down a whole repo and rocco-fy it instead of dealing with individual files?

Thanks
------

Super props to Ryan Tomayko for [Rocco](https://github.com/rtomayko/rocco) and Jeremy Ashkenas for [Docco](http://jashkenas.github.com/docco/).
