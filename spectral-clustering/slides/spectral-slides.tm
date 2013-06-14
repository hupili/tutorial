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
      <item>Clustering. K-means Algorithm

      <item>Dimensionality Reduction. PCA
    </itemize>

    <item>Spectral Clustering Framework

    <item>Spectral Clustering Justification

    <item>Ohter Spectral Embedding Techniques
  </itemize>

  <new-page>

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

    <item>The problem looks easier in another space (the secret coming soon)
  </itemize>

  <new-page>

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
  there are two well separable clusters.<new-page>

  <section|References>

  \;
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
    <associate|auto-10|<tuple|6|8>>
    <associate|auto-11|<tuple|5|8>>
    <associate|auto-12|<tuple|7|8>>
    <associate|auto-13|<tuple|8|8>>
    <associate|auto-14|<tuple|6|8>>
    <associate|auto-15|<tuple|9|?>>
    <associate|auto-16|<tuple|7|?>>
    <associate|auto-17|<tuple|10|?>>
    <associate|auto-18|<tuple|8|?>>
    <associate|auto-19|<tuple|11|?>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-20|<tuple|12|?>>
    <associate|auto-21|<tuple|13|?>>
    <associate|auto-22|<tuple|14|?>>
    <associate|auto-3|<tuple|1|4>>
    <associate|auto-4|<tuple|3|4>>
    <associate|auto-5|<tuple|2|5>>
    <associate|auto-6|<tuple|4|5>>
    <associate|auto-7|<tuple|3|6>>
    <associate|auto-8|<tuple|5|6>>
    <associate|auto-9|<tuple|4|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Data Scatter Plot|<pageref|auto-4>>

      <tuple|normal|Standard K-Means|<pageref|auto-6>>

      <tuple|normal|Our Sample Spectral Clustering|<pageref|auto-8>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Outline>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Clustering Demo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|sdlfksjdf>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1.5fn>|sldkfjsdf
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|3fn>|sdlkfj <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|sdlfkjsdf>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|sdfsd>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>