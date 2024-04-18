Concurrent libart
=================

This library provides a C99 implementation of the Adaptive Radix Tree (ART) 
with added concurrency support using reader-writer locks (rwlocks). 

The ART operates similarly to a traditional radix tree but optimizes memory
usage by dynamically adjusting the node size.

This version of libart ensures thread-safe operations, allowing multiple 
readers alongside single-writer access without compromising performance.

Features
--------

- **Thread-Safe Operations**: Utilizes rwlocks to allow concurrent read access while maintaining exclusive write operations.
- **Low Overhead**: Guarantees overhead no more than 52 bytes per key, often much lower.
- **Efficient Key Operations**: As with the standard ART, operations are O(k), often outperforming hash tables in terms of speed and cache efficiency.
- **Range Queries**: Supports minimum/maximum value lookups.
- **Compression and Iteration**: Offers prefix compression, ordered, and prefix-based iteration.

Usage
-----

### Building the Library

The specific build process for this library follows the original project's setup. For detailed build instructions, please refer to [README_LIBART.md](README_LIBART.md).

Ensure libcheck is available for building the test code:

```bash
$ cd deps/check-0.9.8/
$ ./configure
$ make
# make install
# ldconfig (necessary on some Linux distros)
$ cd ../../
$ scons