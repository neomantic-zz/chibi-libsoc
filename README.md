# chibi-libsoc

A [chibi-scheme](http://synthcode.com/scheme/chibi/) library binding too
the [libsoc](https://github.com/jackmitch/libsoc) library.

## Features

Chibi-libsoc only supports a small set of calls that libsoc actually
provides. It only supports manipulation of GPIO sockets via libsoc's
sysfs interface.

The following calls are provided by chibi-libsoc.


``` scheme
(gpio-request gpio gpio-mode)
```

Request (reserve, or export to sysfs) a gpio.  Possible values:

* `gpio-mode/shared` - From the original code: "If the gpio is already
  exported then it will not unexport the GPIO on free. If it is not
  exported, then unexport on free."

* `gpio-mode/greedy` - From the original code: the request "will
  succeed if the GPIO is already exported, but will always unexport
  the GPIO on free."

* `gpio-mode/weak` - From the original code: the request "will fail if
  GPIO is already exported, will always unexport on free."

``` scheme
(gpio-free gpio)
```
Frees the gpio

``` scheme
(gpio-direction-set! gpio gpio-direction)
```
Set the direction of the gpio

Direction values are the following: `gpio-direction/output`,
`gpio-direction/input`, `gpio-direction/error`

``` scheme
(gpio-direction-get gpio)
```
Returns current direction

``` scheme
(gpio-level-set! gpio gpio-level)
```
Sets the level of the gpio. Level values ar the following:
`gpio-level/high`, `gpio-level/low`, `gpio-level/error`.

``` schemes
(gpio-level-get gpio)
```
Returns the current level

## FFI Rational

Managing the gpios on the sysfs are relatively straightforward: an app
simply needs to echo strings to the correct files.  This is a task
easily done in plain-ole-scheme, rather than using libsoc. Indeed, the
so file that `chibi-ffi` produces is substantial larger in bytes-size than
simple scheme code.

An alternate motivation guide this project. The purpose was to learn
and understand the limitations chibi-scheme's FFI interface. While
relatively simple, it's FFI requires a stub file, and
compiliation. Additionally it does not support function pointers. (Had
it, this library would have included other bindings to libsoc
functions.)

## Install

### Prerequisites
* [chibi-scheme](http://synthcode.com/scheme/chibi/)
* [libsoc](https://github.com/jackmitch/libsoc) (If you're using a
  debian based distribution, please install the dev package as well as
  the libsoc package.)
* make

### Build

Simply run `make`. (There is also a `make clean` task too).

## Usage
In the `(imports ...)` form, add the following `(libsoc gpio)`

## Example
An example ships with the source code. The example must run
as root since libsoc needs to make calls to the gpio sysfs interface.

`sudo chibi-scheme example.scm`

## Issues and Feature Requests

https://github.com/neomantic/chibi-libsoc/issues

## Author

[Chad Albers](mailto:calbers@neomantic.com)

## License

Like chibi, chibi-libsoc is licensed under the terms of the 3-clause
BSD license.  Consult the COPYING document for the full license.
