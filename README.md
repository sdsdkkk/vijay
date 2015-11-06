# Vijay

![Yes, it's Inspector Vijay](http://f.tqn.com/y/bollywood/1/S/M/-/-/-/Inspector-Vijay-Khanna-in-Zanjeer.jpg)

## Installation

```
gem install vijay
```

## Usage

Run Vijay using this command.

```
vijay config.yml
```

The config must be a YAML file with the following format.

```yml
servers:
  172.16.0.1:
    user: someuser
    pass: somepass
  172.16.0.2:
    user: someuser
    pass: somepass
files:
  /etc/hosts: c00db144055821cd01c1cd087fc7ad1e
  /etc/resolv.conf: afb773b653b26779358391137d0fbcc0
```

Sample output:

```
[Vijay] Inspection started at 2015-11-06 23:11:45 +0700 and finished at 2015-11-06 23:11:47 +0700
[Vijay] Inspection conducted in 1 server(s) for 2 file(s)
[Vijay] Files altered on host 172.16.0.1:
[Vijay] - /etc/resolv.conf
```

## License

MIT License

## Author

[Edwin Tunggawan](http://github.com/sdsdkkk)
