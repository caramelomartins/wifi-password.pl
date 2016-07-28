# wifi-password

**_As of this moment, it will require you to give super user permissions because NetworkManager files need to be accessed and I wasn't able to figure out a way yet to not need it._**

Show your wifi password. Fast and easy. Inspired by [wifi-password](https://github.com/rauchg/wifi-password) - shameless rip-off would be more accurate.

### Why Perl?
Other languages could've been more suitable (`bash`...) but I wanted to fiddle with Perl and it comes pre-installed with Ubuntu from start.

For fun, I chose Perl.

## Installation

Run the following snippet:

```shell
curl -o wifi-password.pl https://raw.githubusercontent.com/caramelomartins/wifi-password.pl/master/wifi-password.pl
```
If you wish to run it as a command you will have to move it to a folder in your $PATH and then make it executable:

```shell
chmod +x wifi-password
mv wifi-password.pl /path/to/folder/wifi-password.pl
```

For now that's all there is to it.

## Usage

Get password for current wifi:

```shell
$ wifi-password.pl
```

or

```shell
$ perl wifi-password.pl
```

Get password for a specific SSID:

```shell
$ wifi-password.pl [SSID]
```
or

```shell
$ perl wifi-password.pl [SSID]
```

## Requirements

The script relies on the following dependencies - which are usually pre-installed I believe:

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
- [ ] Easy installation (maybe a bash script).

## Contribute
Contributions are more than welcome. Just submit a pull request.

## License
[MIT](https://opensource.org/licenses/MIT)
