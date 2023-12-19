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