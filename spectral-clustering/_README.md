## Abstract

The term Spectral Clustering is a collection of algorithms.
Many researchers propose their own variations and
algorithm specific justifications. We observe that
the core operation of Spectral Clustering is eigen value
decomposition and an embedding step is implicitly or
explicitly performed. This is analogous to Spectral Embedding
algorithms and many eigen decomposition based Dimensionality
Reduction methods from machine learning community. In
this article, we term them all as Spectral Embedding
Technique.

In this survey, we first construct a simple-minded
sample spectral clustering algorithm.
Then we conclude taxonomy of spectral clustering.
Next, we propose
a general three-stage framework of spectral clustering.
Combinatoric, stochastic, and other type of justifications
are collected and organized in later sections.
After that, we give a brief introduction on
several representative dimensionality
reduction methods and relate them to our general
spectral clustering framework.
We give several unifying views of Spectral Embedding
Technique: graph framework, kernel framework,
trace maximization. We end this article with
a discussion on the relationship between
Kernel K-Means and Spectral Clustering.

This article aims at providing systematic ways
to explore new spectral clustering algorithms.
At the same time, we hope to gain some insights
through the analysis of a bunch of algorithms.
Source code of documents and sample algorithms can be found
in the online open source repository.

## Amendments

### Slides P. 26

The math derivations are correct but the conclusion that
"decompose X.T * X and direclty get Y" is not precise.

Although Y is the eigen vector of X.T * X,
you probably can not get it directly using common decomposition routine.
This is because eigen vectors can be arbitrarily scaled
and they are still eigen vectors corresponding to the same eigen values.

Usually, the decomposition routine will give you an orthonormal set of eigen vectors.
This is guaranteed by spectral theorem in our case:
input is a real symmetric matrix.
You need to scale the eigen vectors by their corresponding **singular value**
(square root of the corresponding **eigen value**).
