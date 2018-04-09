.. OpenWhisk Experiment documentation master file, created by
   sphinx-quickstart on Sun Apr  8 22:37:00 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Experiment: Running Apache OpenWhisk for Heavy Workloads on Public Clouds
===============================================================================

Dynamic applications on cloud computing have been migrated to serverless
computing platforms, such as Apache OpenWhisk, recently due to its elasticity
and simplicity of compute resource provisioning. Mobile applications,
lightweight image data processing and system log analysis are implemented as a
stateless function to process given tasks on serverless computing environments.
For example, less than 300 lines of a Python function with TensorFlow library
identifies a thousand of training image data from ImageNet Large Visual
Recognition Challenge in 2012 within a few seconds using serverless concurrent
function invocations. Functions for heavy workloads with external libraries,
however, would not be loaded on the serverless environments due to its size.


.. toctree::
   :maxdepth: 2
   :caption: Contents:

