/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Rules that ask the user for information
*
* This file consists of rules that ask the user for needed information about the day of the week and dietary restrictions
*
* Due to backward-chaining, this file must be batched in before addFoodRules.clp
*/

/*
* Backward-chaining templates for dietary restrictions and the day of the week
*/

(deftemplate dietaryRestriction (slot restriction) (slot applicability))   ; both which type of restriction and whether it applies to the user or not
(deftemplate chosenDayOfWeek (slot dayOfWeek))

(do-backward-chaining dietaryRestriction)
(do-backward-chaining chosenDayOfWeek)

/*
* Asks the user for the day of the week if the day of the week needs to be known.
*/ 
(defrule chosenDayOfWeekInquiryRule "Asks the user for the day of the week"
   (need-chosenDayOfWeek)
   =>
   (assert (chosenDayOfWeek (dayOfWeek (askDayOfWeekQuestion))))
) ; defrule chosenDayOfWeekInquiryRule

/*
* Asks the user whether a certain dietary restriction applies to the user if the applicability of the restriction needs to be known.
* Uses a custom prompt for each restriction
*/
(defrule dietaryRestrictionInquiryRule "Asks the user about whether the given dietary restriction applies"
   (need-dietaryRestriction (restriction ?restriction & ~nil))
   =>
   (printout t )        ; for spacing
   (assert (dietaryRestriction (restriction ?restriction) (applicability (askYesNoIdkQuestion (getDietaryRestrictionPrompt ?restriction)))))
) ; defrule dietaryRestrictionInquiryRule


/*
* If the user observes a vegan diet, then assert that the user observes a vegetarian and dairy-free diet
* If VEGAN -> VEGETARIAN and DAIRY FREE
*/
(defrule positive-vegan-rule "Asserts vegetarian diet and dairy-free diet if the user observes a vegan diet"   
   (or (need-dietaryRestriction (restriction vegetarian))
       (need-dietaryRestriction (restriction dairyFree))
   )

   (dietaryRestriction (applicability yes) (restriction vegan))
   =>
   ; (printout t crlf "I'M VEGAN!!!!" crlf crlf)
   (assert (dietaryRestriction (applicability yes) (restriction vegetarian)))
   (assert (dietaryRestriction (applicability yes) (restriction dairyFree)))
) ; defrule positive-vegan-rule

/*
* If the user DOES NOT observe a vegetarian diet or a dairy-free diet, then assert that the user does not observe a vegan diet.
* Note that this rule is the logical contrapositive of the above rule:
* If NOT(VEGETARIAN AND DAIRY FREE) -> NOT(VEGAN)
*/
(defrule negative-vegan-rule "Asserts not a vegan diet if the user is not vegetarian or is not dairy free"
   (need-dietaryRestriction (restriction vegan))

   (or (dietaryRestriction (applicability no) (restriction vegetarian))
       (dietaryRestriction (applicability no) (restriction dairyFree))
   )
   =>
   ; (printout t crlf "I'M NOT VEGAN!!!!" crlf crlf)
   (assert (dietaryRestriction (applicability no) (restriction vegan)))
) ; defrule negative-vegan-rule


/*
* Returns a prompt asking the user about each dietary restriction
* 
* Preconditions: ?restriction is one of the following five symbols:
*  vegetarian
*  vegan
*  glutenFree
*  nutFree
*  dairyFree
*/
(deffunction getDietaryRestrictionPrompt (?restriction)
   (if (eq ?restriction vegetarian) then                    ; Since each condition is mutually exclusive , else statements are omitted for readability
      (bind ?prompt "Do you observe a vegetarian (or vegan) diet?")   
   )
   (if (eq ?restriction vegan) then
      (bind ?prompt "Do you observe a vegan diet?")
   )
   (if (eq ?restriction glutenFree) then
      (bind ?prompt "Are you allergic to gluten?")
   )
   (if (eq ?restriction nutFree) then
      (bind ?prompt "Are you allergic to most nuts?")
   )
   (if (eq ?restriction dairyFree) then
      (bind ?prompt "Are you unable to eat dairy?")
   )
   
   (return ?prompt)
) ; deffunction getDietaryRestrictionPrompt (?restriction)