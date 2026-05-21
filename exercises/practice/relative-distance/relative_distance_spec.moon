import degreeOfSeparation from require 'relative_distance'

describe 'relative-distance:', ->
  it 'Direct parent-child relation', ->
    familyTree = {
      Vera: {'Tomoko'}
      Tomoko: {'Aditi'}
    }
    result = degreeOfSeparation familyTree, 'Vera', 'Tomoko'
    expected = 1
    assert.are.equal expected, result

  pending 'Sibling relationship', ->
    familyTree = {
      Dalia: {'Olga', 'Yassin'}
    }
    result = degreeOfSeparation familyTree, 'Olga', 'Yassin'
    expected = 1
    assert.are.equal expected, result

  pending 'Two degrees of separation, grandchild', ->
    familyTree = {
      Mateo: {'Rami'}
      Khadija: {'Mateo'}
    }
    result = degreeOfSeparation familyTree, 'Khadija', 'Rami'
    expected = 2
    assert.are.equal expected, result

  pending 'Unrelated individuals', ->
    familyTree = {
      Kaito: {'Elif'}
      Priya: {'Rami'}
    }
    result = degreeOfSeparation familyTree, 'Priya', 'Kaito'
    expected = nil
    assert.are.equal expected, result

  pending 'Complex graph, cousins', ->
    familyTree = {
      Tomoko: {'Gabriela'}
      Elif: {'Rami'}
      Umar: {'Helena'}
      Vera: {'Igor'}
      Ian: {'Vera'}
      Javier: {'Quynh', 'Ravi'}
      Bao: {'Dalia', 'Elias'}
      Hana: {'Umar'}
      Kaito: {'Xia'}
      Ravi: {'Celine'}
      Dalia: {'Hassan', 'Isla'}
      Isla: {'Pedro'}
      Wang: {'Jing'}
      Nia: {'Antonio'}
      Aiko: {'Bao', 'Carlos'}
      Gustavo: {'Mina'}
      Hassan: {'Noah', 'Olga'}
      Viktor: {'Hana', 'Ian'}
      Priya: {'Cai'}
      Fatima: {'Khadija', 'Liam'}
      Xiomara: {'Kaito'}
      Diego: {'Qi'}
      Tariq: {'Farah'}
      Celine: {'Priya'}
      Zara: {'Mohammed'}
      Giorgio: {'Tomoko'}
      Aditi: {'Nia'}
      Yuki: {'Leila'}
      Yassin: {'Lucia'}
      Xia: {'Kim'}
      Noah: {'Xiomara'}
      Wyatt: {'Jun'}
      Quynh: {'Boris'}
      Sven: {'Fabio'}
      Rami: {'Ewa'}
      Qi: {'Dimitri'}
      Uma: {'Giorgio'}
      Elias: {'Javier'}
      Oscar: {'Bianca'}
      Mina: {'Viktor', 'Wang'}
      Carlos: {'Fatima', 'Gustavo'}
      Liam: {'Tariq', 'Uma'}
      Farah: {'Sven'}
      Leila: {'Yassin'}
      Jing: {'Wyatt'}
      Pedro: {'Zane', 'Aditi'}
      Sofia: {'Diego', 'Elif'}
      Mateo: {'Zara'}
      Khadija: {'Sofia'}
      Boris: {'Oscar'}
      Zane: {'Mateo'}
      Olga: {'Yuki'}
    }
    result = degreeOfSeparation familyTree, 'Dimitri', 'Fabio'
    expected = 9
    assert.are.equal expected, result

  pending 'Complex graph, no shortcut, far removed nephew', ->
    familyTree = {
      Tomoko: {'Gabriela'}
      Elif: {'Rami'}
      Umar: {'Helena'}
      Vera: {'Igor'}
      Ian: {'Vera'}
      Javier: {'Quynh', 'Ravi'}
      Bao: {'Dalia', 'Elias'}
      Hana: {'Umar'}
      Kaito: {'Xia'}
      Ravi: {'Celine'}
      Dalia: {'Hassan', 'Isla'}
      Isla: {'Pedro'}
      Wang: {'Jing'}
      Nia: {'Antonio'}
      Aiko: {'Bao', 'Carlos'}
      Gustavo: {'Mina'}
      Hassan: {'Noah', 'Olga'}
      Viktor: {'Hana', 'Ian'}
      Priya: {'Cai'}
      Fatima: {'Khadija', 'Liam'}
      Xiomara: {'Kaito'}
      Diego: {'Qi'}
      Tariq: {'Farah'}
      Celine: {'Priya'}
      Zara: {'Mohammed'}
      Giorgio: {'Tomoko'}
      Aditi: {'Nia'}
      Yuki: {'Leila'}
      Yassin: {'Lucia'}
      Xia: {'Kim'}
      Noah: {'Xiomara'}
      Wyatt: {'Jun'}
      Quynh: {'Boris'}
      Sven: {'Fabio'}
      Rami: {'Ewa'}
      Qi: {'Dimitri'}
      Uma: {'Giorgio'}
      Elias: {'Javier'}
      Oscar: {'Bianca'}
      Mina: {'Viktor', 'Wang'}
      Carlos: {'Fatima', 'Gustavo'}
      Liam: {'Tariq', 'Uma'}
      Farah: {'Sven'}
      Leila: {'Yassin'}
      Jing: {'Wyatt'}
      Pedro: {'Zane', 'Aditi'}
      Sofia: {'Diego', 'Elif'}
      Mateo: {'Zara'}
      Khadija: {'Sofia'}
      Boris: {'Oscar'}
      Zane: {'Mateo'}
      Olga: {'Yuki'}
    }
    result = degreeOfSeparation familyTree, 'Lucia', 'Jun'
    expected = 14
    assert.are.equal expected, result

  pending 'Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree', ->
    familyTree = {
      Tomoko: {'Gabriela'}
      Elif: {'Rami'}
      Umar: {'Helena'}
      Vera: {'Igor'}
      Ian: {'Vera'}
      Javier: {'Quynh', 'Ravi'}
      Bao: {'Dalia'}
      Hana: {'Umar'}
      Kaito: {'Xia'}
      Ravi: {'Celine'}
      Dalia: {'Hassan', 'Isla'}
      Isla: {'Pedro'}
      Wang: {'Jing'}
      Nia: {'Antonio'}
      Aiko: {'Bao', 'Carlos'}
      Gustavo: {'Mina'}
      Hassan: {'Noah', 'Olga'}
      Viktor: {'Hana', 'Ian'}
      Priya: {'Cai'}
      Fatima: {'Khadija', 'Liam'}
      Xiomara: {'Kaito'}
      Diego: {'Qi'}
      Tariq: {'Farah'}
      Celine: {'Priya'}
      Giorgio: {'Tomoko'}
      Aditi: {'Nia'}
      Yuki: {'Leila'}
      Zara: {'Mohammed'}
      Yassin: {'Lucia'}
      Olga: {'Yuki'}
      Xia: {'Kim'}
      Quynh: {'Boris'}
      Wyatt: {'Jun'}
      Sven: {'Fabio'}
      Rami: {'Ewa'}
      Uma: {'Giorgio'}
      Qi: {'Dimitri'}
      Oscar: {'Bianca'}
      Mina: {'Viktor', 'Wang'}
      Carlos: {'Fatima', 'Gustavo'}
      Liam: {'Tariq', 'Uma'}
      Farah: {'Sven'}
      Leila: {'Yassin'}
      Jing: {'Wyatt'}
      Pedro: {'Zane', 'Aditi'}
      Sofia: {'Diego', 'Elif'}
      Mateo: {'Zara'}
      Khadija: {'Sofia'}
      Boris: {'Oscar'}
      Zane: {'Mateo'}
      Noah: {'Xiomara'}
    }
    result = degreeOfSeparation familyTree, 'Wyatt', 'Xia'
    expected = 12
    assert.are.equal expected, result
