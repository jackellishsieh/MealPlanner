/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Rules that determine which foods can be eaten based on dietary restrictions.
*
* This file consists entirely of rules that assert whether a food can be eaten based on dietary restrictions:
* gluten free, vegan, vegetarian, nut free, dairy free
* Due to backward-chaining, this file must be batched in before addFoodRules.clp
*/

/*
* Backward-chaining template for storing when a food can be eaten.
* Used by food-adding rules to determine whether a food is consumable.
*/
(deftemplate canEat (slot food))

(do-backward-chaining canEat)

/*
* ================================================================================
* CAN EAT RULES
* Each rule in this section determines whether a food can be eaten using dietary restrictions.
* Each rule takes the form 
*     (defrule can-eat-[Food Name]-rule
*        (need-canEat (food [Trace Ingredient 1]))
*
*        (dietaryRestriction (applicability no) (restriction [Dietary Restriction 1]))
*        (dietaryRestriction (applicability no) (restriction [Dietary Restriction 2]))
*        ...
* 
*        (canEat (food [Main Ingredient 1]))
*        (canEat (food [Main Ingredient 2]))
*        ...
*        
*        (canEat (food [Trace Ingredient 1]))
*        (canEat (food [Trace Ingredient 2]))
*        ...
*        =>
*        (assert (canEat (food [Food Name]])))
*     )
*
* As such, each rule is relatively similar, predictable, and self-explanatory, so repetitive documentation has been omitted. 
* ================================================================================
*/
(defrule can-eat-sandwichSauce-rule
   (need-canEat (food sandwichSauce))

   (dietaryRestriction (applicability no) (restriction vegan))
   =>
   (assert (canEat (food sandwichSauce)))
)

(defrule can-eat-assortedBrownies-rule
   (need-canEat (food assortedBrownies))

   (canEat (food brownies))
   =>
   (assert (canEat (food assortedBrownies)))
)

(defrule can-eat-appleCinnamonDanish-rule
   (need-canEat (food appleCinnamonDanish))

   (canEat (food pastry))
   =>
   (assert (canEat (food appleCinnamonDanish)))
)

(defrule can-eat-overNightOats-rule
   (need-canEat (food overNightOats))

   (canEat (food mixedNuts))
   (canEat (food oats))
   (canEat (food yogurt))
   =>
   (assert (canEat (food overNightOats)))
)

(defrule can-eat-appleCinnamonDonut-rule
   (need-canEat (food appleCinnamonDonut))

   (canEat (food pastry))
   =>
   (assert (canEat (food appleCinnamonDonut)))
)

(defrule can-eat-beanSprouts-rule
   (need-canEat (food beanSprouts))
   =>
   (assert (canEat (food beanSprouts)))
)

(defrule can-eat-couscousPrimitive-rule
   (need-canEat (food couscousPrimitive))
   =>
   (assert (canEat (food couscousPrimitive)))
)

(defrule can-eat-plumTofu-rule
   (need-canEat (food plumTofu))

   (canEat (food tofu))
   =>
   (assert (canEat (food plumTofu)))
)

(defrule can-eat-ranch-rule
   (need-canEat (food ranch))
   =>
   (assert (canEat (food ranch)))
)

(defrule can-eat-spicyPorkAndMustardGreensSoup-rule
   (need-canEat (food spicyPorkAndMustardGreensSoup))

   (canEat (food pork))
   (canEat (food riceNoodlesPrimitive))
   =>
   (assert (canEat (food spicyPorkAndMustardGreensSoup)))
)

(defrule can-eat-roastedYukonGoldPotatoes-rule
   (need-canEat (food roastedYukonGoldPotatoes))

   (canEat (food potato))
   =>
   (assert (canEat (food roastedYukonGoldPotatoes)))
)

(defrule can-eat-milk-rule
   (need-canEat (food milk))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food milk)))
)

(defrule can-eat-redBeetHummus-rule
   (need-canEat (food redBeetHummus))

   (canEat (food beans))
   =>
   (assert (canEat (food redBeetHummus)))
)

(defrule can-eat-mushroomOnionPizza-rule
   (need-canEat (food mushroomOnionPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food mushroom))
   =>
   (assert (canEat (food mushroomOnionPizza)))
)

(defrule can-eat-taiwaneseChicken-rule
   (need-canEat (food taiwaneseChicken))

   (canEat (food chicken))
   =>
   (assert (canEat (food taiwaneseChicken)))
)

(defrule can-eat-plateSauce-rule
   (need-canEat (food plateSauce))
   =>
   (assert (canEat (food plateSauce)))
)

(defrule can-eat-edamameHummus-rule
   (need-canEat (food edamameHummus))

   (canEat (food beans))
   =>
   (assert (canEat (food edamameHummus)))
)

(defrule can-eat-steelCutOats-rule
   (need-canEat (food steelCutOats))

   (canEat (food oats))
   =>
   (assert (canEat (food steelCutOats)))
)

(defrule can-eat-bananaNutMuffin-rule
   (need-canEat (food bananaNutMuffin))

   (canEat (food pastry))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food bananaNutMuffin)))
)

(defrule can-eat-pepperoniPizza-rule
   (need-canEat (food pepperoniPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food pork))

   (canEat (food tomato))
   =>
   (assert (canEat (food pepperoniPizza)))
)

(defrule can-eat-kaleAndWhiteBeanSoup-rule
   (need-canEat (food kaleAndWhiteBeanSoup))

   (canEat (food beans))
   (canEat (food kale))
   =>
   (assert (canEat (food kaleAndWhiteBeanSoup)))
)

(defrule can-eat-chineseBeefAndPotatoStew-rule
   (need-canEat (food chineseBeefAndPotatoStew))

   (canEat (food beef))
   (canEat (food potato))
   =>
   (assert (canEat (food chineseBeefAndPotatoStew)))
)

(defrule can-eat-tofuphoWok-rule
   (need-canEat (food tofuphoWok))

   (canEat (food riceNoodlesPrimitive))
   (canEat (food tofu))
   =>
   (assert (canEat (food tofuphoWok)))
)

(defrule can-eat-chocolateRaspberryBrownieCheesecake-rule
   (need-canEat (food chocolateRaspberryBrownieCheesecake))

   (canEat (food brownies))
   =>
   (assert (canEat (food chocolateRaspberryBrownieCheesecake)))
)

(defrule can-eat-chicken-rule
   (need-canEat (food chicken))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food chicken)))
)

(defrule can-eat-phoBar-rule
   (need-canEat (food phoBar))

   (canEat (food beef))
   (canEat (food riceNoodlesPrimitive))
   =>
   (assert (canEat (food phoBar)))
)

(defrule can-eat-chickenFriedSteak-rule
   (need-canEat (food chickenFriedSteak))

   (canEat (food bread))
   (canEat (food chicken))

   (canEat (food egg))
   (canEat (food milk))
   =>
   (assert (canEat (food chickenFriedSteak)))
)

(defrule can-eat-miniPlainBagel-rule
   (need-canEat (food miniPlainBagel))

   (canEat (food bagel))
   =>
   (assert (canEat (food miniPlainBagel)))
)

(defrule can-eat-creamOfTomatoSoup-rule
   (need-canEat (food creamOfTomatoSoup))

   (canEat (food cream))

   (canEat (food tomato))
   =>
   (assert (canEat (food creamOfTomatoSoup)))
)

(defrule can-eat-cinnamonSugarDonut-rule
   (need-canEat (food cinnamonSugarDonut))

   (canEat (food pastry))
   =>
   (assert (canEat (food cinnamonSugarDonut)))
)

(defrule can-eat-pestoChickenCaesarWrap-rule
   (need-canEat (food pestoChickenCaesarWrap))

   (canEat (food chicken))
   (canEat (food flourTortillaPrimitive))
   (canEat (food mixedNuts))

   (canEat (food anchovies))
   (canEat (food saladDressing))
   =>
   (assert (canEat (food pestoChickenCaesarWrap)))
)

(defrule can-eat-veganSpinachDip-rule
   (need-canEat (food veganSpinachDip))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food veganSpinachDip)))
)

(defrule can-eat-lettuce-rule
   (need-canEat (food lettuce))
   =>
   (assert (canEat (food lettuce)))
)

(defrule can-eat-clam-rule
   (need-canEat (food clam))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food clam)))
)

(defrule can-eat-pestoFestivePizza-rule
   (need-canEat (food pestoFestivePizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food pestoFestivePizza)))
)

(defrule can-eat-beef-rule
   (need-canEat (food beef))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food beef)))
)

(defrule can-eat-chipotleStewWithAlmondBrittle-rule
   (need-canEat (food chipotleStewWithAlmondBrittle))

   (canEat (food potato))
   (canEat (food veganCream))

   (canEat (food flourTortillaPrimitive))
   (canEat (food mixedNuts))
   =>
   (assert (canEat (food chipotleStewWithAlmondBrittle)))
)

(defrule can-eat-cheddarCheese-rule
   (need-canEat (food cheddarCheese))

   (canEat (food milk))
   =>
   (assert (canEat (food cheddarCheese)))
)

(defrule can-eat-peanutButterSide-rule
   (need-canEat (food peanutButterSide))

   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food peanutButterSide)))
)

(defrule can-eat-mushroomLemonRisotto-rule
   (need-canEat (food mushroomLemonRisotto))

   (canEat (food mushroom))
   (canEat (food pasta))
   =>
   (assert (canEat (food mushroomLemonRisotto)))
)

(defrule can-eat-glutenfreeToast-rule
   (need-canEat (food glutenfreeToast))
   =>
   (assert (canEat (food glutenfreeToast)))
)

(defrule can-eat-guacamoleSide-rule
   (need-canEat (food guacamoleSide))
   =>
   (assert (canEat (food guacamoleSide)))
)

(defrule can-eat-miniOnionBagel-rule
   (need-canEat (food miniOnionBagel))

   (canEat (food bagel))
   =>
   (assert (canEat (food miniOnionBagel)))
)

(defrule can-eat-mushroom-rule
   (need-canEat (food mushroom))
   =>
   (assert (canEat (food mushroom)))
)

(defrule can-eat-bearClaw-rule
   (need-canEat (food bearClaw))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food bearClaw)))
)

(defrule can-eat-assortedNoveltyIceCream-rule
   (need-canEat (food assortedNoveltyIceCream))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food assortedNoveltyIceCream)))
)

(defrule can-eat-chocolate-rule
   (need-canEat (food chocolate))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food chocolate)))
)

(defrule can-eat-orangeChickenWithStickyRice-rule
   (need-canEat (food orangeChickenWithStickyRice))

   (canEat (food chicken))
   (canEat (food rice))
   =>
   (assert (canEat (food orangeChickenWithStickyRice)))
)

(defrule can-eat-shawarmaChicken-rule
   (need-canEat (food shawarmaChicken))

   (canEat (food chicken))
   =>
   (assert (canEat (food shawarmaChicken)))
)

(defrule can-eat-greens-rule
   (need-canEat (food greens))

   (canEat (food mixedVegetables))
   =>
   (assert (canEat (food greens)))
)

(defrule can-eat-pintoBeans-rule
   (need-canEat (food pintoBeans))

   (canEat (food beans))
   =>
   (assert (canEat (food pintoBeans)))
)

(defrule can-eat-breakfastBurritoBar-rule
   (need-canEat (food breakfastBurritoBar))

   (dietaryRestriction (applicability no) (restriction dairyFree))

   (canEat (food egg))
   (canEat (food flourTortillaPrimitive))
   =>
   (assert (canEat (food breakfastBurritoBar)))
)

(defrule can-eat-toffeeStickyPuddingCake-rule
   (need-canEat (food toffeeStickyPuddingCake))

   (canEat (food pudding))
   (canEat (food sugar))

   (canEat (food egg))
   (canEat (food milk))
   (canEat (food mixedNuts))
   =>
   (assert (canEat (food toffeeStickyPuddingCake)))
)

(defrule can-eat-newYorkStripSteak-rule
   (need-canEat (food newYorkStripSteak))

   (canEat (food beef))
   =>
   (assert (canEat (food newYorkStripSteak)))
)

(defrule can-eat-cranberryOrangeMuffin-rule
   (need-canEat (food cranberryOrangeMuffin))

   (canEat (food pastry))
   =>
   (assert (canEat (food cranberryOrangeMuffin)))
)

(defrule can-eat-sunflowerButter-rule
   (need-canEat (food sunflowerButter))
   =>
   (assert (canEat (food sunflowerButter)))
)

(defrule can-eat-stickyRice-rule
   (need-canEat (food stickyRice))

   (canEat (food rice))
   =>
   (assert (canEat (food stickyRice)))
)

(defrule can-eat-fishPoBoy-rule
   (need-canEat (food fishPoBoy))

   (canEat (food bread))
   (canEat (food cod))
   (canEat (food sandwichSauce))
   (canEat (food tomato))
   =>
   (assert (canEat (food fishPoBoy)))
)

(defrule can-eat-jasmineRice-rule
   (need-canEat (food jasmineRice))

   (canEat (food rice))
   =>
   (assert (canEat (food jasmineRice)))
)

(defrule can-eat-garlicBreadsticks-rule
   (need-canEat (food garlicBreadsticks))

   (canEat (food bread))

   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food garlicBreadsticks)))
)

(defrule can-eat-vanillaChiaSeedPuddingWithBlueberrries-rule
   (need-canEat (food vanillaChiaSeedPuddingWithBlueberrries))

   (canEat (food mixedFruits))
   (canEat (food pudding))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food vanillaChiaSeedPuddingWithBlueberrries)))
)

(defrule can-eat-bbqChickenPizza-rule
   (need-canEat (food bbqChickenPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food chicken))
   =>
   (assert (canEat (food bbqChickenPizza)))
)

(defrule can-eat-tofu-rule
   (need-canEat (food tofu))
   =>
   (assert (canEat (food tofu)))
)

(defrule can-eat-potato-rule
   (need-canEat (food potato))
   =>
   (assert (canEat (food potato)))
)

(defrule can-eat-chickenPattySandwich-rule
   (need-canEat (food chickenPattySandwich))

   (canEat (food bread))
   (canEat (food chicken))

   (canEat (food mayo))
   =>
   (assert (canEat (food chickenPattySandwich)))
)

(defrule can-eat-fishChips-rule
   (need-canEat (food fishChips))

   (dietaryRestriction (applicability no) (restriction dairyFree))

   (canEat (food cod))
   (canEat (food potatoFries))

   (canEat (food bread))
   =>
   (assert (canEat (food fishChips)))
)

(defrule can-eat-tofuPokeBowl-rule
   (need-canEat (food tofuPokeBowl))

   (canEat (food saladDressing))
   (canEat (food tofu))

   (canEat (food bread))
   =>
   (assert (canEat (food tofuPokeBowl)))
)

(defrule can-eat-classicPotatoSalad-rule
   (need-canEat (food classicPotatoSalad))
   =>
   (assert (canEat (food classicPotatoSalad)))
)

(defrule can-eat-riceNoodles-rule
   (need-canEat (food riceNoodles))

   (canEat (food riceNoodlesPrimitive))
   =>
   (assert (canEat (food riceNoodles)))
)

(defrule can-eat-hardBoiledEggs-rule
   (need-canEat (food hardBoiledEggs))

   (canEat (food egg))
   =>
   (assert (canEat (food hardBoiledEggs)))
)

(defrule can-eat-porkChop-rule
   (need-canEat (food porkChop))

   (canEat (food plateSauce))
   (canEat (food pork))
   =>
   (assert (canEat (food porkChop)))
)

(defrule can-eat-oatmeal-rule
   (need-canEat (food oatmeal))

   (canEat (food oats))
   =>
   (assert (canEat (food oatmeal)))
)

(defrule can-eat-blueberryMuffin-rule
   (need-canEat (food blueberryMuffin))

   (canEat (food pastry))
   =>
   (assert (canEat (food blueberryMuffin)))
)

(defrule can-eat-mixedFruits-rule
   (need-canEat (food mixedFruits))
   =>
   (assert (canEat (food mixedFruits)))
)

(defrule can-eat-blueberriesCreamDanish-rule
   (need-canEat (food blueberriesCreamDanish))

   (canEat (food cream))

   (canEat (food bread))
   (canEat (food egg))
   =>
   (assert (canEat (food blueberriesCreamDanish)))
)

(defrule can-eat-roastedAsparagus-rule
   (need-canEat (food roastedAsparagus))
   =>
   (assert (canEat (food roastedAsparagus)))
)

(defrule can-eat-fruitSalad-rule
   (need-canEat (food fruitSalad))

   (canEat (food mixedFruits))
   =>
   (assert (canEat (food fruitSalad)))
)

(defrule can-eat-pork-rule
   (need-canEat (food pork))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food pork)))
)

(defrule can-eat-deepFriedChickpeas-rule
   (need-canEat (food deepFriedChickpeas))
   =>
   (assert (canEat (food deepFriedChickpeas)))
)

(defrule can-eat-brownies-rule
   (need-canEat (food brownies))

   (canEat (food chocolate))
   (canEat (food sugar))

   (canEat (food bread))
   (canEat (food egg))
   =>
   (assert (canEat (food brownies)))
)

(defrule can-eat-bolivianHominySalad-rule
   (need-canEat (food bolivianHominySalad))
   =>
   (assert (canEat (food bolivianHominySalad)))
)

(defrule can-eat-roastedEggplant-rule
   (need-canEat (food roastedEggplant))
   =>
   (assert (canEat (food roastedEggplant)))
)

(defrule can-eat-newYorkCheesecakeBars-rule
   (need-canEat (food newYorkCheesecakeBars))

   (canEat (food cream))
   (canEat (food sugar))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food egg))
   =>
   (assert (canEat (food newYorkCheesecakeBars)))
)

(defrule can-eat-indianSpicedPotatoes-rule
   (need-canEat (food indianSpicedPotatoes))

   (canEat (food potato))
   =>
   (assert (canEat (food indianSpicedPotatoes)))
)

(defrule can-eat-indianSamosasWithChutney-rule
   (need-canEat (food indianSamosasWithChutney))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food indianSamosasWithChutney)))
)

(defrule can-eat-chickpeaFarm-rule
   (need-canEat (food chickpeaFarm))

   (canEat (food beans))

   (canEat (food bread))
   =>
   (assert (canEat (food chickpeaFarm)))
)

(defrule can-eat-romaineLettuce-rule
   (need-canEat (food romaineLettuce))

   (canEat (food lettuce))
   =>
   (assert (canEat (food romaineLettuce)))
)

(defrule can-eat-toast-rule
   (need-canEat (food toast))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food toast)))
)

(defrule can-eat-beyondMeatBurger-rule
   (need-canEat (food beyondMeatBurger))

   (canEat (food beyondMeat))
   (canEat (food bread))

   (canEat (food lettuce))
   (canEat (food mayo))
   (canEat (food tomato))
   =>
   (assert (canEat (food beyondMeatBurger)))
)

(defrule can-eat-couscous-rule
   (need-canEat (food couscous))

   (canEat (food couscousPrimitive))
   =>
   (assert (canEat (food couscous)))
)

(defrule can-eat-milkDrink-rule
   (need-canEat (food milkDrink))

   (canEat (food milk))
   =>
   (assert (canEat (food milkDrink)))
)

(defrule can-eat-tuxedoTruffleMousseCake-rule
   (need-canEat (food tuxedoTruffleMousseCake))

   (canEat (food chocolate))
   (canEat (food cream))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food egg))
   =>
   (assert (canEat (food tuxedoTruffleMousseCake)))
)

(defrule can-eat-mixedNuts-rule
   (need-canEat (food mixedNuts))

   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food mixedNuts)))
)

(defrule can-eat-rice-rule
   (need-canEat (food rice))
   =>
   (assert (canEat (food rice)))
)

(defrule can-eat-tiramisu-rule
   (need-canEat (food tiramisu))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food tiramisu)))
)

(defrule can-eat-miniPoppySeedBagel-rule
   (need-canEat (food miniPoppySeedBagel))

   (canEat (food bagel))
   =>
   (assert (canEat (food miniPoppySeedBagel)))
)

(defrule can-eat-mexicanRice-rule
   (need-canEat (food mexicanRice))

   (canEat (food rice))
   =>
   (assert (canEat (food mexicanRice)))
)

(defrule can-eat-mixedVegetables-rule
   (need-canEat (food mixedVegetables))
   =>
   (assert (canEat (food mixedVegetables)))
)

(defrule can-eat-newEnglandClamChowder-rule
   (need-canEat (food newEnglandClamChowder))

   (canEat (food bread))
   (canEat (food clam))
   (canEat (food cream))

   (canEat (food pork))
   =>
   (assert (canEat (food newEnglandClamChowder)))
)

(defrule can-eat-tomYumSoup-rule
   (need-canEat (food tomYumSoup))

   (canEat (food chicken))
   (canEat (food mushroom))

   (canEat (food cod))
   =>
   (assert (canEat (food tomYumSoup)))
)

(defrule can-eat-cheeseRavioliWithRoastedTomatoSauce-rule
   (need-canEat (food cheeseRavioliWithRoastedTomatoSauce))

   (canEat (food cheddarCheese))
   (canEat (food pasta))

   (canEat (food tomato))
   =>
   (assert (canEat (food cheeseRavioliWithRoastedTomatoSauce)))
)

(defrule can-eat-friesWedgesSpicy-rule
   (need-canEat (food friesWedgesSpicy))

   (dietaryRestriction (applicability no) (restriction glutenFree))

   (canEat (food potato))
   =>
   (assert (canEat (food friesWedgesSpicy)))
)

(defrule can-eat-cowboyBurger-rule
   (need-canEat (food cowboyBurger))

   (canEat (food beef))
   (canEat (food bread))
   (canEat (food mushroom))

   (canEat (food cheddarCheese))
   (canEat (food mayo))
   =>
   (assert (canEat (food cowboyBurger)))
)

(defrule can-eat-apple-rule
   (need-canEat (food apple))
   =>
   (assert (canEat (food apple)))
)

(defrule can-eat-classicMacaroniSalad-rule
   (need-canEat (food classicMacaroniSalad))

   (canEat (food pasta))
   =>
   (assert (canEat (food classicMacaroniSalad)))
)

(defrule can-eat-elvisFrenchToast-rule
   (need-canEat (food elvisFrenchToast))

   (canEat (food bread))
   (canEat (food cream))

   (canEat (food egg))
   (canEat (food mixedNuts))
   =>
   (assert (canEat (food elvisFrenchToast)))
)

(defrule can-eat-pasta-rule
   (need-canEat (food pasta))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food pasta)))
)

(defrule can-eat-tofuScramble-rule
   (need-canEat (food tofuScramble))

   (canEat (food tofu))
   =>
   (assert (canEat (food tofuScramble)))
)

(defrule can-eat-eggsFriedToOrder-rule
   (need-canEat (food eggsFriedToOrder))

   (canEat (food egg))
   =>
   (assert (canEat (food eggsFriedToOrder)))
)

(defrule can-eat-grilledLemons-rule
   (need-canEat (food grilledLemons))
   =>
   (assert (canEat (food grilledLemons)))
)

(defrule can-eat-mushroomPho-rule
   (need-canEat (food mushroomPho))

   (canEat (food mushroom))
   (canEat (food riceNoodlesPrimitive))
   =>
   (assert (canEat (food mushroomPho)))
)

(defrule can-eat-veganChocolateChipCookie-rule
   (need-canEat (food veganChocolateChipCookie))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food veganChocolateChipCookie)))
)

(defrule can-eat-basilPestoPastaSalad-rule
   (need-canEat (food basilPestoPastaSalad))

   (canEat (food pasta))
   (canEat (food plateSauce))
   =>
   (assert (canEat (food basilPestoPastaSalad)))
)

(defrule can-eat-springCouscousSalad-rule
   (need-canEat (food springCouscousSalad))

   (canEat (food couscousPrimitive))
   =>
   (assert (canEat (food springCouscousSalad)))
)

(defrule can-eat-arugulaPhesto-rule
   (need-canEat (food arugulaPhesto))

   (canEat (food lettuce))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food arugulaPhesto)))
)

(defrule can-eat-santaFeChickenSalad-rule
   (need-canEat (food santaFeChickenSalad))

   (canEat (food chicken))
   (canEat (food lettuce))
   (canEat (food rice))

   (canEat (food beans))
   (canEat (food saladDressing))
   =>
   (assert (canEat (food santaFeChickenSalad)))
)

(defrule can-eat-flourTortillaPrimitive-rule
   (need-canEat (food flourTortillaPrimitive))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food flourTortillaPrimitive)))
)

(defrule can-eat-orange-rule
   (need-canEat (food orange))
   =>
   (assert (canEat (food orange)))
)

(defrule can-eat-frenchDip-rule
   (need-canEat (food frenchDip))

   (dietaryRestriction (applicability no) (restriction dairyFree))

   (canEat (food beef))
   (canEat (food bread))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food frenchDip)))
)

(defrule can-eat-bread-rule
   (need-canEat (food bread))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food bread)))
)

(defrule can-eat-proteinOmelet-rule
   (need-canEat (food proteinOmelet))

   (dietaryRestriction (applicability no) (restriction glutenFree))

   (canEat (food cheddarCheese))
   (canEat (food egg))
   (canEat (food pork))
   =>
   (assert (canEat (food proteinOmelet)))
)

(defrule can-eat-cheeseburger-rule
   (need-canEat (food cheeseburger))

   (canEat (food beef))
   (canEat (food bread))

   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food cheeseburger)))
)

(defrule can-eat-chocolateRaisedDonut-rule
   (need-canEat (food chocolateRaisedDonut))

   (canEat (food chocolate))
   (canEat (food pastry))
   =>
   (assert (canEat (food chocolateRaisedDonut)))
)

(defrule can-eat-chickenChimichuriSalad-rule
   (need-canEat (food chickenChimichuriSalad))

   (canEat (food chicken))
   (canEat (food lettuce))
   (canEat (food mushroom))

   (canEat (food pasta))
   =>
   (assert (canEat (food chickenChimichuriSalad)))
)

(defrule can-eat-pudding-rule
   (need-canEat (food pudding))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food pudding)))
)

(defrule can-eat-lemonBars-rule
   (need-canEat (food lemonBars))

   (canEat (food pastry))
   =>
   (assert (canEat (food lemonBars)))
)

(defrule can-eat-spicyCucumberSalad-rule
   (need-canEat (food spicyCucumberSalad))
   =>
   (assert (canEat (food spicyCucumberSalad)))
)

(defrule can-eat-flourTortilla-rule
   (need-canEat (food flourTortilla))

   (canEat (food flourTortillaPrimitive))
   =>
   (assert (canEat (food flourTortilla)))
)

(defrule can-eat-mushroomAndTomatoOmelet-rule
   (need-canEat (food mushroomAndTomatoOmelet))

   (canEat (food egg))
   (canEat (food fetaCheese))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food mushroomAndTomatoOmelet)))
)

(defrule can-eat-vegAuPistouSoupWithShells-rule
   (need-canEat (food vegAuPistouSoupWithShells))

   (canEat (food beans))
   (canEat (food mixedVegetables))
   (canEat (food pasta))
   =>
   (assert (canEat (food vegAuPistouSoupWithShells)))
)

(defrule can-eat-shrimpBurrito-rule
   (need-canEat (food shrimpBurrito))

   (dietaryRestriction (applicability no) (restriction dairyFree))

   (canEat (food flourTortillaPrimitive))
   (canEat (food rice))
   (canEat (food shrimp))
   =>
   (assert (canEat (food shrimpBurrito)))
)

(defrule can-eat-comboPizza-rule
   (need-canEat (food comboPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food pork))
   =>
   (assert (canEat (food comboPizza)))
)

(defrule can-eat-italianBaconEggBreakfastSandwich-rule
   (need-canEat (food italianBaconEggBreakfastSandwich))

   (canEat (food bread))
   (canEat (food egg))

   (canEat (food cheddarCheese))
   (canEat (food pork))
   =>
   (assert (canEat (food italianBaconEggBreakfastSandwich)))
)

(defrule can-eat-falafelBurger-rule
   (need-canEat (food falafelBurger))

   (canEat (food bread))
   (canEat (food falafel))
   =>
   (assert (canEat (food falafelBurger)))
)

(defrule can-eat-greekOmelet-rule
   (need-canEat (food greekOmelet))

   (canEat (food egg))
   (canEat (food fetaCheese))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food greekOmelet)))
)

(defrule can-eat-housemadeGranola2Servings-rule
   (need-canEat (food housemadeGranola2Servings))

   (canEat (food mixedNuts))
   (canEat (food oats))
   =>
   (assert (canEat (food housemadeGranola2Servings)))
)

(defrule can-eat-veganCream-rule
   (need-canEat (food veganCream))
   =>
   (assert (canEat (food veganCream)))
)

(defrule can-eat-zuppaToscana-rule
   (need-canEat (food zuppaToscana))

   (canEat (food pork))
   (canEat (food potato))

   (canEat (food cream))
   =>
   (assert (canEat (food zuppaToscana)))
)

(defrule can-eat-redCurryBeef-rule
   (need-canEat (food redCurryBeef))

   (canEat (food beef))

   (canEat (food shrimp))
   =>
   (assert (canEat (food redCurryBeef)))
)

(defrule can-eat-porkBreakfastBurrito-rule
   (need-canEat (food porkBreakfastBurrito))

   (canEat (food flourTortillaPrimitive))
   (canEat (food pork))

   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food porkBreakfastBurrito)))
)

(defrule can-eat-veggiePestoPizza-rule
   (need-canEat (food veggiePestoPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food veggiePestoPizza)))
)

(defrule can-eat-roastedYellowPepperPhestoSpread-rule
   (need-canEat (food roastedYellowPepperPhestoSpread))

   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food roastedYellowPepperPhestoSpread)))
)

(defrule can-eat-potatoFries-rule
   (need-canEat (food potatoFries))

   (canEat (food potato))
   =>
   (assert (canEat (food potatoFries)))
)

(defrule can-eat-miniSesameBagel-rule
   (need-canEat (food miniSesameBagel))

   (canEat (food bagel))
   =>
   (assert (canEat (food miniSesameBagel)))
)

(defrule can-eat-lemonZatarChicken-rule
   (need-canEat (food lemonZatarChicken))

   (canEat (food chicken))
   =>
   (assert (canEat (food lemonZatarChicken)))
)

(defrule can-eat-goatCheese-rule
   (need-canEat (food goatCheese))

   (dietaryRestriction (applicability no) (restriction vegan))
   =>
   (assert (canEat (food goatCheese)))
)

(defrule can-eat-chickenBreakfastSandwich-rule
   (need-canEat (food chickenBreakfastSandwich))

   (canEat (food bread))
   (canEat (food chicken))

   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food chickenBreakfastSandwich)))
)

(defrule can-eat-bagel-rule
   (need-canEat (food bagel))

   (canEat (food bread))
   =>
   (assert (canEat (food bagel)))
)

(defrule can-eat-dicedCucumber2-rule
   (need-canEat (food dicedCucumber2))
   =>
   (assert (canEat (food dicedCucumber2)))
)

(defrule can-eat-seasonalStudentFarmRoastedVegetableSalad-rule
   (need-canEat (food seasonalStudentFarmRoastedVegetableSalad))

   (canEat (food mixedVegetables))
   (canEat (food pasta))
   =>
   (assert (canEat (food seasonalStudentFarmRoastedVegetableSalad)))
)

(defrule can-eat-redSkinHerbPotatoSalad-rule
   (need-canEat (food redSkinHerbPotatoSalad))

   (dietaryRestriction (applicability no) (restriction dairyFree))

   (canEat (food pasta))

   (canEat (food mixedNuts))
   (canEat (food mushroom))
   =>
   (assert (canEat (food redSkinHerbPotatoSalad)))
)

(defrule can-eat-tandooriChicken-rule
   (need-canEat (food tandooriChicken))

   (canEat (food chicken))
   =>
   (assert (canEat (food tandooriChicken)))
)

(defrule can-eat-lemonCreamShortcake-rule
   (need-canEat (food lemonCreamShortcake))

   (canEat (food cream))

   (canEat (food bread))
   (canEat (food egg))
   (canEat (food mixedNuts))
   =>
   (assert (canEat (food lemonCreamShortcake)))
)

(defrule can-eat-kale-rule
   (need-canEat (food kale))
   =>
   (assert (canEat (food kale)))
)

(defrule can-eat-caesarSalad-rule
   (need-canEat (food caesarSalad))

   (canEat (food lettuce))
   (canEat (food saladDressing))

   (canEat (food anchovies))
   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food caesarSalad)))
)

(defrule can-eat-beefBarbacoa-rule
   (need-canEat (food beefBarbacoa))

   (canEat (food beef))
   =>
   (assert (canEat (food beefBarbacoa)))
)

(defrule can-eat-veganChocolateDonut-rule
   (need-canEat (food veganChocolateDonut))

   (canEat (food chocolate))

   (canEat (food bread))
   =>
   (assert (canEat (food veganChocolateDonut)))
)

(defrule can-eat-deepFriedDicedHashBrowns-rule
   (need-canEat (food deepFriedDicedHashBrowns))

   (canEat (food potato))
   =>
   (assert (canEat (food deepFriedDicedHashBrowns)))
)

(defrule can-eat-mushroomStreetTacos-rule
   (need-canEat (food mushroomStreetTacos))

   (canEat (food flourTortillaPrimitive))
   (canEat (food mushroom))

   (canEat (food mixedNuts))
   =>
   (assert (canEat (food mushroomStreetTacos)))
)

(defrule can-eat-beyondMeat-rule
   (need-canEat (food beyondMeat))
   =>
   (assert (canEat (food beyondMeat)))
)

(defrule can-eat-cod-rule
   (need-canEat (food cod))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food cod)))
)

(defrule can-eat-creamCheeseFrostedCinnamonRolls2-rule
   (need-canEat (food creamCheeseFrostedCinnamonRolls2))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food creamCheeseFrostedCinnamonRolls2)))
)

(defrule can-eat-cukeSalad-rule
   (need-canEat (food cukeSalad))

   (canEat (food mixedVegetables))
   =>
   (assert (canEat (food cukeSalad)))
)

(defrule can-eat-menudo-rule
   (need-canEat (food menudo))

   (canEat (food beef))
   =>
   (assert (canEat (food menudo)))
)

(defrule can-eat-sugarRaisedDonut-rule
   (need-canEat (food sugarRaisedDonut))

   (canEat (food pastry))
   =>
   (assert (canEat (food sugarRaisedDonut)))
)

(defrule can-eat-falafel-rule
   (need-canEat (food falafel))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food falafel)))
)

(defrule can-eat-assortedVeganCookie-rule
   (need-canEat (food assortedVeganCookie))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food assortedVeganCookie)))
)

(defrule can-eat-farmhouseBuffaloChickpeaBurger-rule
   (need-canEat (food farmhouseBuffaloChickpeaBurger))

   (canEat (food beans))
   (canEat (food bread))
   (canEat (food egg))
   =>
   (assert (canEat (food farmhouseBuffaloChickpeaBurger)))
)

(defrule can-eat-frostedBrownies-rule
   (need-canEat (food frostedBrownies))

   (canEat (food brownies))
   =>
   (assert (canEat (food frostedBrownies)))
)

(defrule can-eat-hummus-rule
   (need-canEat (food hummus))
   =>
   (assert (canEat (food hummus)))
)

(defrule can-eat-cinnamonDonutHoles-rule
   (need-canEat (food cinnamonDonutHoles))

   (canEat (food pastry))
   =>
   (assert (canEat (food cinnamonDonutHoles)))
)

(defrule can-eat-cheesePizza-rule
   (need-canEat (food cheesePizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))

   (canEat (food tomato))
   =>
   (assert (canEat (food cheesePizza)))
)

(defrule can-eat-beans-rule
   (need-canEat (food beans))
   =>
   (assert (canEat (food beans)))
)

(defrule can-eat-groundLambWithZhug-rule
   (need-canEat (food groundLambWithZhug))

   (canEat (food lamb))
   =>
   (assert (canEat (food groundLambWithZhug)))
)

(defrule can-eat-pineappleUpsideDownCake-rule
   (need-canEat (food pineappleUpsideDownCake))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food pineappleUpsideDownCake)))
)

(defrule can-eat-veganOatmealRaisinCookie-rule
   (need-canEat (food veganOatmealRaisinCookie))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food veganOatmealRaisinCookie)))
)

(defrule can-eat-whiteBeanDip-rule
   (need-canEat (food whiteBeanDip))

   (canEat (food beans))
   =>
   (assert (canEat (food whiteBeanDip)))
)

(defrule can-eat-marinatedCherryTomatoes2-rule
   (need-canEat (food marinatedCherryTomatoes2))

   (canEat (food tomato))
   =>
   (assert (canEat (food marinatedCherryTomatoes2)))
)

(defrule can-eat-salamiAndMushroomPizza-rule
   (need-canEat (food salamiAndMushroomPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food mushroom))

   (canEat (food pork))
   =>
   (assert (canEat (food salamiAndMushroomPizza)))
)

(defrule can-eat-crazyBread-rule
   (need-canEat (food crazyBread))

   (canEat (food bread))
   (canEat (food ranch))

   (canEat (food cheddarCheese))
   =>
   (assert (canEat (food crazyBread)))
)

(defrule can-eat-sunflowerButterSandwich-rule
   (need-canEat (food sunflowerButterSandwich))

   (dietaryRestriction (applicability no) (restriction glutenFree))

   (canEat (food sunflowerButter))
   (canEat (food toast))
   =>
   (assert (canEat (food sunflowerButterSandwich)))
)

(defrule can-eat-roastedArtichokeHearts-rule
   (need-canEat (food roastedArtichokeHearts))
   =>
   (assert (canEat (food roastedArtichokeHearts)))
)

(defrule can-eat-spicyPorkItalianSausage-rule
   (need-canEat (food spicyPorkItalianSausage))

   (canEat (food pork))
   =>
   (assert (canEat (food spicyPorkItalianSausage)))
)

(defrule can-eat-strawberryShortcake-rule
   (need-canEat (food strawberryShortcake))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   (dietaryRestriction (applicability no) (restriction nutFree))
   =>
   (assert (canEat (food strawberryShortcake)))
)

(defrule can-eat-creamyAdoboSpread-rule
   (need-canEat (food creamyAdoboSpread))
   =>
   (assert (canEat (food creamyAdoboSpread)))
)

(defrule can-eat-cream-rule
   (need-canEat (food cream))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food cream)))
)

(defrule can-eat-mapleDonutVegan-rule
   (need-canEat (food mapleDonutVegan))

   (canEat (food sugar))

   (canEat (food bread))
   =>
   (assert (canEat (food mapleDonutVegan)))
)

(defrule can-eat-tomato-rule
   (need-canEat (food tomato))
   =>
   (assert (canEat (food tomato)))
)

(defrule can-eat-rasperrySwirlCheeseCakeBars-rule
   (need-canEat (food rasperrySwirlCheeseCakeBars))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food rasperrySwirlCheeseCakeBars)))
)

(defrule can-eat-peruvianChickenQuinoaAndCorianderSoup-rule
   (need-canEat (food peruvianChickenQuinoaAndCorianderSoup))

   (canEat (food chicken))
   =>
   (assert (canEat (food peruvianChickenQuinoaAndCorianderSoup)))
)

(defrule can-eat-arrozCaldo-rule
   (need-canEat (food arrozCaldo))

   (canEat (food chicken))
   (canEat (food rice))

   (canEat (food anchovies))
   =>
   (assert (canEat (food arrozCaldo)))
)

(defrule can-eat-mushroomToast-rule
   (need-canEat (food mushroomToast))

   (canEat (food bread))
   (canEat (food egg))
   (canEat (food mushroom))

   (canEat (food goatCheese))
   =>
   (assert (canEat (food mushroomToast)))
)

(defrule can-eat-sausageAndOnionPizza-rule
   (need-canEat (food sausageAndOnionPizza))

   (canEat (food bread))
   (canEat (food cheddarCheese))
   (canEat (food pork))
   =>
   (assert (canEat (food sausageAndOnionPizza)))
)

(defrule can-eat-shrimp-rule
   (need-canEat (food shrimp))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food shrimp)))
)

(defrule can-eat-glazedDonutHoles-rule
   (need-canEat (food glazedDonutHoles))

   (canEat (food pastry))
   =>
   (assert (canEat (food glazedDonutHoles)))
)

(defrule can-eat-shoestringFries-rule
   (need-canEat (food shoestringFries))

   (canEat (food potatoFries))
   =>
   (assert (canEat (food shoestringFries)))
)

(defrule can-eat-anchovies-rule
   (need-canEat (food anchovies))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food anchovies)))
)

(defrule can-eat-banana-rule
   (need-canEat (food banana))
   =>
   (assert (canEat (food banana)))
)

(defrule can-eat-californiaPastaSalad-rule
   (need-canEat (food californiaPastaSalad))

   (canEat (food pasta))

   (canEat (food mayo))
   =>
   (assert (canEat (food californiaPastaSalad)))
)

(defrule can-eat-oil-rule
   (need-canEat (food oil))
   =>
   (assert (canEat (food oil)))
)

(defrule can-eat-pestoPasta-rule
   (need-canEat (food pestoPasta))

   (canEat (food cream))
   (canEat (food mixedNuts))
   (canEat (food mushroom))
   (canEat (food pasta))
   =>
   (assert (canEat (food pestoPasta)))
)

(defrule can-eat-houseTomatoBasilVinaigrette-rule
   (need-canEat (food houseTomatoBasilVinaigrette))

   (canEat (food saladDressing))
   =>
   (assert (canEat (food houseTomatoBasilVinaigrette)))
)

(defrule can-eat-chickenTagine-rule
   (need-canEat (food chickenTagine))

   (canEat (food chicken))
   =>
   (assert (canEat (food chickenTagine)))
)

(defrule can-eat-minestroneSoupWithPasta-rule
   (need-canEat (food minestroneSoupWithPasta))

   (canEat (food beans))
   (canEat (food pasta))
   =>
   (assert (canEat (food minestroneSoupWithPasta)))
)

(defrule can-eat-paprikaSweetPotatoes-rule
   (need-canEat (food paprikaSweetPotatoes))

   (canEat (food potato))
   =>
   (assert (canEat (food paprikaSweetPotatoes)))
)

(defrule can-eat-blackBeanBurger-rule
   (need-canEat (food blackBeanBurger))

   (canEat (food beans))
   (canEat (food bread))
   =>
   (assert (canEat (food blackBeanBurger)))
)

(defrule can-eat-yogurt-rule
   (need-canEat (food yogurt))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food yogurt)))
)

(defrule can-eat-lemonRoastedCarrots-rule
   (need-canEat (food lemonRoastedCarrots))
   =>
   (assert (canEat (food lemonRoastedCarrots)))
)

(defrule can-eat-shrimpTaco-rule
   (need-canEat (food shrimpTaco))

   (canEat (food cornTortilla))
   (canEat (food shrimp))

   (canEat (food egg))
   (canEat (food milk))
   (canEat (food rice))
   =>
   (assert (canEat (food shrimpTaco)))
)

(defrule can-eat-lamb-rule
   (need-canEat (food lamb))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food lamb)))
)

(defrule can-eat-miniEverythingBagel-rule
   (need-canEat (food miniEverythingBagel))

   (canEat (food bagel))
   =>
   (assert (canEat (food miniEverythingBagel)))
)

(defrule can-eat-moroccanRoastedVegetableSoup-rule
   (need-canEat (food moroccanRoastedVegetableSoup))
   =>
   (assert (canEat (food moroccanRoastedVegetableSoup)))
)

(defrule can-eat-fetaCheese-rule
   (need-canEat (food fetaCheese))

   (canEat (food milk))
   =>
   (assert (canEat (food fetaCheese)))
)

(defrule can-eat-herbRoastedRedPotatoes-rule
   (need-canEat (food herbRoastedRedPotatoes))

   (canEat (food potato))
   =>
   (assert (canEat (food herbRoastedRedPotatoes)))
)

(defrule can-eat-sauteedKale-rule
   (need-canEat (food sauteedKale))

   (canEat (food kale))
   =>
   (assert (canEat (food sauteedKale)))
)

(defrule can-eat-oats-rule
   (need-canEat (food oats))
   =>
   (assert (canEat (food oats)))
)

(defrule can-eat-saladDressing-rule
   (need-canEat (food saladDressing))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food saladDressing)))
)

(defrule can-eat-cornTortilla-rule
   (need-canEat (food cornTortilla))
   =>
   (assert (canEat (food cornTortilla)))
)

(defrule can-eat-cheeseOmelet-rule
   (need-canEat (food cheeseOmelet))

   (canEat (food cheddarCheese))
   (canEat (food egg))
   =>
   (assert (canEat (food cheeseOmelet)))
)

(defrule can-eat-blackBeanDipSide-rule
   (need-canEat (food blackBeanDipSide))

   (canEat (food beans))
   =>
   (assert (canEat (food blackBeanDipSide)))
)

(defrule can-eat-lentilCake-rule
   (need-canEat (food lentilCake))
   =>
   (assert (canEat (food lentilCake)))
)

(defrule can-eat-taterTots-rule
   (need-canEat (food taterTots))

   (canEat (food potato))
   =>
   (assert (canEat (food taterTots)))
)

(defrule can-eat-sugar-rule
   (need-canEat (food sugar))
   =>
   (assert (canEat (food sugar)))
)

(defrule can-eat-appleCinnamonMuffin-rule
   (need-canEat (food appleCinnamonMuffin))

   (canEat (food sugar))

   (canEat (food bread))
   (canEat (food egg))
   =>
   (assert (canEat (food appleCinnamonMuffin)))
)

(defrule can-eat-fortifiedSoyMilkDrink-rule
   (need-canEat (food fortifiedSoyMilkDrink))
   =>
   (assert (canEat (food fortifiedSoyMilkDrink)))
)

(defrule can-eat-egg-rule
   (need-canEat (food egg))

   (dietaryRestriction (applicability no) (restriction vegan))
   =>
   (assert (canEat (food egg)))
)

(defrule can-eat-riceNoodlesPrimitive-rule
   (need-canEat (food riceNoodlesPrimitive))
   =>
   (assert (canEat (food riceNoodlesPrimitive)))
)

(defrule can-eat-pastry-rule
   (need-canEat (food pastry))

   (canEat (food sugar))

   (canEat (food bread))
   (canEat (food egg))
   (canEat (food milk))
   =>
   (assert (canEat (food pastry)))
)

(defrule can-eat-houseRanchDressing-rule
   (need-canEat (food houseRanchDressing))

   (canEat (food ranch))
   =>
   (assert (canEat (food houseRanchDressing)))
)

(defrule can-eat-roastedTurkey-rule
   (need-canEat (food roastedTurkey))

   (dietaryRestriction (applicability no) (restriction vegetarian))
   =>
   (assert (canEat (food roastedTurkey)))
)

(defrule can-eat-mayo-rule
   (need-canEat (food mayo))

   (dietaryRestriction (applicability no) (restriction vegan))
   =>
   (assert (canEat (food mayo)))
)

(defrule can-eat-tofuChorizoHotDog-rule
   (need-canEat (food tofuChorizoHotDog))

   (canEat (food bread))
   (canEat (food tofu))
   =>
   (assert (canEat (food tofuChorizoHotDog)))
)

(defrule can-eat-turmericAndRaisinRice-rule
   (need-canEat (food turmericAndRaisinRice))

   (canEat (food rice))
   =>
   (assert (canEat (food turmericAndRaisinRice)))
)

(defrule can-eat-veganLemonDropCookie-rule
   (need-canEat (food veganLemonDropCookie))

   (dietaryRestriction (applicability no) (restriction glutenFree))
   =>
   (assert (canEat (food veganLemonDropCookie)))
)

(defrule can-eat-mmBrownies-rule
   (need-canEat (food mmBrownies))

   (canEat (food brownies))
   =>
   (assert (canEat (food mmBrownies)))
)

(defrule can-eat-blackBeanSoup-rule
   (need-canEat (food blackBeanSoup))

   (canEat (food beans))
   (canEat (food potato))
   =>
   (assert (canEat (food blackBeanSoup)))
)

(defrule can-eat-glutenfreeSunflowerButterSandwich-rule
   (need-canEat (food glutenfreeSunflowerButterSandwich))

   (canEat (food glutenfreeToast))
   (canEat (food sunflowerButter))
   =>
   (assert (canEat (food glutenfreeSunflowerButterSandwich)))
)

(defrule can-eat-sourCream-rule
   (need-canEat (food sourCream))

   (dietaryRestriction (applicability no) (restriction dairyFree))
   =>
   (assert (canEat (food sourCream)))
)

(defrule can-eat-curryChips-rule
   (need-canEat (food curryChips))

   (canEat (food potato))

   (canEat (food oil))
   =>
   (assert (canEat (food curryChips)))
)

(defrule can-eat-pumpkinBread-rule
   (need-canEat (food pumpkinBread))

   (canEat (food bread))
   (canEat (food sugar))

   (canEat (food milk))
   =>
   (assert (canEat (food pumpkinBread)))
)

(defrule can-eat-bananaWalnutBread-rule
   (need-canEat (food bananaWalnutBread))

   (canEat (food bread))

   (canEat (food egg))
   (canEat (food mixedNuts))
   =>
   (assert (canEat (food bananaWalnutBread)))
)

