pyseq: Python bindings for libsequence
***************************************************************

This package provides Python_ bindings for the C++11 library libsequence_.

The bindings are implemented using Cython_.

Requirements:
===================================

* libsequence_ must be installed on your system.  **Currently, this package requires the dev branch of libsequence**
* Python 2 or Python 3
* Cython_ must be installed on your system.  (Eventually, this will go away as an installation requirement).
* An up-to-date C++ compiler that is C++11 compatible via the flag -std=c++11.  Roughtly, this means GCC >= 4.8 and clang >= 3.5.

You should install libsequence_ from source and Cython_ via your favorite Python package manager.

Installation:
=======================

.. code-block:: bash

   $ ./configure
   $ sudo python setup.py install

If you have libsequence in a "funny location" (*e.g.*, something other that /usr/local):

.. code-block:: bash

   $ CPPFLAGS=-I/path/to/libsequence/headers LDFLAGS=-L/path/to/libsequence/library sudo python setup.py install

For example, if libsequence is installed into /opt:

.. code-block:: bash

   $ CPPFLAGS=-I/opt/include LDFLAGS=-L/opt/lib sudo python setup.py install

Documentation:
======================

None, yet, except for a few docstrings...

.. _libsequence: http://molpopgen.github.io/libsequence/
.. _Cython: http://www.cython.org/
.. _Python: http://www.cython.org/