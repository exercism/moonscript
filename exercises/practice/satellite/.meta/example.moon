indexof = (list, elem) ->
  for i, v in ipairs list
    if v == elem
      return i
  return -1

uniq = (list) ->
  seen = {}
  for elem in *list
    return false if seen[elem]
    seen[elem] = true
  true


do_tree = (preorder, inorder) ->
  return {} if #preorder == 0

  root = preorder[1]
  idx = indexof inorder, root
  assert idx > 0, "traversals must have the same elements"

  return {
    v: root,
    l: do_tree {table.unpack preorder, 2, idx}, {table.unpack inorder, 1, idx - 1},
    r: do_tree {table.unpack preorder, idx + 1, #preorder}, {table.unpack inorder, idx + 1, #inorder}
  }


{
  tree: (preorder, inorder) ->
    assert #preorder == #inorder, "traversals must have the same length"
    assert uniq(preorder) and uniq(inorder), "traversals must contain unique items"

    do_tree preorder, inorder
}
