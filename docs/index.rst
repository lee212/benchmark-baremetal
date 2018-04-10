Experiment: Running Apache OpenWhisk for Heavy Workloads on Public Clouds
===============================================================================

.. image:: https://openwhisk.apache.org/images/apache-openwhisk@2x.jpg
   :alt: Apache OpenWhisk
   :width: 200px
   :align: right

Lightweight dynamic applications on cloud computing have been migrated to
serverless computing platforms, such as Apache OpenWhisk, recently due to its
elasticity and simplicity of compute resource provisioning. Mobile
applications, image data processing and system log analysis are implemented as
a stateless function to process given tasks on serverless computing
environments.  For example, less than 300 lines of a Python function with
TensorFlow library identifies a thousand of training image data from ImageNet
Large Visual Recognition Challenge in 2012 within a few seconds using
serverless concurrent function invocations. Functions for heavy workloads with
external libraries, however, would not be loaded on the serverless environments
due to its size and its long execution time. Applications for big data, deep
learning, computer vision and genomics typically require multiple and
complicated libraries along with cpu and data intensive tasks.


We have three objectives to achieve during this experiment:

- Sucessful deployment of Apache OpenWhisk on public clouds to comare its
  behavior with a series of functions for big data, deep learning and genomics
  applications
- Benchmark regarding to concurrent function invocations on IaaS-powered
  serverless computing environments
- Practical guide to building services on public clouds with the experience of
  deploying Apache OpenWhisk. 


Target cloud providers are:

- Oracle Cloud Infrastructure 
- Amazon EC2

Target serverless platform is:

- Apache OpenWhisk

.. image:: https://openwhisk.apache.org/images/illustration-openwhisk.svg
   :alt: openwhisk
   :align: center

.. image:: http://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/41865/Z9Ik6huVSQC0sSJf8To4
   :alt: oracle cloud infrastructure
   :width: 100px
   :align: right 

.. image:: https://signalfx-82c9.kxcdn.com/wp-content/uploads/EC2-logo-full.jpg
   :alt: Amazon EC2
   :width: 100px
   :align: right

.. toctree::
   :maxdepth: 1

   plan
   deployment
   benchmark
   guide
   summary


