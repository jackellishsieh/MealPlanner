/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Rules that determine which foods should be added to meals.
*
* This file consists entirely of rules that 
* These are the core rules of the system.
* Selected foods are then added to the running, and meal group needs are updated accordingly.
*/

/*
* Template for denoting which foods have already been chosen for an alternative recommendation for the same meal.
* Note that no backward-chaining must be done, since the system only needs to know that this fact hasn't been obligatorily asserted
*/
(deftemplate alreadyAte (slot food) (slot mealTime))

/*
* ================================================================================
* ADD FOOD RULES
* Each rule in this section determines whether a food should be added.
*
* In order for a food to be added to a meal, four conditions must be met:
*     1. The food satisfies at least one of the needed food group for the current meal
*     2. The food is offered at the current meal time and day
*     3. The food is consumable by the user.
*     4. The food has not already been included in an alternative recommendation for the same meal.
*
* These four conditions are represented in order by the left-hand sides of each rule.
* Once all conditions are satisfied, the food is added to the current meal using its unabbreviated name,
* and the food is recorded to have been already chosen for the current meal so it is not chosen for the same meal again.
* 
* Note that the same food may be offered on different days at different meal times, so it does not suffice to capture the day and meal time separately.
* 
* Each rule takes the form 
*     (defrule add-food-[Food Name]-rule
*        (need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & [Food Group 1]|[Food Group 2]...))
*
*        (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & [Day 1]) (mealTime ?mealTime & [Meal Time 1.1][Meal Time 1.2]...))
*        (need-foodGroupNeed (foodGroup ?foodGroup) (dayOfWeek ?dayOfWeek & [Day 2]) (mealTime ?mealTime & [Meal Time 2.1][Meal Time 2.2]...))
*        ...
* 
*        (canEat (food [Food Name]))
*
*        (not (alreadyAte (mealTime ?mealTime) (food [Food Name])))
*        ...
*        =>
*        (addFood ?dayOfWeek ?mealTime [Food Name String](create$ [Food Group 1] [Food Group 2]...))
*        (assert (alreadyAte (mealTime ?mealTime) (food [Food Name])))
*     )
*
* As such, each rule is relatively similar, predictable, and self-explanatory, so repetitive documentation has been omitted. 
* ================================================================================
*/