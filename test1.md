```
root@raspbian:~/byte-unixbench/UnixBench# cat  result.txt 
========================================================================
   BYTE UNIX Benchmarks (Version 5.1.3)

   System: raspbian: GNU/Linux
   OS: GNU/Linux -- 5.10.33-Release-OPENFANS+20210502-v8 -- #1 SMP PREEMPT Sun May 2 17:19:42 CST 2021
   Machine: aarch64 (unknown)
   Language: en_US.utf8 (charmap="UTF-8", collate="UTF-8")
   20:53:14 up 29 min,  2 users,  load average: 1.50, 2.00, 1.42; runlevel 2021-05-16

------------------------------------------------------------------------
Benchmark Run: 日 5月 16 2021 20:53:14 - 21:38:12
4 CPUs in system; running 1 parallel copy of tests

2D graphics: aa polygons                       2839.7 score (48.5 s, 2 samples)
2D graphics: ellipses                           960.4 score (48.9 s, 2 samples)
2D graphics: images and blits                  2558.8 score (54.3 s, 2 samples)
2D graphics: rectangles                        6188.5 score (55.2 s, 2 samples)
2D graphics: text                             99719.1 score (33.0 s, 2 samples)
2D graphics: windows                             88.7 score (52.3 s, 2 samples)
3D graphics: gears                               59.3 fps   (20.0 s, 2 samples)
Dhrystone 2 using register variables       21177287.9 lps   (10.0 s, 7 samples)
Double-Precision Whetstone                     3796.8 MWIPS (9.2 s, 7 samples)
Execl Throughput                               1685.4 lps   (30.0 s, 2 samples)
File Copy 1024 bufsize 2000 maxblocks        201209.0 KBps  (30.0 s, 2 samples)
File Copy 256 bufsize 500 maxblocks           60867.5 KBps  (30.0 s, 2 samples)
File Copy 4096 bufsize 8000 maxblocks        500742.5 KBps  (30.0 s, 2 samples)
Pipe Throughput                              282004.9 lps   (10.0 s, 7 samples)
Pipe-based Context Switching                  56994.1 lps   (10.0 s, 7 samples)
Process Creation                               2551.2 lps   (30.0 s, 2 samples)
Shell Scripts (1 concurrent)                   3841.3 lpm   (60.0 s, 2 samples)
Shell Scripts (8 concurrent)                    982.4 lpm   (60.0 s, 2 samples)
System Call Overhead                         230644.5 lps   (10.0 s, 7 samples)

System Benchmarks Index Values               BASELINE       RESULT    INDEX
Dhrystone 2 using register variables         116700.0   21177287.9   1814.7
Double-Precision Whetstone                       55.0       3796.8    690.3
Execl Throughput                                 43.0       1685.4    392.0
File Copy 1024 bufsize 2000 maxblocks          3960.0     201209.0    508.1
File Copy 256 bufsize 500 maxblocks            1655.0      60867.5    367.8
File Copy 4096 bufsize 8000 maxblocks          5800.0     500742.5    863.3
Pipe Throughput                               12440.0     282004.9    226.7
Pipe-based Context Switching                   4000.0      56994.1    142.5
Process Creation                                126.0       2551.2    202.5
Shell Scripts (1 concurrent)                     42.4       3841.3    906.0
Shell Scripts (8 concurrent)                      6.0        982.4   1637.3
System Call Overhead                          15000.0     230644.5    153.8
                                                                   ========
System Benchmarks Index Score                                         470.7

3D Graphics Benchmarks Index Values          BASELINE       RESULT    INDEX
3D graphics: gears                               33.4         59.3     17.8
                                                                   ========
3D Graphics Benchmarks Index Score                                     17.8

2D Graphics Benchmarks Index Values          BASELINE       RESULT    INDEX
2D graphics: aa polygons                         15.0       2839.7   1893.2
2D graphics: ellipses                            15.0        960.4    640.3
2D graphics: images and blits                    15.0       2558.8   1705.9
2D graphics: rectangles                          15.0       6188.5   4125.7
2D graphics: text                                15.0      99719.1  66479.4
2D graphics: windows                             15.0         88.7     59.2
                                                                   ========
2D Graphics Benchmarks Index Score                                   1795.9

------------------------------------------------------------------------
Benchmark Run: 日 5月 16 2021 21:38:12 - 22:06:15
4 CPUs in system; running 4 parallel copies of tests

Dhrystone 2 using register variables       88480281.7 lps   (10.0 s, 7 samples)
Double-Precision Whetstone                    15122.1 MWIPS (9.2 s, 7 samples)
Execl Throughput                               4401.1 lps   (30.0 s, 2 samples)
File Copy 1024 bufsize 2000 maxblocks        396935.2 KBps  (30.0 s, 2 samples)
File Copy 256 bufsize 500 maxblocks          116247.5 KBps  (30.0 s, 2 samples)
File Copy 4096 bufsize 8000 maxblocks        813176.6 KBps  (30.0 s, 2 samples)
Pipe Throughput                             1114492.3 lps   (10.0 s, 7 samples)
Pipe-based Context Switching                 210192.0 lps   (10.0 s, 7 samples)
Process Creation                               6670.3 lps   (30.0 s, 2 samples)
Shell Scripts (1 concurrent)                   7827.7 lpm   (60.0 s, 2 samples)
Shell Scripts (8 concurrent)                   1044.7 lpm   (60.1 s, 2 samples)
System Call Overhead                         894303.0 lps   (10.0 s, 7 samples)

System Benchmarks Index Values               BASELINE       RESULT    INDEX
Dhrystone 2 using register variables         116700.0   88480281.7   7581.9
Double-Precision Whetstone                       55.0      15122.1   2749.5
Execl Throughput                                 43.0       4401.1   1023.5
File Copy 1024 bufsize 2000 maxblocks          3960.0     396935.2   1002.4
File Copy 256 bufsize 500 maxblocks            1655.0     116247.5    702.4
File Copy 4096 bufsize 8000 maxblocks          5800.0     813176.6   1402.0
Pipe Throughput                               12440.0    1114492.3    895.9
Pipe-based Context Switching                   4000.0     210192.0    525.5
Process Creation                                126.0       6670.3    529.4
Shell Scripts (1 concurrent)                     42.4       7827.7   1846.2
Shell Scripts (8 concurrent)                      6.0       1044.7   1741.2
System Call Overhead                          15000.0     894303.0    596.2
                                                                   ========
System Benchmarks Index Score                                        1212.1

root@raspbian:~/byte-unixbench/UnixBench# uname -r
5.10.33-Release-OPENFANS+20210502-v8
```
