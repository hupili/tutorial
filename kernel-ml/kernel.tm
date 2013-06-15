<TeXmacs|1.0.7.19>

<style|article>

<\body>
  <doc-data|<doc-title|Kernel Trick>|<doc-author|<author-data|<author-name|HU
  Pili>|<\author-affiliation>
    \;
  </author-affiliation>>>|<doc-date|June 15, 2013>>

  <abstract-data|<abstract|Kernel>>

  <section|>

  <\bibliography|bib|abbrv|kernel.bib>
    <\bib-list|1>
      <bibitem*|1><label|bib-ng2008lecture-kernel>A.<nbsp>Ng.
      <newblock>Kernel. <newblock>Stanford Machine Learning (Lecture 8),
      2008.
    </bib-list>
  </bibliography>

  <appendix|Notes From Andrew Ng's Lecture>

  From <cite|ng2008lecture-kernel>, <href|http://www.youtube.com/watch?v=bUv9bfMPMb4>.
  Noted during the video. Not well organized. For my own reference.
  <strong|Do not> recommend you read.\ 

  <subsection|Derivations>

  <\eqnarray*>
    <tformat|<table|<row|<cell|K<around*|(|x,z|)>>|<cell|=>|<cell|<around*|(|x<rsup|\<Tau\>>z|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|<big|sum><rsub|i=1><rsup|n>x<rsub|i>z<rsub|i>|)><around*|(|<big|sum><rsub|j=1><rsup|n>x<rsub|j>z<rsub|j>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n><big|sum><rsub|i=1><rsup|n><around*|(|x<rsub|i>z<rsub|i>|)><around*|(|x<rsub|j>z<rsub|j>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i=1><rsup|n><big|sum><rsub|i=1><rsup|n><around*|(|x<rsub|i>x<rsub|j>|)><around*|(|z<rsub|i>z<rsub|j>|)>>>>>
  </eqnarray*>

  <\equation*>
    \<phi\><around*|(|x|)>=<around*|[|<tabular|<tformat|<table|<row|<cell|x<rsub|1>x<rsub|1>>>|<row|<cell|x<rsub|1>x<rsub|2>>>|<row|<cell|\<ldots\>>>|<row|<cell|x<rsub|1>x<rsub|n>>>|<row|<cell|x<rsub|2>x<rsub|1>>>|<row|<cell|\<ldots\>>>|<row|<cell|x<rsub|n>x<rsub|n>>>>>>|]>
  </equation*>

  Verify that

  <\equation*>
    k<around*|(|x,z|)>=\<phi\><rsup|\<Tau\>><around*|(|x|)>\<phi\><around*|(|z|)>
  </equation*>

  From <math|n<rsup|2>> to <math|n+1>.\ 

  <\equation*>
    k<around*|(|x,z|)>=<around*|(|x<rsup|\<Tau\>>z+c|)><rsup|d>
  </equation*>

  The feature space <math|<binom|n+d|d>>.\ 

  <subsection|Intuition of Kernel>

  <math|x\<rightarrow\>\<phi\><around*|(|x|)>> and
  <math|z\<rightarrow\>\<phi\><around*|(|z|)>>.\ 

  <math|k<around*|(|x,z|)>>:

  <\itemize>
    <item>large if similar

    <item>small if dissimilar
  </itemize>

  <math|k<around*|(|x,z|)>=e<rsup|-<frac|1|2\<sigma\><rsup|2>><around*|\<\|\|\>|x-z|\<\|\|\>><rsup|2>>>

  <subsection|Valid Kernel>

  kernel matrix

  <math|K<rsub|i,j>=k<around*|(|x<rsup|<around*|(|i|)>>,x<rsup|<around*|(|j|)>>|)>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|z<rsup|\<Tau\>>Kz>|<cell|=>|<cell|<big|sum><rsub|i><big|sum><rsub|j>z<rsub|i>K<rsub|i,j>z<rsub|j>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|i><big|sum><rsub|j>z<rsub|i>\<phi\><rsup|\<Tau\>><around*|(|x<rsup|<around*|(|i|)>>|)>\<phi\><around*|(|x<rsup|<around*|(|j|)>>|)>z<rsub|j>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k>balbla
    \<geqslant\>0>>>>
  </eqnarray*>

  valide kernel should be PSD.\ 

  <\theorem>
    (Mercer). Let <math|K<around*|(|x,z|)>> be given. Then <math|K> is a
    valid (Mercer) kernel (i.e. <math|\<exists\>\<phi\>,K<around*|(|x,z|)>=\<phi\><rsup|\<Tau\>><around*|(|x|)>\<phi\><around*|(|z|)>>)
    iff for all <math|<around*|{|x<rsup|<around*|(|1|)>>,\<ldots\>,x<rsup|<around*|(|m|)>>|}>>,
    <math|K\<in\>\<bbb-R\><rsup|n\<times\>n>> is PSD.
  </theorem>

  Gaussian kernel, to infinite dimensions. The visualization.\ 

  <big-figure|<with|gr-mode|point|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|0.600003par|0.333336par|center>|<graphics||<point|-3.00468|1.55862>|<point|-2.32734|1.55862>|<point|-1.88284|1.55862>|<point|-1.43834|1.53746>|<point|0.382012|1.45279>|<point|0.953516|1.45279>|<point|1.54619|1.38929>|<point|2.41403|1.36812>|<with|point-style|round|<point|-1.09967|1.53746>>|<with|point-style|round|<point|-0.697496|1.53746>>|<with|point-style|round|<point|-0.358827|1.55862>>|<with|point-style|round|<point|-0.0624917|1.55862>>|<with|point-style|round|<point|-0.972665|-0.134724>>|<with|point-style|round|<point|-0.252993|-0.113557>>|<with|point-style|round|<point|0.149176|-0.113557>>|<with|point-style|round|<point|0.65718|-0.15589>>|<point|-1.4595|-0.727394>|<point|-1.69234|-1.12956>|<point|-1.777|-1.4894>|<point|-1.8405|-1.84924>|<point|0.805348|-0.727394>|<point|0.974682|-1.1719>|<point|1.08052|-1.44707>|<point|1.12285|-1.72224>>>|Map
  from 1-D to higher D>

  SVM, Linear Regression, Logistic Regression, Perceptron: only use inner
  product.\ 

  <subsection|Digital Recoginition Example>

  Digital recognition. pixel array as a feature vector, e.g.
  <math|10\<times\>10=100>. OCR.\ 

  <math|K<around*|(|x,y|)>=<around*|(|x<rsup|\<Tau\>>y|)><rsup|d>> or
  Gaussian kernel works well. SDN.\ 

  <subsection|Protein Example>

  BAJTSIAIBAJTAU

  problem: some long; some short. how to present features?\ 

  Write down all for chunks: AAAA; AAAB; ... AAAZ; ZZZZ. Count how often
  theses subsequence ocurrs. <math|\<phi\><around*|(|x|)>\<in\>\<bbb-R\><rsup|20<rsup|4>>>,
  i.e. <math|\<bbb-R\><rsup|160000>>. An efficient <strong|Dynamic
  Programming> to compute the inner product efficiently.\ 

  In the slides of John Shawe-Taylor 2007, P60-P65, there is also a similar
  example. The bag-of-words model, string kernel, DP. Can not parse. Leave as
  a pointer.

  Quote from wiki ``String kernels are used in domains where sequence data
  are to be clustered or classified, e.g. in text mining and gene analysis''.
  </body>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|A|?>>
    <associate|auto-4|<tuple|A.1|?>>
    <associate|auto-5|<tuple|A.2|?>>
    <associate|auto-6|<tuple|A.3|?>>
    <associate|auto-7|<tuple|1|?>>
    <associate|auto-8|<tuple|A.4|?>>
    <associate|auto-9|<tuple|A.5|?>>
    <associate|bib-ng2008lecture-kernel|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ng2008lecture-kernel
    </associate>
    <\associate|figure>
      <tuple|normal|Map from 1-D to higher D|<pageref|auto-5>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Derivations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Intuition
      of Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Valid
      Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Digital
      Recoginition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Protein>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>