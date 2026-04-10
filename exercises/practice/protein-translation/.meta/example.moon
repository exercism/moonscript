codon_map =
  AUG: 'Methionine'
  UUC: 'Phenylalanine'
  UUU: 'Phenylalanine'
  UUA: 'Leucine'
  UUG: 'Leucine'
  UCU: 'Serine'
  UCC: 'Serine'
  UCA: 'Serine'
  UCG: 'Serine'
  UAU: 'Tyrosine'
  UAC: 'Tyrosine'
  UGU: 'Cysteine'
  UGC: 'Cysteine'
  UGG: 'Tryptophan'
  UAA: 'STOP'
  UAG: 'STOP'
  UGA: 'STOP'

translate = (strand) ->
  proteins = {}
  while #strand > 0
    codon, strand = strand\match '(...)(.*)'
    switch codon_map[codon]
      when nil then error 'Invalid codon'
      when 'STOP' then break
      else table.insert proteins, codon_map[codon]
  proteins

{ proteins: translate }
