<link href="markdown.css" rel="stylesheet"></link>
<script type="text/javascript"
   src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

Sequencing
==========

Introduction and Motivation
--------------------------

* Recap:  NetworkPlanner produces a least cost electrification plan for a region
* How do we decompose and *sequence* that plan?

![Plan Roll Out](images/to_sequenced.png)

* Order is determined by combination of Network *topology* and financial viability
* Financial viability is determined by minimizing the following on a nodal basis:

$$\frac{\sum_{i=1}^{n} distance_{i}}{\sum_{i=1}^{n} demand_{i}}$$

Demo
----

[Demo of Sequencer](sequence_graph_demo.html)

Sequencing NetworkPlanner output with R
---------------------------------------

[Sequencing with R](install_run_sequencer.html) 

