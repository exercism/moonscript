return (dna) ->
  rna = A: 'U', C: 'G', G: 'C', T: 'A'
  table.concat [rna[nucleotide] for nucleotide in dna\gmatch('.')]
