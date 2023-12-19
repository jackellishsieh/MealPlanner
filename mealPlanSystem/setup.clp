/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Clears the slate for JESS and batches in all needed files in the right order
*
* High-level description of the expert system as a whole: 
*  This Meal Plan expert system assemble complete meals (each of which represent all 5 needed food groups) based on a UC cafeteria menu.
*  Each meal, on a specific day and at a certain time, requires foods that collectively represent all five food groups to be assembled 
*  To fulfill these facts, the system stores a list of rules that note when a food is available, which food groups it represents,
*  and what dietary restrictions it violates.
*  By adding foods that meet food group requirements and asking the user for needed information about availability and dietary restrictions,
*  foods are added to each meal. The system thusly assembles a complete meal plan for the day.
*
* The expert's advice constituted...
*     1. The most important part of assembling a meal: making sure fats, protein, grains, dairy, and produce are represented
*     2. The most common dietary restrictions among the eating disorder population and common substitutes
*     3. Guidelines for determing which foods fall under which food group (such as distinguishing when a food has enough carbohydrates, for example, to be considered a food group)
* This file is the master file for batching in all other files needed to run the expert system
* Note that the system may not function consistently if (reset) is used.
*/

(clear)
(reset)

(batch mealPlanSystem/userInterface.clp)        ; Functions, rules, and utilities that run the user interface. No facts involved here.
(batch mealPlanSystem/inquiryRules.clp)         ; Rules that request information from the user. Establishes backward-chaining for day of week, dietary restrictions
(batch mealPlanSystem/canEatRules.clp)          ; Rules that determine whether a food can be eaten. Establishes backward-chaining for a food's consumability
(batch mealPlanSystem/mealAssembly.clp)         ; Rules that assemble meals and requests needed food groups. Establishes backward-chaining for food group needs.
(batch mealPlanSystem/addFoodRules.clp)         ; Rules that determine whether to add a food based on needed food groups.

; (system clear)(batch mealPlanSystem/setup.clp)(run)