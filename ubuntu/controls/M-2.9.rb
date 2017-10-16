control "M-2.9" do
  title "2.9 Ensure the default cgroup usage has been confirmed (Scored)"
  desc  "
    The --cgroup-parent option allows you to set the default cgroup parent to
use for all the
    containers. If there is no specific use case, this setting should be left
at its default.
    System administrators typically define cgroups under which containers are
supposed to
    run. Even if cgroups are not explicitly defined by the system
administrators, containers run
    under docker cgroup by default.
    It is possible to attach to a different cgroup other than that is the
default. This usage should
    be monitored and confirmed. By attaching to a different cgroup than the one
that is a
    default, it is possible to share resources unevenly and thus might starve
the host for
    resources.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/reference/commandline/dockerd/#defaultcgroup-parent\n"
  tag "severity": "medium"
  tag "cis_id": "2.9"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 2 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "ps -ef | grep dockerd\nEnsure that the --cgroup-parent
parameter is either not set or is set as appropriate nondefault cgroup.\n"
  tag "fix": "The default setting is good enough and can be left as-is. If you
want to specifically set a nondefault cgroup, pass --cgroup-parent parameter to
the docker daemon when starting it.\nFor Example,\ndockerd
--cgroup-parent=/foobar\n"
  tag "Default Value": "By default, docker daemon uses /docker for fs cgroup
driver and system.slice for\nsystemd cgroup driver.\n"
end
