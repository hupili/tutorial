<TeXmacs|1.0.7.19>

<style|seminar>

<\body>
  <doc-data|<doc-title|Spectral Clustering>|<doc-author|<author-data|<author-name|HU
  Pili>|<\author-affiliation>
    \;
  </author-affiliation>>>|<doc-date|<date>>>

  <section|Outline>

  <\itemize>
    <item>Clustering Problem

    <item>Spectral Clustering Demo

    <item>Preliminaries

    <\itemize>
      <item>Clustering: K-means Algorithm

      <item>Dimensionality Reduction: PCA, KPCA.
    </itemize>

    <item>Spectral Clustering Framework

    <item>Spectral Clustering Justification

    <item>Ohter Spectral Embedding Techniques
  </itemize>

  Main reference: Hu 2012 <cite|hu2012-spectral> <new-page>

  <section|Clustering Problem>

  <big-figure|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.2gw|0.2gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|center>|gr-grid|<tuple|cartesian|<point|0|0>|10>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-point-style|round|<graphics||<point|1.7|3.6>|<point|2.4|4>|<point|3.3|3.4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.6|2.7>|<point|0.7|3>|<point|1|4>|<point|2.5|4.6>|<point|3|4>|<point|2.3|2.6>|<point|2.4|3>|<point|1|3>|<point|1.3|2>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|5.7|2>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6.4|2.8>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|6|2.4>>|<with|point-style|round|<point|5|2>>|<with|point-style|round|<point|4.7|2.3>>|<with|point-style|round|<point|5.3|2.3>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|4.4|1.4>>|<with|point-style|round|<point|5.3|1>>|<with|point-style|round|<point|5.5|1.4>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5|1>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5.6|0.7>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4.5|0.7>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6|1.3>>|<with|point-style|round|<point|6.4|1>>|<text-at|Height|<point|-2.0|5.0>>|<text-at|Weight|<point|6.4|-0.7>>>>|Abstract
  your target using feature vector><new-page>

  <section|Clustering Problem>

  <big-figure|<with|gr-mode|<tuple|edit|spline>|gr-frame|<tuple|scale|1cm|<tuple|0.2gw|0.2gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|center>|gr-grid|<tuple|cartesian|<point|0|0>|10>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-point-style|round|gr-dash-style|11100|<graphics||<point|1.7|3.6>|<point|2.4|4>|<point|3.3|3.4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.6|2.7>|<point|0.7|3>|<point|1|4>|<point|2.5|4.6>|<point|3|4>|<point|2.3|2.6>|<point|2.4|3>|<point|1|3>|<point|1.3|2>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|5.7|2>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6.4|2.8>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|6|2.4>>|<with|point-style|round|<point|5|2>>|<with|point-style|round|<point|4.7|2.3>>|<with|point-style|round|<point|5.3|2.3>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|4.4|1.4>>|<with|point-style|round|<point|5.3|1>>|<with|point-style|round|<point|5.5|1.4>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5|1>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5.6|0.7>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4.5|0.7>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6|1.3>>|<with|point-style|round|<point|6.4|1>>|<text-at|Height|<point|-2.0|5.0>>|<text-at|Weight|<point|6.4|-0.7>>|<spline|<point|3.53445|4.78564>|<point|3.78844754597169|3.68496163513692>|<point|3.55561251488292|2.6477874057415>|<point|2.67339828079478|2.0>|<point|1.52359769810822|1.46244542928959>|<point|0.309310587287586|2.0>|<point|0.207443592488924|3.0>|<point|0.338255721656304|4.34113308638709>|<point|1.48126405609208|4.74330268554042>|<point|2.54021792627895|5.0>|<point|3.53444569387485|4.76446950654849>>|<with|dash-style|11100|<spline|<point|4.35363|3>|<point|5.37595912157693|3.32512567799974>|<point|7.0|3.0>|<point|8.0|1.40376806450616>|<point|7.0|0.514963972199051>|<point|5.0|0.0>|<point|3.40744476782643|0.425271199894166>|<point|3.50856649563925|2.0>|<point|4.37477315046473|3.0>>>>>|Cluster
  the data points into <math|K> (2 here) groups><new-page>

  <section|Clustering Problem>

  <big-figure|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.170002gw|0.140006gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|center>|gr-grid|<tuple|cartesian|<point|0|0>|10>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-point-style|round|gr-arrow-end|\|\<gtr\>|gr-dash-style|11100|<graphics||<point|1.7|3.6>|<point|2.4|4>|<point|3.3|3.4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.6|2.7>|<point|0.7|3>|<point|1|4>|<point|2.5|4.6>|<point|3|4>|<point|2.3|2.6>|<point|2.4|3>|<point|1|3>|<point|1.3|2>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|5.7|2>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6.4|2.8>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|6|2.4>>|<with|point-style|round|<point|5|2>>|<with|point-style|round|<point|4.7|2.3>>|<with|point-style|round|<point|5.3|2.3>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|4.4|1.4>>|<with|point-style|round|<point|5.3|1>>|<with|point-style|round|<point|5.5|1.4>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5|1>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5.6|0.7>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4.5|0.7>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6|1.3>>|<with|point-style|round|<point|6.4|1>>|<text-at|Height|<point|-2.0|5.0>>|<text-at|Weight|<point|6.4|-0.7>>|<spline|<point|3.53445|4.78564>|<point|3.78844754597169|3.68496163513692>|<point|3.55561251488292|2.6477874057415>|<point|2.67339828079478|2.0>|<point|1.52359769810822|1.46244542928959>|<point|0.309310587287586|2.0>|<point|0.207443592488924|3.0>|<point|0.338255721656304|4.34113308638709>|<point|1.48126405609208|4.74330268554042>|<point|2.54021792627895|5.0>|<point|3.53444569387485|4.76446950654849>>|<with|dash-style|11100|<spline|<point|4.35363|3>|<point|5.37595912157693|3.32512567799974>|<point|7.0|3.0>|<point|8.0|1.40376806450616>|<point|7.0|0.514963972199051>|<point|5.0|0.0>|<point|3.40744476782643|0.425271199894166>|<point|3.50856649563925|2.0>|<point|4.37477315046473|3.0>>>|<with|arrow-end|\|\<gtr\>|<line|<point|5.7358|5.34846>|<point|4.0|4.61502118952413>>>|<text-at|Thin|<point|5.0|5.64297998794758>>|<with|arrow-end|\|\<gtr\>|dash-style|11100|<line|<point|7.62594|4.64622>|<point|7.0|3.0>>>|<text-at|Fat|<point|7.23256|5>>>>|Gain
  Insights of your data><new-page>

  <section|Clustering Problem>

  <big-figure|<with|gr-mode|<tuple|edit|carc>|gr-frame|<tuple|scale|1cm|<tuple|0.2gw|0.2gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|center>|gr-grid|<tuple|cartesian|<point|0|0>|10>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-color|red|<graphics||<point|1.7|3.6>|<point|2.4|4>|<point|3.3|3.4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.6|2.7>|<point|0.7|3>|<point|1|4>|<point|2.5|4.6>|<point|3|4>|<point|2.3|2.6>|<point|2.4|3>|<point|1|3>|<point|1.3|2>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|5.7|2>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6.4|2.8>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|6|2.4>>|<with|point-style|round|<point|5|2>>|<with|point-style|round|<point|4.7|2.3>>|<with|point-style|round|<point|5.3|2.3>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|4.4|1.4>>|<with|point-style|round|<point|5.3|1>>|<with|point-style|round|<point|5.5|1.4>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5|1>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5.6|0.7>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4.5|0.7>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6|1.3>>|<with|point-style|round|<point|6.4|1>>|<text-at|Height|<point|-2.0|5.0>>|<text-at|Weight|<point|6.4|-0.7>>|<spline|<point|3.53445|4.78564>|<point|3.78844754597169|3.68496163513692>|<point|3.55561251488292|2.6477874057415>|<point|2.67339828079478|2.0>|<point|1.52359769810822|1.46244542928959>|<point|0.309310587287586|2.0>|<point|0.207443592488924|3.0>|<point|0.338255721656304|4.34113308638709>|<point|1.48126405609208|4.74330268554042>|<point|2.54021792627895|5.0>|<point|3.53444569387485|4.76446950654849>>|<with|dash-style|11100|<spline|<point|4.35363|3>|<point|5.37595912157693|3.32512567799974>|<point|7.0|3.0>|<point|8.0|1.40376806450616>|<point|7.0|0.514963972199051>|<point|5.0|0.0>|<point|3.40744476782643|0.425271199894166>|<point|3.50856649563925|2.0>|<point|4.37477315046473|3.0>>>|<with|color|red|fill-color|red|<carc|<point|1.5871|3.24426>|<point|2.0|3.77139604326296>|<point|2.0|3.27813081976311>>>|<with|color|red|<carc|<point|5.43178|2>|<point|5.75696189972219|1.5932497684879>|<point|5.22779137452044|1.48741566344755>>>>>|The
  center is representative (knowledge)><new-page>

  <section|Clustering Problem>

  <big-figure|<with|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.18gw|0.170003gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|center>|gr-grid|<tuple|cartesian|<point|0|0>|10>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-dash-style|11100|<graphics||<point|1.7|3.6>|<point|2.4|4>|<point|3.3|3.4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.6|2.7>|<point|0.7|3>|<point|1|4>|<point|2.5|4.6>|<point|3|4>|<point|2.3|2.6>|<point|2.4|3>|<point|1|3>|<point|1.3|2>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|5.7|2>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6.4|2.8>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|6|2.4>>|<with|point-style|round|<point|5|2>>|<with|point-style|round|<point|4.7|2.3>>|<with|point-style|round|<point|5.3|2.3>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|4.4|1.4>>|<with|point-style|round|<point|5.3|1>>|<with|point-style|round|<point|5.5|1.4>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5|1>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5.7|1>>|<with|point-style|round|<point|5.6|0.7>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4.5|0.7>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6|1.3>>|<with|point-style|round|<point|6.4|1>>|<text-at|Height|<point|-2.0|5.0>>|<text-at|Weight|<point|6.4|-0.7>>|<spline|<point|3.53445|4.78564>|<point|3.78844754597169|3.68496163513692>|<point|3.55561251488292|2.6477874057415>|<point|2.67339828079478|2.0>|<point|1.52359769810822|1.46244542928959>|<point|0.309310587287586|2.0>|<point|0.207443592488924|3.0>|<point|0.338255721656304|4.34113308638709>|<point|1.48126405609208|4.74330268554042>|<point|2.54021792627895|5.0>|<point|3.53444569387485|4.76446950654849>>|<with|dash-style|11100|<spline|<point|4.35363|3>|<point|5.37595912157693|3.32512567799974>|<point|7.0|3.0>|<point|8.0|1.40376806450616>|<point|7.0|0.514963972199051>|<point|5.0|0.0>|<point|3.40744476782643|0.425271199894166>|<point|3.50856649563925|2.0>|<point|4.37477315046473|3.0>>>|<with|color|red|fill-color|red|<carc|<point|1.5871|3.24426>|<point|2.0|3.77139604326296>|<point|2.0|3.27813081976311>>>|<with|color|red|<carc|<point|5.43178|2>|<point|5.75696189972219|1.5932497684879>|<point|5.22779137452044|1.48741566344755>>>|<with|color|blue|<point|8|4>>|<line|<point|2.10707|3.54773>|<point|7.72067209087297|4.0>>|<with|dash-style|11100|<line|<point|5.75696|1.59325>|<point|7.78897671649689|3.76475062839>>>>>|Use
  the knowledge for prediction><new-page>

  <section|Review: Clustering>

  We learned the general steps of Data Mining/ Knowledge Discover using a
  clustering example:

  <\enumerate>
    <item>Abstract your data in form of vectors.

    <item>Run learning algorithms

    <item>Gain insights/ extract knowledge/ make prediction
  </enumerate>

  We focus on 2. <new-page>

  <section|Spectral Clustering Demo>

  <big-figure|<image|plot/sc_sample_scatter.eps|11cm|||>|Data Scatter
  Plot><new-page>

  <section|Spectral Clustering Demo>

  <big-figure|<image|plot/sc_sample_kmeans.eps|11cm|||>|Standard
  K-Means><new-page>

  <section|Spectral Clustering Demo>

  <big-figure|<image|plot/sc_sample_sc.eps|11cm|||>|Our Sample Spectral
  Clustering><new-page>

  <section|Spectral Clustering Demo>

  The algorithm is simple:

  <\itemize>
    <item>K-Means:

    <verbatim|[idx, c] = kmeans(X, K) ;>

    <item>Spectral Clustering:

    <\verbatim>
      epsilon = 0.7 ;

      D = dist(X') ;

      A = double(D \<less\> epsilon) ;

      [V, Lambda] = eigs(A, K) ;\ 

      [idx, c] = kmeans(V, K) ;
    </verbatim>
  </itemize>

  <new-page>

  <section|Review: The Demo>

  The usual case in data mining:

  <\itemize>
    <item>No weak algorithms

    <item>Preprocessing is as important as algorithms

    <item>The problem looks easier in <strong|another space> (the secret
    coming soon)
  </itemize>

  Transformation to another space:

  <\itemize>
    <item>High to low: dimensionality reduction, low dimension embedding.
    e.g. Spectral clustering.\ 

    <item>Low to high. e.g. Support Vector Machine (SVM)<new-page>
  </itemize>

  <section|Secrets of Preprocessing>

  <\big-figure|<image|plot/sc_sample_adj.eps|11cm|||>>
    The similarity graph: connect to <math|\<varepsilon\>>-ball.

    <\verbatim>
      D = dist(X'); A = double(D \<less\> epsilon);
    </verbatim>
  </big-figure>

  <section|Secrets of Preprocessing>

  <\big-figure|<image|plot/sc_sample_2d_embed.eps|11cm|||>>
    2-D embedding using largest 2 eigenvectors

    <verbatim|[V, Lambda] = eigs(A, K);>
  </big-figure>

  <section|Secrets of Preprocessing>

  <big-figure|<image|plot/sc_sample_2d_embed_unit_circle.eps|11cm|||>|Even
  better after projecting to unit circle (not used in our sample but more
  applicable, Brand 2003 <cite|brand2003unifying>)><new-page>

  <section|Secrets of Preprocessing>

  <math|V> is the <math|N\<times\>K> -- The largest <math|K> EVs. (<math|K=2>
  here)

  \;

  <\verbatim>
    \>\> norm(V(:,1))

    ans = 1.0000

    \>\> norm(V(:,2))

    ans = 1.0000

    \>\> sum(V(:,1) .* V(:,2))

    ans = 4.3368e-17
  </verbatim>

  \;

  The first two EVs of <math|A> are nearly perpendicular to each other if
  there are two well separable clusters. <new-page>

  <section|Notations>

  <\itemize>
    <item>Data points: <math|X<rsub|n\<times\>N>=<around*|[|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|N>|]>>.
    <math|N> points, each of <math|n> dimensions. Organize in columns.

    <item>Feature extraction: <math|\<phi\><around*|(|x<rsub|i>|)>>. <math|d>
    dimensional.

    <item>Eigen value decomposition: <math|A=U\<Lambda\>U<rsup|\<Tau\>>>.
    First <math|d> colums of <math|U>: <math|U<rsub|d>>.\ 

    <item>Feature matrix: <math|\<Phi\><rsub|<wide|n|^>\<times\>N>=<around*|[|\<phi\><around*|(|x|)><rsub|1>,\<phi\><around*|(|x|)><rsub|2>,\<ldots\>,\<phi\><around*|(|x|)><rsub|N>|]>>

    <item>Low dimension embedding: <math|Y<rsub|N\<times\>d>>. Embed <math|N>
    points into <math|d>-dimensional space.

    <item>Number of clusters: <math|K>.\ 
  </itemize>

  <new-page>

  <section|K-Means>

  <\itemize>
    <item>Initialize <math|m<rsub|1>,\<ldots\>,m<rsub|K>> centers

    <item>Iterate until convergence:

    <\itemize>
      <item>Cluster assignment: <math|C<rsub|i>=arg
      min<rsub|j><around*|\<\|\|\>|x<rsub|i>-m<rsub|j>|\<\|\|\>>> for all
      data points, <math|1\<leqslant\>i\<leqslant\>N>.\ 

      <item>Update clustering: <math|S<rsub|j>=<around*|{|i:C<rsub|i>=j|}>,1\<leqslant\>j\<leqslant\>K>

      <item>Update centers: <math|m<rsub|j>=<frac|1|<around*|\||S<rsub|j>|\|>><big|sum><rsub|i\<in\>S<rsub|j>>x<rsub|i>>
    </itemize>
  </itemize>

  <new-page>

  <section|Remarks: K-Means>

  <\enumerate>
    <item>A chiken and egg problem.

    <item>How to initialize centers?

    <item>Determine superparameter <math|K>?

    <item>Decision boundary is a straight line:

    <\itemize>
      <item><math|C<rsub|i>=arg min<rsub|j><around*|\<\|\|\>|x<rsub|i>-m<rsub|j>|\<\|\|\>>>

      <item><math|<around*|\<\|\|\>|x-m<rsub|j>|\<\|\|\>>=<around*|\<\|\|\>|x-m<rsub|k>|\<\|\|\>>>

      <item><math|m<rsub|i><rsup|\<Tau\>>m<rsub|i>-m<rsub|j><rsup|\<Tau\>>m<rsub|j>=2x<rsup|\<Tau\>><around*|(|m<rsub|i>-m<rsub|j>|)>>
    </itemize>
  </enumerate>

  We address the 4th points by transforming the data into a space where
  straight line boundary is enough. <new-page>

  <section|Principle Component Analysis>

  <big-figure|<with|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.0700086gw|0.0500126gh>>|gr-geometry|<tuple|geometry|0.657131par|0.439974par|axis>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|10>|gr-point-style|round|<graphics||<point|2.4|4>|<point|3|2.7>|<point|1.5|2.6>|<point|0.7|3>|<point|1|4>|<point|3|4>|<point|2.3|2.6>|<point|2|2>|<with|point-style|round|<point|4.6|2.6>>|<with|point-style|round|<point|5.5|2.7>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.4|2.2>>|<with|point-style|round|<point|6|2>>|<with|point-style|round|<point|5|1.7>>|<with|point-style|round|<point|6.4|1.5>>|<with|point-style|round|<point|6.8|1>>|<with|point-style|round|<point|5|0.5>>|<with|point-style|round|<point|4|1>>|<with|point-style|round|<point|6.4|1>>|<with|color|red|<line|<point|-0.257709|4.62773>|<point|7.48741566344755|0.0210345283767694>>>|<with|color|blue|dash-style|11100|<line|<point|2.4|4>|<point|1.95837797346617|3.30963141940909>>>|<with|color|blue|dash-style|11100|<line|<point|3|4>|<point|2.37991951151728|3.05890420986451>>>|<with|color|blue|dash-style|11100|<line|<point|2.3|2.6>|<point|2.55852987920237|2.95266917714993>>>|<with|color|blue|dash-style|11100|<line|<point|2|2>|<point|2.73815306374658|2.84583173465613>>>|<with|color|blue|dash-style|11100|<line|<point|1.5|2.6>|<point|1.95837797346617|3.30963141940909>>>|<with|color|blue|dash-style|11100|<line|<point|0.7|3>|<point|1.27820793785122|3.71418736384582>>>|<with|color|blue|dash-style|11100|<line|<point|4.6|2.6>|<point|4.16035907673022|1.99992281976841>>>|<with|color|blue|dash-style|11100|<line|<point|5.5|2.7>|<point|4.74563534096971|1.65180840802175>>>|<with|color|blue|dash-style|11100|<line|<point|4|1>|<point|4.51947547746622|1.78632523820026>>>|<with|color|blue|dash-style|11100|<line|<point|5|1.7>|<point|4.87591599787085|1.57431923408772>>>|<with|color|blue|dash-style|11100|<line|<point|6|2>|<point|5.49192439230714|1.20792576665599>>>|<with|color|blue|dash-style|11100|<line|<point|6.4|2.2>|<point|5.6802652921187|1.09590314494429>>>|<with|color|blue|dash-style|11100|<line|<point|5|0.5>|<point|5.49192439230714|1.20792576665599>>>|<with|color|blue|dash-style|11100|<line|<point|6.4|1.5>|<point|5.98828638160041|0.91269636393836>>>|<with|color|blue|dash-style|11100|<line|<point|6.4|1>|<point|6.20695802802493|0.782633424072419>>>|<with|color|blue|dash-style|11100|<line|<point|6.8|1>|<point|6.51558731449733|0.59906489571643>>>|<with|color|blue|dash-style|11100|<line|<point|5.43151|6.85992>|<point|7.10368434978172|6.85991864003175>>>|<with|color|red|<line|<point|5.47384|6.07675>|<point|7.10368434978172|6.07674626273317>>>|<with|color|none|<point|5.62201|5.42057>>|<with|point-style|round|<point|6.80735|5.37824>>|<text-at|Data|<point|7.69635533800767|5.08190567535388>>|<text-at|PC|<point|7.7171130845736|5.80291705252017>>|<text-at|Error|<point|7.7268833097885|6.52392842968647>>>>|Error
  minimization formulation><new-page>

  <section|Principle Component Analysis>

  Assume <math|x<rsub|i>> is already <strong|centered> (easy to preprocess).
  Project points onto the space spanned by <math|U<rsub|n\<times\>d>> with
  minimum errors:

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|U\<in\>\<bbb-R\><rsup|n\<times\>d>>>|<cell|>|<cell|J<around*|(|U|)>=<big|sum><rsub|i=1><rsup|N><around*|\<\|\|\>|U*U<rsup|\<Tau\>>x<rsub|i>-x<rsub|i>|\<\|\|\>><rsup|2>>>|<row|<cell|s.t.>|<cell|>|<cell|U<rsup|\<Tau\>>U=I>>>>
  </eqnarray*>

  <new-page>

  <section|Principle Component Analysis>

  Transform to trace maximization:

  <\eqnarray*>
    <tformat|<table|<row|<cell|max<rsub|U\<in\>\<bbb-R\><rsup|n\<times\>d>>>|<cell|>|<cell|Tr<around*|[|U<rsup|\<Tau\>><around*|(|X*X<rsup|\<Tau\>>|)>U|]>>>|<row|<cell|s.t.>|<cell|>|<cell|U<rsup|\<Tau\>>U=I>>>>
  </eqnarray*>

  Standard problem in matrix theory:

  <\itemize>
    <item>Solution of <math|U> is given by the largest <math|d> eigen vectors
    of <math|X*X<rsup|\<Tau\>>> (those corresponding to largest eigen
    values). i.e. <math|X*X<rsup|\<Tau\>>U=U\<Lambda\>>.\ 

    <item>Usually denote <math|\<Sigma\><rsub|n\<times\>n>=X*X<rsup|\<Tau\>>>,
    because <math|X*X<rsup|\<Tau\>>> can be interpreted as the covariance of
    variables (<math|n> variables). (Again not that <math|X> is
    centered)<new-page>\ 
  </itemize>

  <section|Principle Component Analysis>

  About <math|U*U<rsup|\<Tau\>>x<rsub|i>>:

  <\itemize>
    <item><math|x<rsub|i>>: the data points in original <math|n> dimensional
    space.

    <item><math|U<rsub|n\<times\>d>>: the <math|d> dimensional space (axis)
    <strong|expressed> using the coordinates of original <math|n>-D space. --
    <strong|Principle Axis>.

    <item><math|U<rsup|\<Tau\>>x<rsub|i>>: the coordinates of
    <math|x<rsub|i>> in <math|d>-dimensional space; <math|d>-dimensional
    <strong|embedding>; the projection of <math|x<rsub|i>> to <math|d>-D
    space <strong|expressed> in <math|d>-D space. -- <strong|Principle
    Component>.\ 

    <item><math|U*U<rsup|\<Tau\>>x<rsub|i>>: the projection of
    <math|x<rsub|i>> to <math|d>-D space expressed in <math|n>-D
    space.<new-page>
  </itemize>

  <section|Principle Component Analysis>

  From principle axis to principle component:

  <\itemize>
    <item>One data point: <math|U<rsup|\<Tau\>>x<rsub|i>>

    <item>Matrix form: <math|<around*|(|Y<rsup|\<Tau\>>|)><rsup|><rsub|d\<times\>N>=U<rsup|\<Tau\>>X>
  </itemize>

  Relation between covariance and similarity:

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|(|X<rsup|\<Tau\>>X*|)>Y>|<cell|=>|<cell|X<rsup|\<Tau\>>X*<around*|(|U<rsup|\<Tau\>>X|)><rsup|\<Tau\>>>>|<row|<cell|>|<cell|=>|<cell|X<rsup|\<Tau\>>X*X<rsup|\<Tau\>>U>>|<row|<cell|>|<cell|=>|<cell|X<rsup|\<Tau\>>U*\<Lambda\>>>|<row|<cell|>|<cell|=>|<cell|Y\<Lambda\>>>>>
  </eqnarray*>

  Observation: <math|Y> is the eigen vectors of <math|X<rsup|\<Tau\>>X>.
  <new-page>

  <section|Principle Component Analysis>

  Two operational approaches:

  <\itemize>
    <item>Decompose <math|<around*|(|X*X<rsup|\<Tau\>>|)><rsub|n\<times\>n>>
    and Let <math|<around*|(|Y<rsup|\<Tau\>>|)><rsup|><rsub|d\<times\>N>=U<rsup|\<Tau\>>X>.\ 

    <item>Decompose <math|<around*|(|X<rsup|\<Tau\>>X|)><rsub|N\<times\>N>*>
    and directly get <math|Y>.
  </itemize>

  Implications:

  <\itemize>
    <item>Choose the smaller size one in practice.

    <item><math|X<rsup|\<Tau\>>X> hint that we can do more with the
    structure.
  </itemize>

  Remarks:

  <\itemize>
    <item>Principle components are what we want in most cases. i.e. <math|Y>.
    i.e. <math|d>-dimension embedding. e.g. Can do clustering on coordinates
    given by <math|Y>. <new-page>
  </itemize>

  <section|Kernel PCA>

  Settings:

  <\itemize>
    <item>A feature extraction function:

    <\equation*>
      \<phi\>:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\><rsup|<wide|n|^>>
    </equation*>

    original <math|n> dimension features. Map to <math|<wide|n|^>> dimension.

    <item>Matrix organization:

    <\equation*>
      \<Phi\><rsub|<wide|n|^>\<times\>N>=<around*|[|\<phi\><around*|(|x|)><rsub|1>,\<phi\><around*|(|x|)><rsub|2>,\<ldots\>,\<phi\><around*|(|x|)><rsub|N>|]>
    </equation*>

    <item>Now <math|\<Phi\>> is the ``data points'' in the formulation of
    PCA. Try to embed them into <math|d>-dimensions.<new-page>
  </itemize>

  <section|Kernel PCA>

  According to the analysis of PCA, we can operate on:

  <\itemize>
    <item><math|<around*|(|\<Phi\>\<Phi\><rsup|\<Tau\>>|)><rsub|<wide|n|^>\<times\><wide|n|^>>>:
    the covariance matrix of features

    <item><math|<around*|(|\<Phi\><rsup|\<Tau\>>\<Phi\>|)><rsub|N\<times\>N>>:
    the similarity/ affinity matrix (in spectral clustering language); the
    gram/ kernal matrix (in keneral PCA language).
  </itemize>

  The observation:

  <\itemize>
    <item><math|<wide|n|^>> can be very large. e.g.
    <math|\<phi\>:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\><rsup|\<infty\>>>

    <item><math|<around*|(|\<Phi\><rsup|\<Tau\>>\<Phi\>|)><rsub|i,j>=\<phi\><rsup|\<Tau\>><around*|(|x<rsub|i>|)>\<phi\><around*|(|x<rsub|j>|)>>.
    Don't need explict <math|\<phi\>>; only need
    <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=\<phi\><rsup|\<Tau\>><around*|(|x<rsub|i>|)>\<phi\><around*|(|x<rsub|j>|)>>.<new-page>
  </itemize>

  <section|Kernel PCA>

  <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=\<phi\><rsup|\<Tau\>><around*|(|x<rsub|i>|)>\<phi\><around*|(|x<rsub|j>|)>>
  is the ``kernel''. One important property: by definition,\ 

  <\itemize>
    <item><math|k<around*|(|x<rsub|i>,x<rsub|j>|)>> is a positive
    semidefinite function.

    <item><math|K> is a positive semidefinite matrix.
  </itemize>

  Some example kernals:

  <\itemize>
    <item>Linear: <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=x<rsup|\<Tau\>><rsub|i>x<rsub|j>>.
    Degrade to PCA.\ 

    <item>Polynomial: <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=<around*|(|1+x<rsup|\<Tau\>><rsub|i>x<rsub|j>|)><rsup|p>>

    <item>Gaussion: <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=e<rsup|-<frac|<around*|\<\|\|\>|x<rsub|i>-x<rsub|j>|\<\|\|\>><rsup|2>|2\<sigma\><rsup|2>>>><new-page>
  </itemize>

  <section|Remarks: KPCA>

  <\itemize>
    <item>Avoid explicit high dimension (maybe infinite) feature
    construction.

    <item>Enable one research direction: kernel engineering.

    <item>The above discussion <strong|assume <math|\<Phi\>> is centered>!
    See Bishop 2006 <cite|bishop2006pattern> for how to center this matrix
    (using only kernel function). (or ``double centering'' technique in
    <cite|hu2012-spectral>)

    <item>Out of sample embedding is the real difficulty, see Bengio 2004
    <cite|bengio2004out>.<new-page>
  </itemize>

  <section|Review: PCA and KPCA>

  <\itemize>
    <item>Minimum error formulation of PCA

    <item>Two equivalent implementation approaches:

    <\itemize>
      <item>covariance matrix

      <item>similarity matrix
    </itemize>

    <item>Similarity matrix is more convenient to manipulate and leads to
    KPCA.

    <item>Kernel is Positive Semi-Definite (PSD) by definition.
    <math|K=\<Phi\><rsup|\<Tau\>>\<Phi\>> <new-page>
  </itemize>

  <section|Spectral Clustering Framework>

  A bold guess:

  <\itemize>
    <item>Decomposing <math|K=\<Phi\><rsup|\<Tau\>>\<Phi\>> gives good
    low-dimension embedding. Inner product measures similarity, i.e.
    <math|k<around*|(|x<rsub|i>,x<rsub|j>|)>=\<phi\><rsup|\<Tau\>><around*|(|x<rsub|i>|)>\<phi\><around*|(|x<rsub|j>|)>>.
    <math|K> is similarity matrix.

    <item>In the operation, we acturally do not look at <math|\<Phi\>>.

    <item>We can specify <math|K> directly and perform EVD:

    <\equation*>
      X<rsub|n\<times\>N>\<rightarrow\>K<rsub|N\<times\>N>
    </equation*>

    <item>What if we directly give a similarity measure, <math|K>, without
    the constraint of PSD?
  </itemize>

  That leads to the general spectral clustering. <new-page>

  <section|Spectral Clustering Framework>

  <\enumerate>
    <item>Get similarity matrix <math|A<rsub|N\<times\>N>> from data points
    <math|X>. (<math|A>: affinity matrix; adjacency matrix of a graph;
    similarity graph)

    <item>EVD: <math|A=U\<Lambda\>U<rsup|T>>. Use <math|U<rsub|d>> (or
    post-processed version, see <cite|hu2012-spectral>) as the
    <math|d>-dimension embedding.

    <item>Perform clustering on <math|d>-D embedding.<new-page>
  </enumerate>

  <section|Spectral Clustering Framework>

  Review our naive spectral clustering demo:

  <\enumerate>
    <item><verbatim|epsilon = 0.7 ;>\ 

    <verbatim|D = dist(X') ;>

    <verbatim|A = double(D \<less\> epsilon) ;>

    <item><verbatim|[V, Lambda] = eigs(A, K) ;>

    <item><verbatim|[idx, c] = kmeans(V, K) ;><new-page>
  </enumerate>

  <section|Remarks: SC Framework>

  <\itemize>
    <item>We start by relaxing <math|A> (<math|K>) in KPCA.

    <item>Lose PSD == Lose KPCA justification? Not exact

    <\equation*>
      A<rprime|'>=A+\<sigma\>I
    </equation*>

    <item>Real tricks: (see <cite|hu2012-spectral> section 2 for details)

    <\itemize>
      <item>How to form <math|A>?

      <item>Decompose <math|A> or other variants of <math|A> (<math|L=D-A>).

      <item>Use EVD result directly (e.g. <math|U>) or use a variant (e.g.
      <math|U\<Lambda\><rsup|1/2>>).\ 
    </itemize>
  </itemize>

  <section|Similarity graph>

  Input is high dimensional data: (e.g. come in form of <math|X>)

  <\itemize>
    <item><math|k>-nearest neighbour

    <item><math|\<varepsilon\>>-ball

    <item>mutual <math|k>-NN

    <item>complete graph (with Gaussian kernel weight)<new-page>
  </itemize>

  <section|Similarity graph>

  Input is distance. <math|<around*|(|D<rsup|<around*|(|2|)>>|)><rsub|i,j>>
  is the squred distance between <math|i> and <math|j>. (may not come from
  raw <math|x<rsub|i>>, <math|x<rsub|j>>)

  <\eqnarray*>
    <tformat|<table|<row|<cell|c>|<cell|=>|<cell|<around*|[|x<rsup|\<Tau\>><rsub|1>x<rsub|1>,\<ldots\>,x<rsup|T><rsub|N>x<rsub|N>|]><rsup|\<Tau\>>>>|<row|<cell|D<rsup|<around*|(|2|)>>>|<cell|=>|<cell|c*1<rsup|\<Tau\>>+1*c<rsup|\<Tau\>>-2X<rsup|\<Tau\>>X>>|<row|<cell|J>|<cell|=>|<cell|I-<frac|1|n>1*1<rsup|\<Tau\>>>>|<row|<cell|X<rsup|\<Tau\>>X>|<cell|=>|<cell|-<frac|1|2>J*D<rsup|<around*|(|2|)>>J>>>>
  </eqnarray*>

  Remarks:

  <\itemize>
    <item>See MDS.<new-page>
  </itemize>

  <section|Similarity graph>

  Input is a graph:

  <\itemize>
    <item>Just use it.

    <item>Or do some enhancements. e.g. Geodesic distance. See
    <cite|hu2012-spectral> Section 2.1.3 for some possible methods.
  </itemize>

  After get the graph (or input):

  <\itemize>
    <item>Adjacency matrix <math|A>, Laplacian matrix <math|L=D-A>.

    <item>Normalized versions:\ 

    <\itemize>
      <item><math|A<rsub|left>=D<rsup|-1>*A>,
      <math|A<rsub|sym>=D<rsup|-1/2><rsub|>A*D<rsup|-1/2>>

      <item><math|L<rsub|left>=D<rsup|-1>*L>,
      <math|L<rsub|sym>=D<rsup|-1/2><rsub|>L*D<rsup|-1/2>><new-page>
    </itemize>
  </itemize>

  <section|EVD of the Graph>

  Matrix types:

  <\itemize>
    <item>Adjacency series: Use the largest EVs.

    <item>Laplacian series: Use the smallest EVs.<new-page>
  </itemize>

  <section|Remarks: SC Framework>

  <\itemize>
    <item>There are many possibilities in construction of similarity matrix
    and the post-processing of EVD.

    <item>Not all of these combinations have justifications.

    <item>Once a combination is shown to working, it may not be very hard to
    find justifications.

    <item>Existing works actually starts from very different flavoured
    formulations.

    <item>Only one common property: involve EVD; aka ``spectral analysis'';
    hence the name. <new-page>
  </itemize>

  <section|Spectral Clustering Justification>

  <\itemize>
    <item>Cut based argument (main stream; origin)

    <item>Random walk escaping probability

    <item>Commute time: <math|L<rsup|-1>> encodes the effective resistance.
    (where <math|U\<Lambda\><rsup|-1/2>> come from)

    <item>Low-rank approximation.

    <item>Density estimation.

    <item>Matrix perturbation.

    <item>Polarization. (the demo)
  </itemize>

  See <cite|hu2012-spectral> for pointers. <new-page>

  <section|Cut Justification>

  Normalized Cut (Shi 2000 <cite|shi2000normalized>):

  <\equation*>
    NCut=<big|sum><rsub|i=1><rsup|K><frac|cut<around*|(|C<rsub|i>,V-C<rsub|i>|)>|vol<around*|(|C<rsub|i>|)>>
  </equation*>

  Characteristic vector for <math|C<rsub|i>>,
  <math|\<chi\><rsub|i>=<around*|{|0,1|}><rsup|N>>:

  <\equation*>
    NCut=<big|sum><rsub|i=1><rsup|K><frac|\<chi\><rsup|\<Tau\>><rsub|i>L\<chi\><rsub|i>|\<chi\><rsup|\<Tau\>><rsub|i>D\<chi\><rsub|i>>
  </equation*>

  Relax <math|\<chi\><rsub|i>> to real value:

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|v<rsub|i>\<in\>\<bbb-R\><rsup|N>>>|<cell|>|<cell|<big|sum><rsub|i=1><rsup|K>v<rsup|\<Tau\>><rsub|i>L*v<rsub|i>>>|<row|<cell|s.t.>|<cell|>|<cell|v<rsup|\<Tau\>><rsub|i>D*v<rsub|i>=1>>|<row|<cell|>|<cell|>|<cell|v<rsup|\<Tau\>><rsub|i>*v<rsub|j>=0,\<forall\>i\<neq\>j>>>>
  </eqnarray*>

  This is the generalized eigenvalue problem:

  <\equation*>
    L*v=\<lambda\>D*v
  </equation*>

  Equivalent to EVD on:

  <\equation*>
    L<rsub|left>=D<rsup|-1>L
  </equation*>

  <new-page>

  <section|Matrix Perturbation Justification>

  <\itemize>
    <item>When the graph is ideally separable, i.e. multiple connected
    components, <math|A> and <math|L> have characteristic (or piecewise
    linear) EVs.

    <item>When not ideally separable but sparse cut exists, <math|A> can be
    viewed as ideal separable matrix plus a small perturbation.

    <item>Small perturbation of matrix entries leads to small perturbation of
    EVs.\ 

    <item>EVs are not too far from piecewise linear: easy to separate by
    simple algorithms like K-Means.<new-page>
  </itemize>

  <section|Low Rank Approximation>

  The similarity matrix <math|A> is generated by inner product in some
  unknown space we want to recover. We want to minimize the recovering error:

  <\equation*>
    min<rsub|Y\<in\>\<bbb-R\><rsup|N\<times\>d>><around*|\<\|\|\>|A-Y*Y<rsup|T>|\<\|\|\>><rsup|2><rsub|F>
  </equation*>

  The standard low-rank approximation problem, which leads to EVD of
  <math|A>:

  <\equation*>
    Y=U\<Lambda\><rsup|1/2>
  </equation*>

  \ <new-page>

  <section|Spectral Embedding Techniques>

  See <cite|hu2012-spectral> for some pointers: MDS, isomap, PCA, KPCA, LLE,
  LEmap, HEmap, SDE, MVE, SPE. The difference, as said, lies mostly in the
  construction of <math|A>.<new-page>

  <\bibliography|bib|abbrv|spectral.bib>
    <\bib-list|1>
      <bibitem*|1><label|bib-bengio2004out>Y.<nbsp>Bengio, J.<nbsp>Paiement,
      P.<nbsp>Vincent, O.<nbsp>Delalleau, N.<nbsp>Le<nbsp>Roux, and
      M.<nbsp>Ouimet. <newblock>Out-of-sample extensions for lle, isomap,
      mds, eigenmaps, and spectral clustering.
      <newblock><with|font-shape|italic|Advances in neural information
      processing systems>, 16:177--184, 2004.

      <bibitem*|2><label|bib-bishop2006pattern>C.<nbsp>Bishop.
      <newblock><with|font-shape|italic|Pattern recognition and machine
      learning>, volume<nbsp>4. <newblock>springer New York, 2006.

      <bibitem*|3><label|bib-brand2003unifying>M.<nbsp>Brand and
      K.<nbsp>Huang. <newblock>A unifying theorem for spectral embedding and
      clustering. <newblock>In <with|font-shape|italic|Proceedings of the
      Ninth International Workshop on Artificial Intelligence and
      Statistics>, 2003.

      <bibitem*|4><label|bib-hu2012-spectral>P.<nbsp>Hu. <newblock>Spectral
      clustering survey, 5 2012.

      <bibitem*|5><label|bib-shi2000normalized>J.<nbsp>Shi and J.<nbsp>Malik.
      <newblock>Normalized cuts and image segmentation.
      <newblock><with|font-shape|italic|Pattern Analysis and Machine
      Intelligence, IEEE Transactions on>, 22(8):888--905, 2000.
    </bib-list>
  </bibliography>

  <section|Thanks>

  Q/A

  \;

  \;

  \;

  Some supplementary slides for details are attached.

  \;

  <new-page>

  <section|SVD and EVD>

  Definitions of Singular Value Decomposition (SVD):

  <\eqnarray*>
    <tformat|<table|<row|<cell|X<rsub|n\<times\>N>>|<cell|=>|<cell|U<rsub|n\<times\>k>\<Sigma\><rsub|k\<times\>k>V<rsup|\<Tau\>><rsub|N\<times\>k>>>>>
  </eqnarray*>

  Definitions of Eigen Value Decomposition (EVD):

  <\eqnarray*>
    <tformat|<table|<row|<cell|A>|<cell|=>|<cell|X<rsup|\<Tau\>>X>>|<row|<cell|A>|<cell|=>|<cell|U\<Lambda\>U<rsup|\<Tau\>>>>>>
  </eqnarray*>

  Relations:

  <\eqnarray*>
    <tformat|<table|<row|<cell|X<rsup|\<Tau\>>X>|<cell|=>|<cell|V\<Sigma\><rsup|2>V<rsup|\<Tau\>>>>|<row|<cell|X*X<rsup|\<Tau\>>>|<cell|=>|<cell|U\<Sigma\><rsup|2>U<rsup|\<Tau\>>>>>>
  </eqnarray*>

  Remarks:

  <\itemize>
    <item>SVD requires <math|U<rsup|\<Tau\>>U=I>, <math|V<rsup|\<Tau\>>V=I>
    and <math|\<sigma\><rsub|i>\<geqslant\>0>
    (<math|\<Sigma\>=diag<around*|(|\<sigma\><rsub|1>,\<ldots\>,\<sigma\><rsub|N>|)>>).
    This is to guarantee the uniqueness of solution.

    <item>EVD does not have constraints, any <math|U> and <math|\<Lambda\>>
    satisfying <math|A*U=U\<Lambda\>> is OK. The requirement of
    <math|U<rsup|\<Tau\>>U=I> is also to guarantee uniqueness of solution
    (e.g. PCA). Another benefit is the numerical stability of subspace
    spanned by <math|U>: orthogonal layout is more error resilient.

    <item>The computation of SVD is done via EVD.\ 

    <item>Watch out the terms and the object they refer to.<new-page>
  </itemize>

  <section|Out of Sample Embedding>

  <\itemize>
    <item>New data point <math|x\<in\>\<bbb-R\><rsup|n>> that is not in
    <math|X>. How to find the lower dimension embedding, i.e.
    <math|y\<in\>\<bbb-R\><rsup|d>>.

    <item>In PCA, we have principle axis <math|U>
    (<math|X*X<rsup|\<Tau\>>=U\<Lambda\>U<rsup|T>>). Out of sample embedding
    is simple: <math|y=U<rsup|\<Tau\>>x>.

    <item><math|U<rsub|n\<times\>d>> is actually a <strong|compact
    representation of knowledge>.\ 

    <item>In KPCA and different variants of SC, we operate on similarity
    graph and do not have such compact representation. It is thus hard to
    explicitly the out of sample embedding result.

    <item>See <cite|bengio2004out> for some researches on this. <new-page>
  </itemize>

  <section|Gaussian Kernel>

  The gaussian kernel: (Let <math|\<tau\>=<frac|1|2\<sigma\><rsup|2>>>)

  <\equation*>
    k<around*|(|x<rsub|i>,x<rsub|j>|)>=e<rsup|-<frac|<around*|\<\|\|\>|x<rsub|i>-x<rsub|j>|\<\|\|\>><rsup|2>|2\<sigma\><rsup|2>>>=e<rsup|-\<tau\><around*|\<\|\|\>|x<rsub|i>-x<rsub|j>|\<\|\|\>><rsup|2>>
  </equation*>

  Use Taylor expansion:

  <\equation*>
    e<rsup|x>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|1|k!>x<rsup|k>
  </equation*>

  Rewrite the kernel:

  <\eqnarray*>
    <tformat|<table|<row|<cell|k<around*|(|x<rsub|i>,x<rsub|j>|)>>|<cell|=>|<cell|e<rsup|-\<tau\><around*|(|x<rsub|i>-x<rsub|j>|)><rsup|\<Tau\>><around*|(|x<rsub|i>-x<rsub|j>|)>>>>|<row|<cell|>|<cell|=>|<cell|e<rsup|-\<tau\>x<rsup|\<Tau\>><rsub|i>x<rsub|i>>\<cdot\>e<rsup|-\<tau\>x<rsup|\<Tau\>><rsub|j>x<rsub|j>>\<cdot\>e<rsup|2\<tau\>x<rsup|\<Tau\>><rsub|i>x<rsub|j>>>>>>
  </eqnarray*>

  Focus on the last part:

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsup|2\<tau\>x<rsup|\<Tau\>><rsub|i>x<rsub|j>>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|\<infty\>><frac|1|k!><around*|(|2\<tau\>x<rsup|\<Tau\>><rsub|i>x<rsub|j>|)><rsup|k>>>>>
  </eqnarray*>

  It's hard to write out the form when <math|x<rsub|i>\<in\>\<bbb-R\><rsup|n>,n\<gtr\>1>.
  We demo the case when <math|n=1>. <math|x<rsub|i>> and <math|x<rsub|j>> are
  now single variable:

  <\eqnarray*>
    <tformat|<table|<row|<cell|e<rsup|2\<tau\>x<rsup|\<Tau\>><rsub|i>x<rsub|j>>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|\<infty\>><frac|1|k!><around*|(|2\<tau\>|)><rsup|k>x<rsup|k><rsub|i>x<rsup|k><rsub|j>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|\<infty\>>c<around*|(|k|)>\<cdot\>x<rsup|k><rsub|i>x<rsup|k><rsub|j>>>>>
  </eqnarray*>

  The feature vector is: (infinite dimension)

  <\equation*>
    \<phi\><around*|(|x|)>=e<rsup|-\<tau\>x<rsup|2>><around*|[|<sqrt|c<around*|(|0|)>>,<sqrt|c<around*|(|1|)>>x,<sqrt|c<around*|(|2|)>>x<rsup|2>,\<ldots\>,<sqrt|c<around*|(|k|)>>x<rsup|k>,\<ldots\>|]>
  </equation*>

  Verify that:

  <\equation*>
    k<around*|(|x<rsub|i>,x<rsub|j>|)>=\<phi\><around*|(|x<rsub|i>|)>\<cdot\>\<phi\><around*|(|x<rsub|j>|)>
  </equation*>

  This shows that Gaussian kernel implicitly map 1-D data to an infinite
  dimensional feature space.<new-page>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
    <associate|page-medium|paper>
    <associate|page-orientation|landscape>
    <associate|page-type|a5>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|6|7>>
    <associate|auto-11|<tuple|5|7>>
    <associate|auto-12|<tuple|7|8>>
    <associate|auto-13|<tuple|8|9>>
    <associate|auto-14|<tuple|6|9>>
    <associate|auto-15|<tuple|9|10>>
    <associate|auto-16|<tuple|7|10>>
    <associate|auto-17|<tuple|10|11>>
    <associate|auto-18|<tuple|8|11>>
    <associate|auto-19|<tuple|11|12>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-20|<tuple|12|13>>
    <associate|auto-21|<tuple|13|14>>
    <associate|auto-22|<tuple|9|14>>
    <associate|auto-23|<tuple|14|15>>
    <associate|auto-24|<tuple|10|15>>
    <associate|auto-25|<tuple|15|16>>
    <associate|auto-26|<tuple|11|16>>
    <associate|auto-27|<tuple|16|17>>
    <associate|auto-28|<tuple|17|18>>
    <associate|auto-29|<tuple|18|19>>
    <associate|auto-3|<tuple|1|3>>
    <associate|auto-30|<tuple|19|20>>
    <associate|auto-31|<tuple|20|21>>
    <associate|auto-32|<tuple|12|21>>
    <associate|auto-33|<tuple|21|22>>
    <associate|auto-34|<tuple|22|23>>
    <associate|auto-35|<tuple|23|24>>
    <associate|auto-36|<tuple|24|25>>
    <associate|auto-37|<tuple|25|26>>
    <associate|auto-38|<tuple|26|27>>
    <associate|auto-39|<tuple|27|28>>
    <associate|auto-4|<tuple|3|4>>
    <associate|auto-40|<tuple|28|29>>
    <associate|auto-41|<tuple|29|30>>
    <associate|auto-42|<tuple|30|31>>
    <associate|auto-43|<tuple|31|32>>
    <associate|auto-44|<tuple|32|33>>
    <associate|auto-45|<tuple|33|34>>
    <associate|auto-46|<tuple|34|35>>
    <associate|auto-47|<tuple|35|36>>
    <associate|auto-48|<tuple|36|37>>
    <associate|auto-49|<tuple|37|38>>
    <associate|auto-5|<tuple|2|4>>
    <associate|auto-50|<tuple|38|39>>
    <associate|auto-51|<tuple|39|40>>
    <associate|auto-52|<tuple|40|41>>
    <associate|auto-53|<tuple|41|42>>
    <associate|auto-54|<tuple|42|44>>
    <associate|auto-55|<tuple|43|45>>
    <associate|auto-56|<tuple|44|46>>
    <associate|auto-57|<tuple|44|47>>
    <associate|auto-58|<tuple|45|48>>
    <associate|auto-59|<tuple|46|49>>
    <associate|auto-6|<tuple|4|5>>
    <associate|auto-60|<tuple|47|51>>
    <associate|auto-61|<tuple|48|52>>
    <associate|auto-7|<tuple|3|5>>
    <associate|auto-8|<tuple|5|6>>
    <associate|auto-9|<tuple|4|6>>
    <associate|bib-bengio2004out|<tuple|1|47>>
    <associate|bib-bishop2006pattern|<tuple|2|47>>
    <associate|bib-brand2003unifying|<tuple|3|47>>
    <associate|bib-hu2012-spectral|<tuple|4|47>>
    <associate|bib-hu2012-spectral2hop|<tuple|1|15>>
    <associate|bib-shi2000normalized|<tuple|5|47>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hu2012-spectral

      brand2003unifying

      bishop2006pattern

      hu2012-spectral

      bengio2004out

      hu2012-spectral

      hu2012-spectral

      hu2012-spectral

      hu2012-spectral

      shi2000normalized

      hu2012-spectral

      bengio2004out
    </associate>
    <\associate|figure>
      <tuple|normal|Abstract your target using feature
      vector|<pageref|auto-3>>

      <tuple|normal|Cluster the data points into <with|mode|<quote|math>|K>
      (2 here) groups|<pageref|auto-5>>

      <tuple|normal|Gain Insights of your data|<pageref|auto-7>>

      <tuple|normal|The center is representative
      (knowledge)|<pageref|auto-9>>

      <tuple|normal|Use the knowledge for prediction|<pageref|auto-11>>

      <tuple|normal|Data Scatter Plot|<pageref|auto-14>>

      <tuple|normal|Standard K-Means|<pageref|auto-16>>

      <tuple|normal|Our Sample Spectral Clustering|<pageref|auto-18>>

      <\tuple|normal>
        The similarity graph: connect to <with|mode|<quote|math>|\<varepsilon\>>-ball.

        <\with|font-family|<quote|tt>|language|<quote|verbatim>>
          D = dist(X'); A = double(D \<less\> epsilon);
        </with>
      </tuple|<pageref|auto-22>>

      <\tuple|normal>
        2-D embedding using largest 2 eigenvectors

        <with|font-family|<quote|tt>|language|<quote|verbatim>|[V, Lambda] =
        eigs(A, K);>
      </tuple|<pageref|auto-24>>

      <tuple|normal|Even better after projecting to unit circle (not used in
      our sample but more applicable, Brand 2003
      [<write|bib|brand2003unifying><reference|bib-brand2003unifying>])|<pageref|auto-26>>

      <tuple|normal|Error minimization formulation|<pageref|auto-32>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Outline>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Clustering
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Clustering
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Clustering
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Clustering
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Clustering
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Review:
      Clustering> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Review:
      The Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Secrets
      of Preprocessing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Secrets
      of Preprocessing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Secrets
      of Preprocessing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Secrets
      of Preprocessing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Notations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|K-Means>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Remarks:
      K-Means> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Principle
      Component Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Kernel
      PCA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Kernel
      PCA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Kernel
      PCA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Remarks:
      KPCA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Review:
      PCA and KPCA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Remarks:
      SC Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Similarity
      graph> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Similarity
      graph> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Similarity
      graph> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|EVD
      of the Graph> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Remarks:
      SC Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Justification> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Cut
      Justification> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Matrix
      Perturbation Justification> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Low
      Rank Approximation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Embedding Techniques> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Thanks>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|SVD
      and EVD> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Out
      of Sample Embedding> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Gaussian
      Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>