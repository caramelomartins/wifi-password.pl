# wifi-password.pl

Show your wifi password. Fast and easy. Inspired by
[wifi-password](https://github.com/rauchg/wifi-password) - shameless rip-off
would be more accurate.

**Status:**  
[![Build Status](https://travis-ci.org/caramelomartins/wifi-password.pl.svg?branch=master)](https://travis-ci.org/caramelomartins/wifi-password.pl)

## Why Perl?

Other languages could've been more suitable (`bash`...) but I wanted to fiddle with
Perl and it comes pre-installed with Ubuntu from start.

For fun, I chose Perl.

## Installation

Run the following snippet:

```shell
curl -o ~/bin/wifi-password.pl https://raw.githubusercontent.com/caramelomartins/wifi-password.pl/master/wifi-password.pl
&& chmod +x ~/.bin/wifi-password.pl
```

If you don't have `~/bin/` change it to whatever folder you have in your $PATH.

For now that's all there is to it.

## Usage

Get password for current wifi:

```shell
$ wifi-password.pl
```

Get password for a specific SSID:

```shell
$ wifi-password.pl [SSID]
```

## Requirements

The script relies on the following dependencies - which are usually pre-installed
I believe:

- [perl 5](https://www.perl.org/)
- [nmcli](http://linux.die.net/man/1/nmcli)
- [cat](http://linux.die.net/man/1/cat)
- [grep](http://linux.die.net/man/1/grep)
- [sed](http://linux.die.net/man/1/sed)

## Support

As of this moment it was only tested in the following distributions:

- Ubuntu 16.04

Testing in other distributions would be more than welcome.

## TODO

- [x] Error handling.
- [x] Easy installation (maybe a bash script).

## Contribute

Contributions are more than welcome. Just submit a pull request.

## License

[MIT](https://opensource.org/licenses/MIT)
