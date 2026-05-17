buildTree = (tree) ->
  t = {}
  for name, children in pairs tree
    if not t[name]
      t[name] = {
        parent: nil
        siblings: {}
        children: {}
      }
    for i, child in ipairs children
      table.insert t[name].children, child
      if t[child]
        t[child].parent = name
      else
        t[child] = {parent: name, children: {}}
      t[child].siblings = [c for j, c in ipairs children when i != j]
  t

ancestry = (t, person) ->
  parentage = {person}
  while t[person].parent
    table.insert parentage, 1, t[person].parent
    person = t[person].parent
  parentage

removeCommonAncestors = (list1, list2) ->
  while #list1 > 0 and #list2 > 0 and list1[1] == list2[1]
    table.remove list1, 1
    table.remove list2, 1

{
  degreeOfSeparation: (tree, a, b) ->
    t = buildTree tree
    anc = {who, ancestry(t, who) for who in *{a, b}}

    -- different roots, no relation
    return nil if anc[a][1] != anc[b][1]

    removeCommonAncestors anc[a], anc[b]
    return #anc[b] if #anc[a] == 0  -- a is ancestor of b
    return #anc[a] if #anc[b] == 0  -- b is ancestor of a

    -- if we get here, they are siblings or cousins
    #anc[a] + #anc[b] - 1
}
