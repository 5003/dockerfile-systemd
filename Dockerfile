FROM centos:7
RUN (cd /lib/systemd/system/sysinit.target.wants/; for r in *; do \
    [ $r == systemd-tmpfiles-setup.service ] || rm --force $r; done); \
    rm --force /lib/systemd/system/local-fs.target.wants/*; \
    rm --force /lib/systemd/system/multi-user.target.wants/*; \
    rm --force /lib/systemd/system/sockets.target.wants/systemd-initctl.socket; \
    rm --force /lib/systemd/system/sockets.target.wants/systemd-udevd-*.socket
VOLUME ["/sys/fs/cgroup/"]
CMD ["/usr/sbin/init"]