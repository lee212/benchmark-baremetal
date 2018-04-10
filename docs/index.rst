.. OpenWhisk Experiment documentation master file, created by
   sphinx-quickstart on Sun Apr  8 22:37:00 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Experiment: Running Apache OpenWhisk for Heavy Workloads on Public Clouds
===============================================================================

Overview
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

Objective
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We have three objectives to achieve during this experiment:

- Sucessful deployment of Apache OpenWhisk on public clouds to comare its
  behavior with a series of functions for big data, deep learning and genomics
  applications
- Benchmark regarding to concurrent function invocations on IaaS-powered
  serverless computing environments
- Practical guide to building services on public clouds with the experience of
  deploying Apache OpenWhisk. 

Resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Target cloud providers are:

- Oracle Cloud Infrastructure and Amazon EC2

Target serverless platform is:

- Apache OpenWhisk

.. image:: https://openwhisk.apache.org/images/illustration-openwhisk.svg
   :alt: openwhisk
.. image:: http://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/41865/Z9Ik6huVSQC0sSJf8To4
   :alt: oracle cloud infrastructure
.. image:: https://signalfx-82c9.kxcdn.com/wp-content/uploads/EC2-logo-full.jpg
   :alt: Amazon EC2
   :width: 100px

Table of Contents
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::
   :maxdepth: 1

   plan
   deployment
   benchmark
   guide
   summary


