# docker-centos7-systemd

Build container from command line:
```
    docker build --rm -t centos7-systemd .
```

Run container from command line:
```
    docker run --detach --privileged --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --name centos7-systemd centos7-systemd
```

Exec into container from command line:
```
    docker exec -ti centos7-systemd systemctl --no-pager

UNIT                        LOAD   ACTIVE SUB       DESCRIPTION
proc-sys-fs-binfmt_misc.automount loaded active waiting   Arbitrary Executable File Fo
-.mount                     loaded active mounted   /
dev-hugepages.mount         loaded active mounted   Huge Pages File System
dev-mqueue.mount            loaded active mounted   POSIX Message Queue File Sys
etc-hostname.mount          loaded active mounted   /etc/hostname
etc-hosts.mount             loaded active mounted   /etc/hosts
etc-resolv.conf.mount       loaded active mounted   /etc/resolv.conf
sys-fs-fuse-connections.mount loaded active mounted   FUSE Control File System
sys-kernel-config.mount     loaded active mounted   Configuration File System
sys-kernel-debug.mount      loaded active mounted   Debug File System
systemd-ask-password-console.path loaded active waiting   Dispatch Password Requests t
systemd-ask-password-wall.path loaded active waiting   Forward Password Requests to
dbus.service                loaded active running   D-Bus System Message Bus
systemd-hwdb-update.service loaded active exited    Rebuild Hardware Database
systemd-journal-catalog-update.service loaded active exited    Rebuild Journal Catalog
systemd-journal-flush.service loaded active exited    Flush Journal to Persistent
systemd-journald.service    loaded active running   Journal Service
systemd-logind.service      loaded active running   Login Service
systemd-random-seed.service loaded active exited    Load/Save Random Seed
systemd-sysctl.service      loaded active exited    Apply Kernel Variables
systemd-tmpfiles-setup-dev.service loaded active exited    Create Static Device Nodes i
systemd-tmpfiles-setup.service loaded active exited    Create Volatile Files and Di
systemd-udev-trigger.service loaded active exited    udev Coldplug all Devices
systemd-udevd.service       loaded active running   udev Kernel Device Manager
systemd-update-done.service loaded active exited    Update is Completed
systemd-update-utmp.service loaded active exited    Update UTMP about System Boo
systemd-user-sessions.service loaded active exited    Permit User Sessions
systemd-vconsole-setup.service loaded active exited    Setup Virtual Console
-.slice                     loaded active active    Root Slice
system.slice                loaded active active    System Slice
user.slice                  loaded active active    User and Session Slice
dbus.socket                 loaded active running   D-Bus System Message Bus Soc
systemd-initctl.socket      loaded active listening /dev/initctl Compatibility N
systemd-journald.socket     loaded active running   Journal Socket
systemd-shutdownd.socket    loaded active listening Delayed Shutdown Socket
systemd-udevd-control.socket loaded active running   udev Control Socket
systemd-udevd-kernel.socket loaded active running   udev Kernel Socket
basic.target                loaded active active    Basic System
cryptsetup.target           loaded active active    Local Encrypted Volumes
getty.target                loaded active active    Login Prompts
local-fs-pre.target         loaded active active    Local File Systems (Pre)
local-fs.target             loaded active active    Local File Systems
multi-user.target           loaded active active    Multi-User System
paths.target                loaded active active    Paths
slices.target               loaded active active    Slices
sockets.target              loaded active active    Sockets
swap.target                 loaded active active    Swap
sysinit.target              loaded active active    System Initialization
timers.target               loaded active active    Timers
systemd-tmpfiles-clean.timer loaded active waiting   Daily Cleanup of Temporary D

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

50 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
```

Run from Ansible task:
```
    - name: Run CentOS 7 container that uses systemd
      docker_container:
          name: centos7-systemd
          image: centos7-systemd
          command: /usr/sbin/init
          privileged: true
          volumes:
            - "/sys/fs/cgroup:/sys/fs/cgroup:ro"
          state: started
```

