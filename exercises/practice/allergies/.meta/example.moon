allergens = {'eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'}

allergen_value = {v, i - 1 for i, v in ipairs allergens}

allergic_to = (item, score) -> (score >> allergen_value[item]) & 1 == 1

list = (score) -> [a for a in *allergens when allergic_to(a, score)]

{ :allergic_to, :list }
