(defrule add-assortedBrownies-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))

   (canEat (food assortedBrownies))

   (not (alreadyAte (mealTime ?mealTime) (food assortedBrownies)))
   =>

   (addFood ?dayOfWeek ?mealTime "Assorted Brownies" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food assortedBrownies)))
)

(defrule add-appleCinnamonDanish-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))

   (canEat (food appleCinnamonDanish))

   (not (alreadyAte (mealTime ?mealTime) (food appleCinnamonDanish)))
   =>

   (addFood ?dayOfWeek ?mealTime "Apple Cinnamon Danish" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food appleCinnamonDanish)))
)

(defrule add-overNightOats-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food overNightOats))

   (not (alreadyAte (mealTime ?mealTime) (food overNightOats)))
   =>

   (addFood ?dayOfWeek ?mealTime "Over Night Oats" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food overNightOats)))
)

(defrule add-appleCinnamonDonut-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))

   (canEat (food appleCinnamonDonut))

   (not (alreadyAte (mealTime ?mealTime) (food appleCinnamonDonut)))
   =>

   (addFood ?dayOfWeek ?mealTime "Apple Cinnamon Donut" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food appleCinnamonDonut)))
)

(defrule add-beanSprouts-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food beanSprouts))

   (not (alreadyAte (mealTime ?mealTime) (food beanSprouts)))
   =>

   (addFood ?dayOfWeek ?mealTime "Bean Sprouts" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food beanSprouts)))
)

(defrule add-plumTofu-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))

   (canEat (food plumTofu))

   (not (alreadyAte (mealTime ?mealTime) (food plumTofu)))
   =>

   (addFood ?dayOfWeek ?mealTime "Plum Tofu" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food plumTofu)))
)

(defrule add-spicyPorkAndMustardGreensSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food spicyPorkAndMustardGreensSoup))

   (not (alreadyAte (mealTime ?mealTime) (food spicyPorkAndMustardGreensSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Spicy Pork and Mustard Greens Soup" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food spicyPorkAndMustardGreensSoup)))
)

(defrule add-roastedYukonGoldPotatoes-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food roastedYukonGoldPotatoes))

   (not (alreadyAte (mealTime ?mealTime) (food roastedYukonGoldPotatoes)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Yukon Gold Potatoes" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedYukonGoldPotatoes)))
)

(defrule add-redBeetHummus-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))

   (canEat (food redBeetHummus))

   (not (alreadyAte (mealTime ?mealTime) (food redBeetHummus)))
   =>

   (addFood ?dayOfWeek ?mealTime "Red Beet Hummus" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food redBeetHummus)))
)

(defrule add-mushroomOnionPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
   )

   (canEat (food mushroomOnionPizza))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomOnionPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom & Onion Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomOnionPizza)))
)

(defrule add-taiwaneseChicken-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))

   (canEat (food taiwaneseChicken))

   (not (alreadyAte (mealTime ?mealTime) (food taiwaneseChicken)))
   =>

   (addFood ?dayOfWeek ?mealTime "Taiwanese Chicken" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food taiwaneseChicken)))
)

(defrule add-edamameHummus-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food edamameHummus))

   (not (alreadyAte (mealTime ?mealTime) (food edamameHummus)))
   =>

   (addFood ?dayOfWeek ?mealTime "Edamame Hummus" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food edamameHummus)))
)

(defrule add-steelCutOats-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food steelCutOats))

   (not (alreadyAte (mealTime ?mealTime) (food steelCutOats)))
   =>

   (addFood ?dayOfWeek ?mealTime "Steel Cut Oats" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food steelCutOats)))
)

(defrule add-bananaNutMuffin-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))

   (canEat (food bananaNutMuffin))

   (not (alreadyAte (mealTime ?mealTime) (food bananaNutMuffin)))
   =>

   (addFood ?dayOfWeek ?mealTime "Banana Nut Muffin" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food bananaNutMuffin)))
)

(defrule add-pepperoniPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food pepperoniPizza))

   (not (alreadyAte (mealTime ?mealTime) (food pepperoniPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pepperoni Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food pepperoniPizza)))
)

(defrule add-kaleAndWhiteBeanSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food kaleAndWhiteBeanSoup))

   (not (alreadyAte (mealTime ?mealTime) (food kaleAndWhiteBeanSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Kale and White Bean Soup" (create$ protein produce))
   (assert (alreadyAte (mealTime ?mealTime) (food kaleAndWhiteBeanSoup)))
)

(defrule add-chineseBeefAndPotatoStew-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))

   (canEat (food chineseBeefAndPotatoStew))

   (not (alreadyAte (mealTime ?mealTime) (food chineseBeefAndPotatoStew)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chinese Beef and Potato Stew" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chineseBeefAndPotatoStew)))
)

(defrule add-tofuphoWok-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food tofuphoWok))

   (not (alreadyAte (mealTime ?mealTime) (food tofuphoWok)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tofu/Pho Wok" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food tofuphoWok)))
)

(defrule add-chocolateRaspberryBrownieCheesecake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))

   (canEat (food chocolateRaspberryBrownieCheesecake))

   (not (alreadyAte (mealTime ?mealTime) (food chocolateRaspberryBrownieCheesecake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chocolate Raspberry Brownie Cheesecake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food chocolateRaspberryBrownieCheesecake)))
)

(defrule add-phoBar-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food phoBar))

   (not (alreadyAte (mealTime ?mealTime) (food phoBar)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pho Bar" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food phoBar)))
)

(defrule add-chickenFriedSteak-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))

   (canEat (food chickenFriedSteak))

   (not (alreadyAte (mealTime ?mealTime) (food chickenFriedSteak)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chicken Fried Steak" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chickenFriedSteak)))
)

(defrule add-miniPlainBagel-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))

   (canEat (food miniPlainBagel))

   (not (alreadyAte (mealTime ?mealTime) (food miniPlainBagel)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mini Plain Bagel" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food miniPlainBagel)))
)

(defrule add-creamOfTomatoSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food creamOfTomatoSoup))

   (not (alreadyAte (mealTime ?mealTime) (food creamOfTomatoSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cream of Tomato Soup" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food creamOfTomatoSoup)))
)

(defrule add-cinnamonSugarDonut-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food cinnamonSugarDonut))

   (not (alreadyAte (mealTime ?mealTime) (food cinnamonSugarDonut)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cinnamon Sugar Donut" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food cinnamonSugarDonut)))
)

(defrule add-pestoChickenCaesarWrap-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))

   (canEat (food pestoChickenCaesarWrap))

   (not (alreadyAte (mealTime ?mealTime) (food pestoChickenCaesarWrap)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pesto Chicken Caesar Wrap" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food pestoChickenCaesarWrap)))
)

(defrule add-veganSpinachDip-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food veganSpinachDip))

   (not (alreadyAte (mealTime ?mealTime) (food veganSpinachDip)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vegan Spinach Dip" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food veganSpinachDip)))
)

(defrule add-pestoFestivePizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food pestoFestivePizza))

   (not (alreadyAte (mealTime ?mealTime) (food pestoFestivePizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pesto Festive Pizza" (create$ grain dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food pestoFestivePizza)))
)

(defrule add-chipotleStewWithAlmondBrittle-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food chipotleStewWithAlmondBrittle))

   (not (alreadyAte (mealTime ?mealTime) (food chipotleStewWithAlmondBrittle)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chipotle Stew with Almond Brittle" (create$ grain fat))
   (assert (alreadyAte (mealTime ?mealTime) (food chipotleStewWithAlmondBrittle)))
)

(defrule add-peanutButterSide-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food peanutButterSide))

   (not (alreadyAte (mealTime ?mealTime) (food peanutButterSide)))
   =>

   (addFood ?dayOfWeek ?mealTime "Peanut Butter (side)" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food peanutButterSide)))
)

(defrule add-mushroomLemonRisotto-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))

   (canEat (food mushroomLemonRisotto))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomLemonRisotto)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom Lemon Risotto" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomLemonRisotto)))
)

(defrule add-glutenfreeToast-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food glutenfreeToast))

   (not (alreadyAte (mealTime ?mealTime) (food glutenfreeToast)))
   =>

   (addFood ?dayOfWeek ?mealTime "Gluten-Free Toast" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food glutenfreeToast)))
)

(defrule add-guacamoleSide-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food guacamoleSide))

   (not (alreadyAte (mealTime ?mealTime) (food guacamoleSide)))
   =>

   (addFood ?dayOfWeek ?mealTime "Guacamole (side)" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food guacamoleSide)))
)

(defrule add-miniOnionBagel-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))

   (canEat (food miniOnionBagel))

   (not (alreadyAte (mealTime ?mealTime) (food miniOnionBagel)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mini Onion Bagel" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food miniOnionBagel)))
)

(defrule add-bearClaw-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))

   (canEat (food bearClaw))

   (not (alreadyAte (mealTime ?mealTime) (food bearClaw)))
   =>

   (addFood ?dayOfWeek ?mealTime "Bear Claw" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food bearClaw)))
)

(defrule add-assortedNoveltyIceCream-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food assortedNoveltyIceCream))

   (not (alreadyAte (mealTime ?mealTime) (food assortedNoveltyIceCream)))
   =>

   (addFood ?dayOfWeek ?mealTime "Assorted Novelty Ice Cream" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food assortedNoveltyIceCream)))
)

(defrule add-orangeChickenWithStickyRice-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food orangeChickenWithStickyRice))

   (not (alreadyAte (mealTime ?mealTime) (food orangeChickenWithStickyRice)))
   =>

   (addFood ?dayOfWeek ?mealTime "Orange Chicken with Sticky Rice" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food orangeChickenWithStickyRice)))
)

(defrule add-shawarmaChicken-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food shawarmaChicken))

   (not (alreadyAte (mealTime ?mealTime) (food shawarmaChicken)))
   =>

   (addFood ?dayOfWeek ?mealTime "Shawarma Chicken" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food shawarmaChicken)))
)

(defrule add-greens-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food greens))

   (not (alreadyAte (mealTime ?mealTime) (food greens)))
   =>

   (addFood ?dayOfWeek ?mealTime "Greens" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food greens)))
)

(defrule add-pintoBeans-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food pintoBeans))

   (not (alreadyAte (mealTime ?mealTime) (food pintoBeans)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pinto Beans" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food pintoBeans)))
)

(defrule add-breakfastBurritoBar-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food breakfastBurritoBar))

   (not (alreadyAte (mealTime ?mealTime) (food breakfastBurritoBar)))
   =>

   (addFood ?dayOfWeek ?mealTime "Breakfast Burrito Bar" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food breakfastBurritoBar)))
)

(defrule add-toffeeStickyPuddingCake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))

   (canEat (food toffeeStickyPuddingCake))

   (not (alreadyAte (mealTime ?mealTime) (food toffeeStickyPuddingCake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Toffee Sticky Pudding Cake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food toffeeStickyPuddingCake)))
)

(defrule add-newYorkStripSteak-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food newYorkStripSteak))

   (not (alreadyAte (mealTime ?mealTime) (food newYorkStripSteak)))
   =>

   (addFood ?dayOfWeek ?mealTime "New York Strip Steak" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food newYorkStripSteak)))
)

(defrule add-cranberryOrangeMuffin-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))

   (canEat (food cranberryOrangeMuffin))

   (not (alreadyAte (mealTime ?mealTime) (food cranberryOrangeMuffin)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cranberry Orange Muffin" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food cranberryOrangeMuffin)))
)

(defrule add-stickyRice-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food stickyRice))

   (not (alreadyAte (mealTime ?mealTime) (food stickyRice)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sticky Rice" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food stickyRice)))
)

(defrule add-fishPoBoy-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|produce|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
   )

   (canEat (food fishPoBoy))

   (not (alreadyAte (mealTime ?mealTime) (food fishPoBoy)))
   =>

   (addFood ?dayOfWeek ?mealTime "Fish Po Boy" (create$ grain protein produce fat))
   (assert (alreadyAte (mealTime ?mealTime) (food fishPoBoy)))
)

(defrule add-jasmineRice-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food jasmineRice))

   (not (alreadyAte (mealTime ?mealTime) (food jasmineRice)))
   =>

   (addFood ?dayOfWeek ?mealTime "Jasmine Rice" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food jasmineRice)))
)

(defrule add-garlicBreadsticks-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food garlicBreadsticks))

   (not (alreadyAte (mealTime ?mealTime) (food garlicBreadsticks)))
   =>

   (addFood ?dayOfWeek ?mealTime "Garlic Breadsticks" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food garlicBreadsticks)))
)

(defrule add-vanillaChiaSeedPuddingWithBlueberrries-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food vanillaChiaSeedPuddingWithBlueberrries))

   (not (alreadyAte (mealTime ?mealTime) (food vanillaChiaSeedPuddingWithBlueberrries)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vanilla Chia Seed Pudding with Blueberrries" (create$ produce fat))
   (assert (alreadyAte (mealTime ?mealTime) (food vanillaChiaSeedPuddingWithBlueberrries)))
)

(defrule add-bbqChickenPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food bbqChickenPizza))

   (not (alreadyAte (mealTime ?mealTime) (food bbqChickenPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "BBQ Chicken Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food bbqChickenPizza)))
)

(defrule add-chickenPattySandwich-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food chickenPattySandwich))

   (not (alreadyAte (mealTime ?mealTime) (food chickenPattySandwich)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chicken Patty Sandwich" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chickenPattySandwich)))
)

(defrule add-fishChips-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))

   (canEat (food fishChips))

   (not (alreadyAte (mealTime ?mealTime) (food fishChips)))
   =>

   (addFood ?dayOfWeek ?mealTime "Fish & Chips" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food fishChips)))
)

(defrule add-tofuPokeBowl-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food tofuPokeBowl))

   (not (alreadyAte (mealTime ?mealTime) (food tofuPokeBowl)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tofu Poke Bowl" (create$ protein fat))
   (assert (alreadyAte (mealTime ?mealTime) (food tofuPokeBowl)))
)

(defrule add-classicPotatoSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food classicPotatoSalad))

   (not (alreadyAte (mealTime ?mealTime) (food classicPotatoSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Classic Potato Salad" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food classicPotatoSalad)))
)

(defrule add-riceNoodles-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food riceNoodles))

   (not (alreadyAte (mealTime ?mealTime) (food riceNoodles)))
   =>

   (addFood ?dayOfWeek ?mealTime "Rice Noodles" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food riceNoodles)))
)

(defrule add-hardBoiledEggs-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food hardBoiledEggs))

   (not (alreadyAte (mealTime ?mealTime) (food hardBoiledEggs)))
   =>

   (addFood ?dayOfWeek ?mealTime "Hard Boiled Eggs" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food hardBoiledEggs)))
)

(defrule add-porkChop-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food porkChop))

   (not (alreadyAte (mealTime ?mealTime) (food porkChop)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pork Chop" (create$ protein fat))
   (assert (alreadyAte (mealTime ?mealTime) (food porkChop)))
)

(defrule add-oatmeal-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food oatmeal))

   (not (alreadyAte (mealTime ?mealTime) (food oatmeal)))
   =>

   (addFood ?dayOfWeek ?mealTime "Oatmeal" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food oatmeal)))
)

(defrule add-blueberryMuffin-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))

   (canEat (food blueberryMuffin))

   (not (alreadyAte (mealTime ?mealTime) (food blueberryMuffin)))
   =>

   (addFood ?dayOfWeek ?mealTime "Blueberry Muffin" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food blueberryMuffin)))
)

(defrule add-blueberriesCreamDanish-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))

   (canEat (food blueberriesCreamDanish))

   (not (alreadyAte (mealTime ?mealTime) (food blueberriesCreamDanish)))
   =>

   (addFood ?dayOfWeek ?mealTime "Blueberries & Cream Danish" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food blueberriesCreamDanish)))
)

(defrule add-roastedAsparagus-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food roastedAsparagus))

   (not (alreadyAte (mealTime ?mealTime) (food roastedAsparagus)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Asparagus" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedAsparagus)))
)

(defrule add-fruitSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food fruitSalad))

   (not (alreadyAte (mealTime ?mealTime) (food fruitSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Fruit Salad" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food fruitSalad)))
)

(defrule add-deepFriedChickpeas-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food deepFriedChickpeas))

   (not (alreadyAte (mealTime ?mealTime) (food deepFriedChickpeas)))
   =>

   (addFood ?dayOfWeek ?mealTime "Deep Fried Chickpeas" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food deepFriedChickpeas)))
)

(defrule add-bolivianHominySalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food bolivianHominySalad))

   (not (alreadyAte (mealTime ?mealTime) (food bolivianHominySalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Bolivian Hominy Salad" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food bolivianHominySalad)))
)

(defrule add-roastedEggplant-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food roastedEggplant))

   (not (alreadyAte (mealTime ?mealTime) (food roastedEggplant)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Eggplant" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedEggplant)))
)

(defrule add-newYorkCheesecakeBars-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food newYorkCheesecakeBars))

   (not (alreadyAte (mealTime ?mealTime) (food newYorkCheesecakeBars)))
   =>

   (addFood ?dayOfWeek ?mealTime "New York Cheesecake Bars" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food newYorkCheesecakeBars)))
)

(defrule add-indianSpicedPotatoes-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food indianSpicedPotatoes))

   (not (alreadyAte (mealTime ?mealTime) (food indianSpicedPotatoes)))
   =>

   (addFood ?dayOfWeek ?mealTime "Indian Spiced Potatoes" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food indianSpicedPotatoes)))
)

(defrule add-indianSamosasWithChutney-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food indianSamosasWithChutney))

   (not (alreadyAte (mealTime ?mealTime) (food indianSamosasWithChutney)))
   =>

   (addFood ?dayOfWeek ?mealTime "Indian Samosas with Chutney" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food indianSamosasWithChutney)))
)

(defrule add-chickpeaFarm-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))

   (canEat (food chickpeaFarm))

   (not (alreadyAte (mealTime ?mealTime) (food chickpeaFarm)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chickpea Farm" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chickpeaFarm)))
)

(defrule add-romaineLettuce-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food romaineLettuce))

   (not (alreadyAte (mealTime ?mealTime) (food romaineLettuce)))
   =>

   (addFood ?dayOfWeek ?mealTime "Romaine Lettuce" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food romaineLettuce)))
)

(defrule add-toast-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food toast))

   (not (alreadyAte (mealTime ?mealTime) (food toast)))
   =>

   (addFood ?dayOfWeek ?mealTime "Toast" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food toast)))
)

(defrule add-beyondMeatBurger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food beyondMeatBurger))

   (not (alreadyAte (mealTime ?mealTime) (food beyondMeatBurger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Beyond Meat Burger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food beyondMeatBurger)))
)

(defrule add-couscous-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))

   (canEat (food couscous))

   (not (alreadyAte (mealTime ?mealTime) (food couscous)))
   =>

   (addFood ?dayOfWeek ?mealTime "Couscous" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food couscous)))
)

(defrule add-milkDrink-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food milkDrink))

   (not (alreadyAte (mealTime ?mealTime) (food milkDrink)))
   =>

   (addFood ?dayOfWeek ?mealTime "Milk (drink)" (create$ dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food milkDrink)))
)

(defrule add-tuxedoTruffleMousseCake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))

   (canEat (food tuxedoTruffleMousseCake))

   (not (alreadyAte (mealTime ?mealTime) (food tuxedoTruffleMousseCake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tuxedo Truffle Mousse Cake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food tuxedoTruffleMousseCake)))
)

(defrule add-tiramisu-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))

   (canEat (food tiramisu))

   (not (alreadyAte (mealTime ?mealTime) (food tiramisu)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tiramisu" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food tiramisu)))
)

(defrule add-miniPoppySeedBagel-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))

   (canEat (food miniPoppySeedBagel))

   (not (alreadyAte (mealTime ?mealTime) (food miniPoppySeedBagel)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mini Poppy Seed Bagel" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food miniPoppySeedBagel)))
)

(defrule add-mexicanRice-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food mexicanRice))

   (not (alreadyAte (mealTime ?mealTime) (food mexicanRice)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mexican Rice" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food mexicanRice)))
)

(defrule add-newEnglandClamChowder-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food newEnglandClamChowder))

   (not (alreadyAte (mealTime ?mealTime) (food newEnglandClamChowder)))
   =>

   (addFood ?dayOfWeek ?mealTime "New England Clam Chowder" (create$ grain protein fat))
   (assert (alreadyAte (mealTime ?mealTime) (food newEnglandClamChowder)))
)

(defrule add-tomYumSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food tomYumSoup))

   (not (alreadyAte (mealTime ?mealTime) (food tomYumSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tom Yum Soup" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food tomYumSoup)))
)

(defrule add-cheeseRavioliWithRoastedTomatoSauce-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|dairy))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food cheeseRavioliWithRoastedTomatoSauce))

   (not (alreadyAte (mealTime ?mealTime) (food cheeseRavioliWithRoastedTomatoSauce)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cheese Ravioli with Roasted Tomato Sauce" (create$ grain dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food cheeseRavioliWithRoastedTomatoSauce)))
)

(defrule add-friesWedgesSpicy-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food friesWedgesSpicy))

   (not (alreadyAte (mealTime ?mealTime) (food friesWedgesSpicy)))
   =>

   (addFood ?dayOfWeek ?mealTime "Fries Wedges Spicy" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food friesWedgesSpicy)))
)

(defrule add-cowboyBurger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food cowboyBurger))

   (not (alreadyAte (mealTime ?mealTime) (food cowboyBurger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cowboy Burger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food cowboyBurger)))
)

(defrule add-apple-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food apple))

   (not (alreadyAte (mealTime ?mealTime) (food apple)))
   =>

   (addFood ?dayOfWeek ?mealTime "Apple" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food apple)))
)

(defrule add-classicMacaroniSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food classicMacaroniSalad))

   (not (alreadyAte (mealTime ?mealTime) (food classicMacaroniSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Classic Macaroni Salad" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food classicMacaroniSalad)))
)

(defrule add-elvisFrenchToast-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))

   (canEat (food elvisFrenchToast))

   (not (alreadyAte (mealTime ?mealTime) (food elvisFrenchToast)))
   =>

   (addFood ?dayOfWeek ?mealTime "Elvis French Toast" (create$ grain fat))
   (assert (alreadyAte (mealTime ?mealTime) (food elvisFrenchToast)))
)

(defrule add-tofuScramble-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food tofuScramble))

   (not (alreadyAte (mealTime ?mealTime) (food tofuScramble)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tofu Scramble" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food tofuScramble)))
)

(defrule add-eggsFriedToOrder-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food eggsFriedToOrder))

   (not (alreadyAte (mealTime ?mealTime) (food eggsFriedToOrder)))
   =>

   (addFood ?dayOfWeek ?mealTime "Eggs Fried to Order" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food eggsFriedToOrder)))
)

(defrule add-grilledLemons-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food grilledLemons))

   (not (alreadyAte (mealTime ?mealTime) (food grilledLemons)))
   =>

   (addFood ?dayOfWeek ?mealTime "Grilled Lemons" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food grilledLemons)))
)

(defrule add-mushroomPho-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food mushroomPho))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomPho)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom Pho" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomPho)))
)

(defrule add-veganChocolateChipCookie-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food veganChocolateChipCookie))

   (not (alreadyAte (mealTime ?mealTime) (food veganChocolateChipCookie)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vegan Chocolate Chip Cookie" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food veganChocolateChipCookie)))
)

(defrule add-basilPestoPastaSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
   )

   (canEat (food basilPestoPastaSalad))

   (not (alreadyAte (mealTime ?mealTime) (food basilPestoPastaSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Basil Pesto Pasta Salad" (create$ grain fat))
   (assert (alreadyAte (mealTime ?mealTime) (food basilPestoPastaSalad)))
)

(defrule add-springCouscousSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food springCouscousSalad))

   (not (alreadyAte (mealTime ?mealTime) (food springCouscousSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Spring Couscous Salad" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food springCouscousSalad)))
)

(defrule add-arugulaPhesto-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))

   (canEat (food arugulaPhesto))

   (not (alreadyAte (mealTime ?mealTime) (food arugulaPhesto)))
   =>

   (addFood ?dayOfWeek ?mealTime "Arugula Phesto" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food arugulaPhesto)))
)

(defrule add-santaFeChickenSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food santaFeChickenSalad))

   (not (alreadyAte (mealTime ?mealTime) (food santaFeChickenSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Santa Fe Chicken Salad" (create$ grain protein produce))
   (assert (alreadyAte (mealTime ?mealTime) (food santaFeChickenSalad)))
)

(defrule add-orange-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food orange))

   (not (alreadyAte (mealTime ?mealTime) (food orange)))
   =>

   (addFood ?dayOfWeek ?mealTime "Orange" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food orange)))
)

(defrule add-frenchDip-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food frenchDip))

   (not (alreadyAte (mealTime ?mealTime) (food frenchDip)))
   =>

   (addFood ?dayOfWeek ?mealTime "French Dip" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food frenchDip)))
)

(defrule add-proteinOmelet-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
   )

   (canEat (food proteinOmelet))

   (not (alreadyAte (mealTime ?mealTime) (food proteinOmelet)))
   =>

   (addFood ?dayOfWeek ?mealTime "Protein Omelet" (create$ protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food proteinOmelet)))
)

(defrule add-cheeseburger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food cheeseburger))

   (not (alreadyAte (mealTime ?mealTime) (food cheeseburger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cheeseburger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food cheeseburger)))
)

(defrule add-chocolateRaisedDonut-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food chocolateRaisedDonut))

   (not (alreadyAte (mealTime ?mealTime) (food chocolateRaisedDonut)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chocolate Raised Donut" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food chocolateRaisedDonut)))
)

(defrule add-chickenChimichuriSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food chickenChimichuriSalad))

   (not (alreadyAte (mealTime ?mealTime) (food chickenChimichuriSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chicken Chimichuri Salad" (create$ protein produce))
   (assert (alreadyAte (mealTime ?mealTime) (food chickenChimichuriSalad)))
)

(defrule add-lemonBars-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food lemonBars))

   (not (alreadyAte (mealTime ?mealTime) (food lemonBars)))
   =>

   (addFood ?dayOfWeek ?mealTime "Lemon Bars" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food lemonBars)))
)

(defrule add-spicyCucumberSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))

   (canEat (food spicyCucumberSalad))

   (not (alreadyAte (mealTime ?mealTime) (food spicyCucumberSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Spicy Cucumber Salad" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food spicyCucumberSalad)))
)

(defrule add-flourTortilla-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food flourTortilla))

   (not (alreadyAte (mealTime ?mealTime) (food flourTortilla)))
   =>

   (addFood ?dayOfWeek ?mealTime "Flour Tortilla" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food flourTortilla)))
)

(defrule add-mushroomAndTomatoOmelet-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
   )

   (canEat (food mushroomAndTomatoOmelet))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomAndTomatoOmelet)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom and Tomato Omelet" (create$ protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomAndTomatoOmelet)))
)

(defrule add-vegAuPistouSoupWithShells-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
   )

   (canEat (food vegAuPistouSoupWithShells))

   (not (alreadyAte (mealTime ?mealTime) (food vegAuPistouSoupWithShells)))
   =>

   (addFood ?dayOfWeek ?mealTime "Veg Au Pistou Soup with Shells" (create$ grain protein produce))
   (assert (alreadyAte (mealTime ?mealTime) (food vegAuPistouSoupWithShells)))
)

(defrule add-shrimpBurrito-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))

   (canEat (food shrimpBurrito))

   (not (alreadyAte (mealTime ?mealTime) (food shrimpBurrito)))
   =>

   (addFood ?dayOfWeek ?mealTime "Shrimp Burrito" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food shrimpBurrito)))
)

(defrule add-comboPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food comboPizza))

   (not (alreadyAte (mealTime ?mealTime) (food comboPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Combo Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food comboPizza)))
)

(defrule add-italianBaconEggBreakfastSandwich-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))

   (canEat (food italianBaconEggBreakfastSandwich))

   (not (alreadyAte (mealTime ?mealTime) (food italianBaconEggBreakfastSandwich)))
   =>

   (addFood ?dayOfWeek ?mealTime "Italian Bacon Egg Breakfast Sandwich" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food italianBaconEggBreakfastSandwich)))
)

(defrule add-falafelBurger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food falafelBurger))

   (not (alreadyAte (mealTime ?mealTime) (food falafelBurger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Falafel Burger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food falafelBurger)))
)

(defrule add-greekOmelet-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
   )

   (canEat (food greekOmelet))

   (not (alreadyAte (mealTime ?mealTime) (food greekOmelet)))
   =>

   (addFood ?dayOfWeek ?mealTime "Greek Omelet" (create$ protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food greekOmelet)))
)

(defrule add-housemadeGranola2Servings-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food housemadeGranola2Servings))

   (not (alreadyAte (mealTime ?mealTime) (food housemadeGranola2Servings)))
   =>

   (addFood ?dayOfWeek ?mealTime "Housemade Granola (2 servings)" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food housemadeGranola2Servings)))
)

(defrule add-zuppaToscana-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food zuppaToscana))

   (not (alreadyAte (mealTime ?mealTime) (food zuppaToscana)))
   =>

   (addFood ?dayOfWeek ?mealTime "Zuppa Toscana" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food zuppaToscana)))
)

(defrule add-redCurryBeef-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food redCurryBeef))

   (not (alreadyAte (mealTime ?mealTime) (food redCurryBeef)))
   =>

   (addFood ?dayOfWeek ?mealTime "Red Curry Beef" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food redCurryBeef)))
)

(defrule add-porkBreakfastBurrito-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))

   (canEat (food porkBreakfastBurrito))

   (not (alreadyAte (mealTime ?mealTime) (food porkBreakfastBurrito)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pork Breakfast Burrito" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food porkBreakfastBurrito)))
)

(defrule add-veggiePestoPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
   )

   (canEat (food veggiePestoPizza))

   (not (alreadyAte (mealTime ?mealTime) (food veggiePestoPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Veggie Pesto Pizza" (create$ grain dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food veggiePestoPizza)))
)

(defrule add-roastedYellowPepperPhestoSpread-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))

   (canEat (food roastedYellowPepperPhestoSpread))

   (not (alreadyAte (mealTime ?mealTime) (food roastedYellowPepperPhestoSpread)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Yellow Pepper Phesto Spread" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedYellowPepperPhestoSpread)))
)

(defrule add-miniSesameBagel-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))

   (canEat (food miniSesameBagel))

   (not (alreadyAte (mealTime ?mealTime) (food miniSesameBagel)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mini Sesame Bagel" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food miniSesameBagel)))
)

(defrule add-lemonZatarChicken-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
   )

   (canEat (food lemonZatarChicken))

   (not (alreadyAte (mealTime ?mealTime) (food lemonZatarChicken)))
   =>

   (addFood ?dayOfWeek ?mealTime "Lemon Zatar Chicken" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food lemonZatarChicken)))
)

(defrule add-chickenBreakfastSandwich-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))

   (canEat (food chickenBreakfastSandwich))

   (not (alreadyAte (mealTime ?mealTime) (food chickenBreakfastSandwich)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chicken Breakfast Sandwich" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chickenBreakfastSandwich)))
)

(defrule add-dicedCucumber2-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food dicedCucumber2))

   (not (alreadyAte (mealTime ?mealTime) (food dicedCucumber2)))
   =>

   (addFood ?dayOfWeek ?mealTime "Diced Cucumber (2)" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food dicedCucumber2)))
)

(defrule add-seasonalStudentFarmRoastedVegetableSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food seasonalStudentFarmRoastedVegetableSalad))

   (not (alreadyAte (mealTime ?mealTime) (food seasonalStudentFarmRoastedVegetableSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Seasonal Student Farm Roasted Vegetable Salad" (create$ grain produce))
   (assert (alreadyAte (mealTime ?mealTime) (food seasonalStudentFarmRoastedVegetableSalad)))
)

(defrule add-redSkinHerbPotatoSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food redSkinHerbPotatoSalad))

   (not (alreadyAte (mealTime ?mealTime) (food redSkinHerbPotatoSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Red Skin Herb Potato Salad" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food redSkinHerbPotatoSalad)))
)

(defrule add-tandooriChicken-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food tandooriChicken))

   (not (alreadyAte (mealTime ?mealTime) (food tandooriChicken)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tandoori Chicken" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food tandooriChicken)))
)

(defrule add-lemonCreamShortcake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food lemonCreamShortcake))

   (not (alreadyAte (mealTime ?mealTime) (food lemonCreamShortcake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Lemon & Cream Shortcake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food lemonCreamShortcake)))
)

(defrule add-caesarSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food caesarSalad))

   (not (alreadyAte (mealTime ?mealTime) (food caesarSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Caesar Salad" (create$ produce fat))
   (assert (alreadyAte (mealTime ?mealTime) (food caesarSalad)))
)

(defrule add-beefBarbacoa-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food beefBarbacoa))

   (not (alreadyAte (mealTime ?mealTime) (food beefBarbacoa)))
   =>

   (addFood ?dayOfWeek ?mealTime "Beef Barbacoa" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food beefBarbacoa)))
)

(defrule add-veganChocolateDonut-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))

   (canEat (food veganChocolateDonut))

   (not (alreadyAte (mealTime ?mealTime) (food veganChocolateDonut)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vegan Chocolate Donut" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food veganChocolateDonut)))
)

(defrule add-deepFriedDicedHashBrowns-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food deepFriedDicedHashBrowns))

   (not (alreadyAte (mealTime ?mealTime) (food deepFriedDicedHashBrowns)))
   =>

   (addFood ?dayOfWeek ?mealTime "Deep Fried Diced Hash Browns" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food deepFriedDicedHashBrowns)))
)

(defrule add-mushroomStreetTacos-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))

   (canEat (food mushroomStreetTacos))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomStreetTacos)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom Street Tacos" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomStreetTacos)))
)

(defrule add-creamCheeseFrostedCinnamonRolls2-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))

   (canEat (food creamCheeseFrostedCinnamonRolls2))

   (not (alreadyAte (mealTime ?mealTime) (food creamCheeseFrostedCinnamonRolls2)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cream Cheese Frosted Cinnamon Rolls (2)" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food creamCheeseFrostedCinnamonRolls2)))
)

(defrule add-cukeSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food cukeSalad))

   (not (alreadyAte (mealTime ?mealTime) (food cukeSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cuke Salad" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food cukeSalad)))
)

(defrule add-menudo-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
   )

   (canEat (food menudo))

   (not (alreadyAte (mealTime ?mealTime) (food menudo)))
   =>

   (addFood ?dayOfWeek ?mealTime "Menudo" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food menudo)))
)

(defrule add-sugarRaisedDonut-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))

   (canEat (food sugarRaisedDonut))

   (not (alreadyAte (mealTime ?mealTime) (food sugarRaisedDonut)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sugar Raised Donut" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food sugarRaisedDonut)))
)

(defrule add-assortedVeganCookie-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food assortedVeganCookie))

   (not (alreadyAte (mealTime ?mealTime) (food assortedVeganCookie)))
   =>

   (addFood ?dayOfWeek ?mealTime "Assorted Vegan Cookie" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food assortedVeganCookie)))
)

(defrule add-farmhouseBuffaloChickpeaBurger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))

   (canEat (food farmhouseBuffaloChickpeaBurger))

   (not (alreadyAte (mealTime ?mealTime) (food farmhouseBuffaloChickpeaBurger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Farmhouse Buffalo Chickpea Burger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food farmhouseBuffaloChickpeaBurger)))
)

(defrule add-frostedBrownies-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
   )

   (canEat (food frostedBrownies))

   (not (alreadyAte (mealTime ?mealTime) (food frostedBrownies)))
   =>

   (addFood ?dayOfWeek ?mealTime "Frosted Brownies" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food frostedBrownies)))
)

(defrule add-hummus-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food hummus))

   (not (alreadyAte (mealTime ?mealTime) (food hummus)))
   =>

   (addFood ?dayOfWeek ?mealTime "Hummus" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food hummus)))
)

(defrule add-cinnamonDonutHoles-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))

   (canEat (food cinnamonDonutHoles))

   (not (alreadyAte (mealTime ?mealTime) (food cinnamonDonutHoles)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cinnamon Donut Holes" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food cinnamonDonutHoles)))
)

(defrule add-cheesePizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
   )

   (canEat (food cheesePizza))

   (not (alreadyAte (mealTime ?mealTime) (food cheesePizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cheese Pizza" (create$ grain dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food cheesePizza)))
)

(defrule add-groundLambWithZhug-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
   )

   (canEat (food groundLambWithZhug))

   (not (alreadyAte (mealTime ?mealTime) (food groundLambWithZhug)))
   =>

   (addFood ?dayOfWeek ?mealTime "Ground Lamb with Zhug" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food groundLambWithZhug)))
)

(defrule add-pineappleUpsideDownCake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food pineappleUpsideDownCake))

   (not (alreadyAte (mealTime ?mealTime) (food pineappleUpsideDownCake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pineapple Upside Down Cake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food pineappleUpsideDownCake)))
)

(defrule add-veganOatmealRaisinCookie-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food veganOatmealRaisinCookie))

   (not (alreadyAte (mealTime ?mealTime) (food veganOatmealRaisinCookie)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vegan Oatmeal Raisin Cookie" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food veganOatmealRaisinCookie)))
)

(defrule add-whiteBeanDip-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))

   (canEat (food whiteBeanDip))

   (not (alreadyAte (mealTime ?mealTime) (food whiteBeanDip)))
   =>

   (addFood ?dayOfWeek ?mealTime "White Bean Dip" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food whiteBeanDip)))
)

(defrule add-marinatedCherryTomatoes2-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food marinatedCherryTomatoes2))

   (not (alreadyAte (mealTime ?mealTime) (food marinatedCherryTomatoes2)))
   =>

   (addFood ?dayOfWeek ?mealTime "Marinated Cherry Tomatoes (2)" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food marinatedCherryTomatoes2)))
)

(defrule add-salamiAndMushroomPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
   )

   (canEat (food salamiAndMushroomPizza))

   (not (alreadyAte (mealTime ?mealTime) (food salamiAndMushroomPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Salami and Mushroom Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food salamiAndMushroomPizza)))
)

(defrule add-crazyBread-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food crazyBread))

   (not (alreadyAte (mealTime ?mealTime) (food crazyBread)))
   =>

   (addFood ?dayOfWeek ?mealTime "Crazy Bread" (create$ grain fat))
   (assert (alreadyAte (mealTime ?mealTime) (food crazyBread)))
)

(defrule add-sunflowerButterSandwich-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food sunflowerButterSandwich))

   (not (alreadyAte (mealTime ?mealTime) (food sunflowerButterSandwich)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sunflower Butter Sandwich" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food sunflowerButterSandwich)))
)

(defrule add-roastedArtichokeHearts-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food roastedArtichokeHearts))

   (not (alreadyAte (mealTime ?mealTime) (food roastedArtichokeHearts)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Artichoke Hearts" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedArtichokeHearts)))
)

(defrule add-spicyPorkItalianSausage-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))

   (canEat (food spicyPorkItalianSausage))

   (not (alreadyAte (mealTime ?mealTime) (food spicyPorkItalianSausage)))
   =>

   (addFood ?dayOfWeek ?mealTime "Spicy Pork Italian Sausage" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food spicyPorkItalianSausage)))
)

(defrule add-strawberryShortcake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))

   (canEat (food strawberryShortcake))

   (not (alreadyAte (mealTime ?mealTime) (food strawberryShortcake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Strawberry Shortcake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food strawberryShortcake)))
)

(defrule add-creamyAdoboSpread-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food creamyAdoboSpread))

   (not (alreadyAte (mealTime ?mealTime) (food creamyAdoboSpread)))
   =>

   (addFood ?dayOfWeek ?mealTime "Creamy Adobo Spread" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food creamyAdoboSpread)))
)

(defrule add-mapleDonutVegan-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food mapleDonutVegan))

   (not (alreadyAte (mealTime ?mealTime) (food mapleDonutVegan)))
   =>

   (addFood ?dayOfWeek ?mealTime "Maple Donut Vegan" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food mapleDonutVegan)))
)

(defrule add-rasperrySwirlCheeseCakeBars-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))

   (canEat (food rasperrySwirlCheeseCakeBars))

   (not (alreadyAte (mealTime ?mealTime) (food rasperrySwirlCheeseCakeBars)))
   =>

   (addFood ?dayOfWeek ?mealTime "Rasperry Swirl Cheese Cake Bars" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food rasperrySwirlCheeseCakeBars)))
)

(defrule add-peruvianChickenQuinoaAndCorianderSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
   )

   (canEat (food peruvianChickenQuinoaAndCorianderSoup))

   (not (alreadyAte (mealTime ?mealTime) (food peruvianChickenQuinoaAndCorianderSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Peruvian Chicken Quinoa and Coriander Soup" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food peruvianChickenQuinoaAndCorianderSoup)))
)

(defrule add-arrozCaldo-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food arrozCaldo))

   (not (alreadyAte (mealTime ?mealTime) (food arrozCaldo)))
   =>

   (addFood ?dayOfWeek ?mealTime "Arroz Caldo" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food arrozCaldo)))
)

(defrule add-mushroomToast-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))

   (canEat (food mushroomToast))

   (not (alreadyAte (mealTime ?mealTime) (food mushroomToast)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mushroom Toast" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food mushroomToast)))
)

(defrule add-sausageAndOnionPizza-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food sausageAndOnionPizza))

   (not (alreadyAte (mealTime ?mealTime) (food sausageAndOnionPizza)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sausage and Onion Pizza" (create$ grain protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food sausageAndOnionPizza)))
)

(defrule add-glazedDonutHoles-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))

   (canEat (food glazedDonutHoles))

   (not (alreadyAte (mealTime ?mealTime) (food glazedDonutHoles)))
   =>

   (addFood ?dayOfWeek ?mealTime "Glazed Donut Holes" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food glazedDonutHoles)))
)

(defrule add-shoestringFries-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food shoestringFries))

   (not (alreadyAte (mealTime ?mealTime) (food shoestringFries)))
   =>

   (addFood ?dayOfWeek ?mealTime "Shoestring Fries" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food shoestringFries)))
)

(defrule add-banana-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food banana))

   (not (alreadyAte (mealTime ?mealTime) (food banana)))
   =>

   (addFood ?dayOfWeek ?mealTime "Banana" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food banana)))
)

(defrule add-californiaPastaSalad-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))

   (canEat (food californiaPastaSalad))

   (not (alreadyAte (mealTime ?mealTime) (food californiaPastaSalad)))
   =>

   (addFood ?dayOfWeek ?mealTime "California Pasta Salad" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food californiaPastaSalad)))
)

(defrule add-pestoPasta-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food pestoPasta))

   (not (alreadyAte (mealTime ?mealTime) (food pestoPasta)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pesto Pasta" (create$ grain protein fat))
   (assert (alreadyAte (mealTime ?mealTime) (food pestoPasta)))
)

(defrule add-houseTomatoBasilVinaigrette-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food houseTomatoBasilVinaigrette))

   (not (alreadyAte (mealTime ?mealTime) (food houseTomatoBasilVinaigrette)))
   =>

   (addFood ?dayOfWeek ?mealTime "House Tomato Basil Vinaigrette" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food houseTomatoBasilVinaigrette)))
)

(defrule add-chickenTagine-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))

   (canEat (food chickenTagine))

   (not (alreadyAte (mealTime ?mealTime) (food chickenTagine)))
   =>

   (addFood ?dayOfWeek ?mealTime "Chicken Tagine" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food chickenTagine)))
)

(defrule add-minestroneSoupWithPasta-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food minestroneSoupWithPasta))

   (not (alreadyAte (mealTime ?mealTime) (food minestroneSoupWithPasta)))
   =>

   (addFood ?dayOfWeek ?mealTime "Minestrone Soup with Pasta" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food minestroneSoupWithPasta)))
)

(defrule add-paprikaSweetPotatoes-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food paprikaSweetPotatoes))

   (not (alreadyAte (mealTime ?mealTime) (food paprikaSweetPotatoes)))
   =>

   (addFood ?dayOfWeek ?mealTime "Paprika Sweet Potatoes" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food paprikaSweetPotatoes)))
)

(defrule add-blackBeanBurger-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food blackBeanBurger))

   (not (alreadyAte (mealTime ?mealTime) (food blackBeanBurger)))
   =>

   (addFood ?dayOfWeek ?mealTime "Black Bean Burger" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food blackBeanBurger)))
)

(defrule add-lemonRoastedCarrots-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food lemonRoastedCarrots))

   (not (alreadyAte (mealTime ?mealTime) (food lemonRoastedCarrots)))
   =>

   (addFood ?dayOfWeek ?mealTime "Lemon Roasted Carrots" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food lemonRoastedCarrots)))
)

(defrule add-shrimpTaco-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))

   (canEat (food shrimpTaco))

   (not (alreadyAte (mealTime ?mealTime) (food shrimpTaco)))
   =>

   (addFood ?dayOfWeek ?mealTime "Shrimp Taco" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food shrimpTaco)))
)

(defrule add-miniEverythingBagel-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food miniEverythingBagel))

   (not (alreadyAte (mealTime ?mealTime) (food miniEverythingBagel)))
   =>

   (addFood ?dayOfWeek ?mealTime "Mini Everything Bagel" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food miniEverythingBagel)))
)

(defrule add-moroccanRoastedVegetableSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
   )

   (canEat (food moroccanRoastedVegetableSoup))

   (not (alreadyAte (mealTime ?mealTime) (food moroccanRoastedVegetableSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Moroccan Roasted Vegetable Soup" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food moroccanRoastedVegetableSoup)))
)

(defrule add-herbRoastedRedPotatoes-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food herbRoastedRedPotatoes))

   (not (alreadyAte (mealTime ?mealTime) (food herbRoastedRedPotatoes)))
   =>

   (addFood ?dayOfWeek ?mealTime "Herb Roasted Red Potatoes" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food herbRoastedRedPotatoes)))
)

(defrule add-sauteedKale-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & produce))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food sauteedKale))

   (not (alreadyAte (mealTime ?mealTime) (food sauteedKale)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sauteed Kale" (create$ produce))
   (assert (alreadyAte (mealTime ?mealTime) (food sauteedKale)))
)

(defrule add-cheeseOmelet-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein|dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
   )

   (canEat (food cheeseOmelet))

   (not (alreadyAte (mealTime ?mealTime) (food cheeseOmelet)))
   =>

   (addFood ?dayOfWeek ?mealTime "Cheese Omelet" (create$ protein dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food cheeseOmelet)))
)

(defrule add-blackBeanDipSide-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))

   (canEat (food blackBeanDipSide))

   (not (alreadyAte (mealTime ?mealTime) (food blackBeanDipSide)))
   =>

   (addFood ?dayOfWeek ?mealTime "Black Bean Dip (side)" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food blackBeanDipSide)))
)

(defrule add-lentilCake-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))

   (canEat (food lentilCake))

   (not (alreadyAte (mealTime ?mealTime) (food lentilCake)))
   =>

   (addFood ?dayOfWeek ?mealTime "Lentil Cake" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food lentilCake)))
)

(defrule add-taterTots-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
   )

   (canEat (food taterTots))

   (not (alreadyAte (mealTime ?mealTime) (food taterTots)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tater Tots" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food taterTots)))
)

(defrule add-appleCinnamonMuffin-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))

   (canEat (food appleCinnamonMuffin))

   (not (alreadyAte (mealTime ?mealTime) (food appleCinnamonMuffin)))
   =>

   (addFood ?dayOfWeek ?mealTime "Apple Cinnamon Muffin" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food appleCinnamonMuffin)))
)

(defrule add-fortifiedSoyMilkDrink-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & dairy))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food fortifiedSoyMilkDrink))

   (not (alreadyAte (mealTime ?mealTime) (food fortifiedSoyMilkDrink)))
   =>

   (addFood ?dayOfWeek ?mealTime "Fortified Soy Milk (drink)" (create$ dairy))
   (assert (alreadyAte (mealTime ?mealTime) (food fortifiedSoyMilkDrink)))
)

(defrule add-houseRanchDressing-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food houseRanchDressing))

   (not (alreadyAte (mealTime ?mealTime) (food houseRanchDressing)))
   =>

   (addFood ?dayOfWeek ?mealTime "House Ranch Dressing" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food houseRanchDressing)))
)

(defrule add-roastedTurkey-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
   )

   (canEat (food roastedTurkey))

   (not (alreadyAte (mealTime ?mealTime) (food roastedTurkey)))
   =>

   (addFood ?dayOfWeek ?mealTime "Roasted Turkey" (create$ protein))
   (assert (alreadyAte (mealTime ?mealTime) (food roastedTurkey)))
)

(defrule add-tofuChorizoHotDog-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))

   (canEat (food tofuChorizoHotDog))

   (not (alreadyAte (mealTime ?mealTime) (food tofuChorizoHotDog)))
   =>

   (addFood ?dayOfWeek ?mealTime "Tofu Chorizo Hot Dog" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food tofuChorizoHotDog)))
)

(defrule add-turmericAndRaisinRice-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
   )

   (canEat (food turmericAndRaisinRice))

   (not (alreadyAte (mealTime ?mealTime) (food turmericAndRaisinRice)))
   =>

   (addFood ?dayOfWeek ?mealTime "Turmeric and Raisin Rice" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food turmericAndRaisinRice)))
)

(defrule add-veganLemonDropCookie-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))

   (canEat (food veganLemonDropCookie))

   (not (alreadyAte (mealTime ?mealTime) (food veganLemonDropCookie)))
   =>

   (addFood ?dayOfWeek ?mealTime "Vegan Lemon Drop Cookie" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food veganLemonDropCookie)))
)

(defrule add-mmBrownies-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))

   (canEat (food mmBrownies))

   (not (alreadyAte (mealTime ?mealTime) (food mmBrownies)))
   =>

   (addFood ?dayOfWeek ?mealTime "M&M; Brownies" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food mmBrownies)))
)

(defrule add-blackBeanSoup-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))

   (canEat (food blackBeanSoup))

   (not (alreadyAte (mealTime ?mealTime) (food blackBeanSoup)))
   =>

   (addFood ?dayOfWeek ?mealTime "Black Bean Soup" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food blackBeanSoup)))
)

(defrule add-glutenfreeSunflowerButterSandwich-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|protein))

   (or   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & sunday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & monday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & wednesday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & thursday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & dinner))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & lunch))
         (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))
   )

   (canEat (food glutenfreeSunflowerButterSandwich))

   (not (alreadyAte (mealTime ?mealTime) (food glutenfreeSunflowerButterSandwich)))
   =>

   (addFood ?dayOfWeek ?mealTime "Gluten-Free Sunflower Butter Sandwich" (create$ grain protein))
   (assert (alreadyAte (mealTime ?mealTime) (food glutenfreeSunflowerButterSandwich)))
)

(defrule add-sourCream-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food sourCream))

   (not (alreadyAte (mealTime ?mealTime) (food sourCream)))
   =>

   (addFood ?dayOfWeek ?mealTime "Sour Cream" (create$ fat))
   (assert (alreadyAte (mealTime ?mealTime) (food sourCream)))
)

(defrule add-curryChips-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & saturday) (mealTime ?mealTime & dinner))

   (canEat (food curryChips))

   (not (alreadyAte (mealTime ?mealTime) (food curryChips)))
   =>

   (addFood ?dayOfWeek ?mealTime "Curry Chips" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food curryChips)))
)

(defrule add-pumpkinBread-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain|fat))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast))

   (canEat (food pumpkinBread))

   (not (alreadyAte (mealTime ?mealTime) (food pumpkinBread)))
   =>

   (addFood ?dayOfWeek ?mealTime "Pumpkin Bread" (create$ grain fat))
   (assert (alreadyAte (mealTime ?mealTime) (food pumpkinBread)))
)

(defrule add-bananaWalnutBread-rule
   (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & grain))

   (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & friday) (mealTime ?mealTime & breakfast))

   (canEat (food bananaWalnutBread))

   (not (alreadyAte (mealTime ?mealTime) (food bananaWalnutBread)))
   =>

   (addFood ?dayOfWeek ?mealTime "Banana Walnut Bread" (create$ grain))
   (assert (alreadyAte (mealTime ?mealTime) (food bananaWalnutBread)))
)

