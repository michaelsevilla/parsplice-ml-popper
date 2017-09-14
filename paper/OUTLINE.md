# Paper Outline

Targets:
- 11/20/17 - CCGrid
- 01/24/18 - HPDC
- 03/10/18 - CLUSTER
- 03/27/18 - SC

## 1. Introduction
The PDSW paper shows:
1. keyspace is structured
2. we don't need an unlimited cache
3. dynamic policies work (for a while)

The machine learning portion classifies read throughput into regimes. We
should have used online machine learning to detect the superbasins.

## 2. Keyspace Locality

Key reads (*y* axis) over time (*x* axis) show "access regimes", or groups of
accesses to the same set of keys. 

![keyspace access][logo]

[logo]: ../experiments/keyspace-locality/viz/key-accesses.png

This figure shows:

- access regimes change immediately
- access regimes are different sizes
- access regimes get larger over time (**a**)
- random access to a single key (**b**), early keys accessed more (**c**)

## 3. Machine Learning Techniques

To detect these access regimes, we are going to try:
### Basic Statistics/Calculus
### K-Means
### DBScan
### Anomaly Detection

## 4. Implementation

## 5. Similarities to File Systems

- Can we use the same balancers we developed for ParSplice?

- How do we visualize file system traces so they look like the ParSplice key
  access trace?


Resources;
- Lustre Trace (how do we visualize?)
- LinkedIn Trace
- Nathan's Trace
