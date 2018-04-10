Development Schedule
===============================================================================

This page shows a list of items to achieve during this experiment with the
tentative date. Changes may occur based on discussions. 

- Schedule: 04/02/2018 - 05/04/2018 (1 month)


Installation & Configuration
-------------------------------------------------------------------------------

Multi-node installation is desired with DevOps tools to demonstrate a
repeatable cluster setup at any platform.

Two versions of OpenWhisk installation:

- standalone deployment, Apr 9th, 2018
    - Automation with Terraform  (https://github.com/oracle/terraform-provider-oci)
    - Configuration by Ansible
- Cluster setup with 3+ nodes, Apr 13th
    - by kubernetes pods (https://github.com/apache/incubator-openwhisk-deploy-kube)

Applications
-------------------------------------------------------------------------------

Three applications from different domains would be integrated to depict
use cases.

- Big Data Benchmark from UC Berkely AMPLab, Apr 13th
- Tensorflow ImageNet, MNIST, Apr 20th
- Genomics tool, Rail-RNA sequencing alignment, Apr 20th

Platform
-------------------------------------------------------------------------------

Various server types will be tested between the selected platforms.
The current setups are:

- AWS EC2 i3 vs OCI with object storage, Apr 20th

Practical Guide
-------------------------------------------------------------------------------

The purpose of this section is to share lessons that we learned during this
experiment regarding to software development on public clouds. Comparisons to
development environments would be provided as well. For example, we demonstrate
the differences of between using AWS botocore API and Oracle oci SDK regarding
to virtual machine management e.g. start, stop, or terminate.

- API Usage Guide
- CLI Usage Guide
- Community Support
- Documentation, Apr 27th (above all)

Final Report
-------------------------------------------------------------------------------

This experiment will generate a final report which includes information that we
have collected and tested such as system configuration, devops scripts,
experiment results and summary of what we found during this activity, focusing
on software development and experiences.

- due on May 4th

