Practical Guide
===============================================================================

Poor management of cloud resources may cause unnecessary resource provisioning,
misconfigured infrastructure and delays in troubleshooting of cloud components.
Nowdays, however, cloud providers distribute several software development tools
and APIs to enable proper handling of cloud resources by managing them
automatic and programmable. 

This section explains technical details of managing cloud resources using
Python and REST APIs by walk-through of the serverless deployment experience.
General comparisons will be provided at the end to give some idea of deploying
applications on these cloud providers as a beginner. The differences and
similarities are also demonstrated.

Account Authentication 
-------------------------------------------------------------------------------

Oracle User Credentials:

- IAM
- console password
- api signing key 
- Swift password
- Amazon S3 Compatibility API Keys
- SMTP Credentials  

AWS EC2 User Credentials:

- IAM
- Multi-Factor Authentication (MFA) for AWS websites
- Access Keys (id and secret key pairs)
- CloudFront key Pairs
- X.509 certificate

System Choice
-------------------------------------------------------------------------------

Operating Systems

- Windows
- Linux distributions

Server Types

- general
- cpu intensive
- io intensive
- bare metal

Account Limit
-------------------------------------------------------------------------------

AWS API Limits

- 10k requests/sec

AWS EC2 Limits

- 5 public ips/classic ec2 instance
- 5k key pairs  


Supported Development Tools
-------------------------------------------------------------------------------

Oracle:

- Python SDK: https://github.com/oracle/oci-python-sdk
- CLIs:  http://API_URL/tools/Linux/install-IaaS-CLI.sh

AWS:

- Python SDK: https://github.com/boto/boto3
- CLIs: https://github.com/aws/aws-cli

Comparisons
-------------------------------------------------------------------------------

TBD

Summary
-------------------------------------------------------------------------------

TBD
