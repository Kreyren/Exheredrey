# Exheredrey
krey's personal repository on exherbo

This is overlay ~~or how do you call that on exherbo~~ of exherbo packages + tweaks for personal usage.

##TODOs
Sync with Arbor(system packages), Hasufell (OpenRC), others? That automatically merge into master if no conflicts; else make TODO in TODO.md asking for resolution with required info.
1.1) Add Arbor branch
1.1.1) Sync Arbor branch with master
1.2) Add Hasufell branch
1.2.1) Sync Hasufell with master


Sanitize everything with custom errors to make maintainance faster, bigger, better, stronger, faster, bigger, better, stronger!
2.1) Rewrite everything in a way that won't be affected by future changes, commit in master assuming that those changes are hard to diagnose to provide required logic based on gentoo?


LOW_PRIO: Adapt logic from Gentoo's RXT067 project to automatically make version bumps if no conflicts are provided
3.2) LOW_PRIO: Try to add dependendies if recognized error is grabbed.


EXPERIMENT: Adapt custom Tensorflow IA to resolve issues depending on context.


HIGH_PRIO: Adapt passive compilation using MuQSS scaling and give paludis full power on jobs that won't hardbrick system nor affect end-user task on DREAMON.


LOW_PRIO: Mirror with Github

LOW_PRIO: Integrate pbins (https://paludis.exherbo.org/overview/pbins.html)

HIGH_PRIO: Exherbo doesn't provide checksum -> Integrate

### Installation (WIP)
Parse following in /etc/paludis/repositories/exheredrey.conf
```conf
format = e
location = /var/db/paludis/repositories/exheredrey
sync = git+ssh://git@gitlab.exherbo.org/kreyren/exheredrey.git
```

TODO: Push in unavailable so that it can be grabbed using `cave resolve -x1 repository/exheredrey` once it's worth sharing

### Code Of Conduct (WIP)
1) DevOps everything -> Make everything automatic
