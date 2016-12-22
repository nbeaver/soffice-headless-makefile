Conversion using ``soffice --headless`` fails silently.

https://bugs.documentfoundation.org/show_bug.cgi?id=37531

Workaround is to use this flag::

    -env:UserInstallation=file:///tmp

That only allows for one instance, though, so it is not suitable for concurrent usage.
This `<Makefile>`_ calls ``mktemp`` to generate a new temporary directory
each time ``soffice`` is called, ensuring each instance can run independently.
For example, this will correctly convert every file::

    make -j 8
