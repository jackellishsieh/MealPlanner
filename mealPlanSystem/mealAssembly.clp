/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Assembles the five-food-group meals.
*
* This file is meant to drive the rest of the system by demanding the need to assemble meals
* This makes the requests to satisfy food groups on certain days, adds foods to meals, and prints meals
*/

/*
* Template for food group needs at a certain day and meal time, for a certain food group, and to be fulfilled by a certain food
* Note that foodName should be the food name as a printable string rather than an abbreviation or symbol name
* Does backward-chaining
*/
(deftemplate foodGroupNeed (slot dayOfWeek) (slot mealTime) (slot foodGroup) (slot foodName))

(do-backward-chaining foodGroupNeed)

/*
*
* Stores the list of meals represented as strings
* Uses in assembleMeal and printAllMeals
*/
(defglobal ?*breakfastMeals*  = (create$))
(defglobal ?*lunchMeals*      = (create$))
(defglobal ?*dinnerMeals*     = (create$))

; /*
; * BOGO
; */
; (defrule printFoodGroup "Prints when a food group need is met"
;    (declare (salience 10))
;    (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime ?mealTime) (foodName ?foodName) (foodGroup ?foodGroup))
;    =>
;    (printout t "   " (upcase ?foodName) " served as a source of " (upcase ?foodGroup) " for " (upcase ?mealTime) crlf)
; )


/*
* Drives the food needs for breakfast, making sure that each of the five food groups are satisfied.
* When finished, assembles a breakfast meal and retracts all breakfast foods to form more recommendations.
*/
(defrule breakfastRule "Assembles a complete breakfast"
   (chosenDayOfWeek (dayOfWeek ?dayOfWeek))
   ?grainFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime breakfast) (foodName ?grainFoodName)   (foodGroup grain))
   ?proteinFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime breakfast) (foodName ?proteinFoodName) (foodGroup protein))
   ?produceFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime breakfast) (foodName ?produceFoodName) (foodGroup produce))
   ?dairyFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime breakfast) (foodName ?dairyFoodName)   (foodGroup dairy))
   ?fatFact       <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime breakfast) (foodName ?fatFoodName)     (foodGroup fat))
   =>
   (assembleMeal breakfast ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)
   (retractFoodGroupNeeds ?grainFact ?proteinFact ?produceFact ?dairyFact ?fatFact)
) ; defrule breakfastRule

/*
* Drives the food needs for lunch, making sure that each food group is met.
* When finished, assembles a lunch meal and retracts all lunch foods to form more recommendations
*/
(defrule lunchRule "Assembles a complete lunch"
   (chosenDayOfWeek (dayOfWeek ?dayOfWeek))
   ?grainFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime lunch) (foodName ?grainFoodName)   (foodGroup grain))
   ?proteinFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime lunch) (foodName ?proteinFoodName) (foodGroup protein))
   ?produceFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime lunch) (foodName ?produceFoodName) (foodGroup produce))
   ?dairyFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime lunch) (foodName ?dairyFoodName)   (foodGroup dairy))
   ?fatFact       <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime lunch) (foodName ?fatFoodName)     (foodGroup fat))
   =>
   (assembleMeal lunch ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)
   (retractFoodGroupNeeds ?grainFact ?proteinFact ?produceFact ?dairyFact ?fatFact)
) ; defrule lunchRule

/*
* Drives the food needs for dinner, making sure that each food group is met.
* When finished, assembles a dinner meal and retracts all dinner foods to form more recommendations
*/
(defrule dinnerRule "Assembles a complete dinner"
   (chosenDayOfWeek (dayOfWeek ?dayOfWeek))
   ?grainFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime dinner) (foodName ?grainFoodName)   (foodGroup grain))
   ?proteinFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime dinner) (foodName ?proteinFoodName) (foodGroup protein))
   ?produceFact   <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime dinner) (foodName ?produceFoodName) (foodGroup produce))
   ?dairyFact     <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime dinner) (foodName ?dairyFoodName)   (foodGroup dairy))
   ?fatFact       <- (foodGroupNeed (dayOfWeek ?dayOfWeek) (mealTime dinner) (foodName ?fatFoodName)     (foodGroup fat))
   =>
   (assembleMeal dinner ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)
   (retractFoodGroupNeeds ?grainFact ?proteinFact ?produceFact ?dairyFact ?fatFact)
) ; defrule dinnerRule

/*
* Assembles a meal at the given time given all the composite foods
* Preconditions: ?mealTime is one of the following three symbols: breakfast, lunch, or dinner
*                The remaining arguments must be strings of food names 
* Postconditions: Combines the given foods into a comma-separated string that is added to he list of the identified meal. 
*                 Note that foods that satisfy multiple food groups are only used once
*/
(deffunction assembleMeal (?mealTime ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)
   (bind ?FOOD_DELIMITER ", ")

   /*
   * Assemble the meal as a comma-separated string of converted non-duplicate foods
   */
   (bind ?mealSet (union$ (create$ ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)))
   (bind ?meal (listToString ?mealSet ?FOOD_DELIMITER))

   ; BOGO
   ; (printout t crlf "   FINISHED " (upcase ?mealTime) ": " ?meal crlf crlf)

   /*
   * Add the meal to the (end) of the appropriate global meal list
   */
   (if (eq ?mealTime breakfast) then
      (bind ?*breakfastMeals* (insert$ ?*breakfastMeals* (+ (length$ ?*breakfastMeals*) 1) ?meal))
    else
      (if (eq ?mealTime lunch) then
         (bind ?*lunchMeals* (insert$ ?*lunchMeals* (+ (length$ ?*lunchMeals*) 1) ?meal))
       else
         (if (eq ?mealTime dinner) then
            (bind ?*dinnerMeals* (insert$ ?*dinnerMeals* (+ (length$ ?*dinnerMeals*) 1) ?meal))
         ) ; if (eq ?mealTime dinner) then
      ) ; if (eq ?mealTime lunch) then
   ) ; if (eq ?mealTime breakfast) then

   (return)
) ; deffunction assembleMeal (?mealTime ?grainFoodName ?proteinFoodName ?produceFoodName ?dairyFoodName ?fatFoodName)

/*
* Prints all assembled meals in sequence.
* Postconditions: All assembled meals are printed to the console in the order of breakfast, lunch, and dinner.
*/
(deffunction printAllMeals ()
   (bind ?MEAL_DELIMITER "- ")   ; Delimiter

   /*
   * Print breakfast meals
   */
   (printout t "Breakfast suggestions" crlf)
   (foreach ?breakfastMeal ?*breakfastMeals* 
      (printout t ?MEAL_DELIMITER ?breakfastMeal crlf)
   )
   
   /*
   * Print lunch meals
   */
   (printout t crlf "Lunch suggestions" crlf)
   (foreach ?lunchMeal ?*lunchMeals* 
      (printout t ?MEAL_DELIMITER ?lunchMeal crlf)
   )
   /*
   * Print dinner meals
   */
   (printout t crlf "Dinner suggestions" crlf)
   (foreach ?dinnerMeal ?*dinnerMeals* 
      (printout t ?MEAL_DELIMITER ?dinnerMeal crlf)
   )

   (return)
) ; deffunction printAllMeals ()

/*
* Retracts provided facts. Used to form multiple recommendations for each meal.
* Preconditions: All arguments are facts fulfilling a food group need.
* Postconditions: The argument facts are retracted.
*/
(deffunction retractFoodGroupNeeds (?grainFact ?proteinFact ?produceFact ?dairyFact ?fatFact)   
   (retract ?grainFact)
   (retract ?proteinFact)
   (retract ?produceFact)
   (retract ?dairyFact)
   (retract ?fatFact)

   (return)
) ; deffunction retractFoodGroupNeeds (?grainFact ?proteinFact ?produceFact ?dairyFact ?fatFact)   

/*
* Adds the indicated food to the given meal for each of the food groups that the food represents
* Postconditions: The facts (foodGroupneed (dayOfWeek ?dayOfWeek) (mealTime ?mealTime) (foodGroup [Food Group i])) (fodName ?foodName)
* for all Food Groups represented by the food
*/
(deffunction addFood (?dayOfWeek ?mealTime ?foodName ?foodGroupList)
   (bind ?factStringStart (str-cat "(foodGroupNeed (dayOfWeek " ?dayOfWeek ") (mealTime " ?mealTime ")"))   ; Asserts food to meet each requirement
   
   /*
   * Asserts each represented food group as met
   */
   (for (bind ?i 1) (<= ?i (length$ ?foodGroupList)) (++ ?i)
      (bind ?factString ?factStringStart)
      (bind ?factString (str-cat ?factString " (foodGroup " (nth$ ?i ?foodGroupList) ")"))
      (bind ?factString (str-cat ?factString " (foodName \"" ?foodName "\")"))
      (bind ?factString (str-cat ?factString ")"))
      (assert-string ?factString )
   ) ; for (bind ?i 1) (<= ?i (length$ ?foodGroupList)) (++ ?i)

   (return)
) ; deffunction addFood (?dayOfWeek ?mealTime ?foodName ?foodGroupList)