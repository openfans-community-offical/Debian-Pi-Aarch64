#### Disable cgroup
- In cmdline.txt remove defined cgoup args and add:
      cgroup_disable=cpuset,cpuacct,blkio,memory,devices,freezer,net_cls,perf_event,net_prio,pids
