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

### Techreport P. 16 - Angular K-Means

I didn't think too much about the so-called angular K-means.
I just want to point out that there are some variations
which can fit into the general spectral clustering framework.
It turns out people already coined the term "spherical K-means" in literatures, e.g.

   * Zhong, Shi. "Efficient online spherical k-means clustering." Neural Networks, 2005. IJCNN'05. Proceedings. 2005 IEEE International Joint Conference on. Vol. 5. IEEE, 2005.
APA
   * Dhillon, Inderjit S., Yuqiang Guan, and J. Kogan. "Refining clusters in high-dimensional text data." Proceedings of the Workshop on Clustering High Dimensional Data and its Applications at the Second SIAM International Conference on Data Mining. 2002.

One thing note:

   * Original K-means defines centroid as:
   a point c to minimize sum of distance from all points in the cluster c.
   * Using cosine (similarity/distance),
   there are two formulations for the centroid:
      * The exact version is: minimize arc-cosine distance.
      I haven't reached closed form yet. May come back some time later.
      * One estimate version is: maximize cosine similarity.
      Using this way, we have closed form.
      This is the formula in P. 16 of this survey and same in previous literature.
   * The two formulations are not the same.

