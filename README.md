# Exheredrey
Repository addition to Exherbo Linux

### Installation

Parse following in /etc/paludis/repositories/exheredrey.conf
```conf
format = e
location = /var/db/paludis/repositories/exheredrey
sync = git+ssh://git@gitlab.exherbo.org/kreyren/exheredrey.git
```

FIXME: Push in unavailable so that it can be grabbed using `cave resolve -x1 repository/exheredrey` once it's worth sharing