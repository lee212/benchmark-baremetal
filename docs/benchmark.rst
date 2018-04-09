Benchmark
===============================================================================

This section shows benchmark results among different cloud platforms.

The current platforms included are:

- Amazon EC2
- Oracle Cloud Infrastructure

Concurrent invocations
-------------------------------------------------------------------------------

A thousand of small tasks are given on serverless computing environments to
complete in parallel. CPU-intensive, a file I/O-intensive and heavy network
traffic functions are designed to measure concurrent throughput on these cloud
platforms.

CPU Intensive Function
-------------------------------------------------------------------------------

Javascript function for Matrix multiplication and binary tree creation is
implemented to stress CPU time. 

Network Intensive Function
-------------------------------------------------------------------------------

Downloading a large file from its object storage creates network traffic and
network bandwidth for downloading will be displayed for concurrent executions.

