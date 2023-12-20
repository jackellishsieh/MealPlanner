import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.poi.ss.usermodel.Cell;

/*
 * Food class
 * Includes a boolean about whether this food is served or not
 */
public abstract class Food implements Comparable<Food> {

   protected static String TAB = "   ";

   /*
    * INDEPENDENT OF SERVABILITY
    */
   private String printableName; // Printable name for the food matching the menu

   /*
    * Returns a collection of which dietary restrictions this Food violates
    */
   public abstract EnumSet<DietaryRestrictionViolation> getDietaryRestrictionViolations();

   /*
    * Sets printable name
    */
   public void setPrintableName(String newPrintableName) {
      this.printableName = newPrintableName;
   }

   /*
    * Returns printable name
    */
   public String getPrintableName() {
      return this.printableName;
   }

   /*
    * Return printable name in camelcase, first character lowercase
    */
   public String getInternalName() {
      return Food.toCamelCase(this.printableName, ' ');
   }

//   /*
//    * Return printable name in camelcase, first character capitalized
//    */
//   public String getInternalNameFirstUpper() {
//      return Food.toCamelCaseFirstUpper(this.printableName, ' ');
//   }

   /*
    * From Bael Dung: converts a string to camelcase Modified so that
    * non-alphanumeric characters are deleted
    */
   private static String toCamelCase(String text, char delimiter) {
      boolean shouldConvertNextCharToLower = true;
      StringBuilder builder = new StringBuilder();

      for (int i = 0; i < text.length(); i++) {
         char currentChar = text.charAt(i);

         if (currentChar == delimiter) {
            shouldConvertNextCharToLower = false;
         }

         else if (Character.isLetterOrDigit(currentChar)) // my addition
         {
            if (shouldConvertNextCharToLower) {
               builder.append(Character.toLowerCase(currentChar));
            } else {
               builder.append(Character.toUpperCase(currentChar));
               shouldConvertNextCharToLower = true;
            } // else
         } // else if
      } // for

      return builder.toString();
   } // toCamelCase

   /*
    * From Bael Dung: converts a string to camelcase. Modified so that
    * non-alphanumeric characters are deleted AND first letter is capitalized.
    */
   private static String toCamelCaseFirstUpper(String text, char delimiter) {
      boolean shouldConvertNextCharToLower = false;
      StringBuilder builder = new StringBuilder();

      for (int i = 0; i < text.length(); i++) {
         char currentChar = text.charAt(i);

         if (currentChar == delimiter) {
            shouldConvertNextCharToLower = false;
         }

         else if (Character.isLetterOrDigit(currentChar)) // my addition
         {
            if (shouldConvertNextCharToLower) {
               builder.append(Character.toLowerCase(currentChar));
            } else {
               builder.append(Character.toUpperCase(currentChar));
               shouldConvertNextCharToLower = true;
            } // else
         } // else if
      } // for

      return builder.toString();
   } // toCamelCaseFirstUpper

   /*
    * Returns represented food groups
    */
   public abstract EnumSet<FoodGroup> getFoodGroups();

   /*
    * =============================================================================
    * DEPENDENT ON SERVABILITY
    * =============================================================================
    */
   protected boolean isServed; // About whether the food is served. Protected so can be set by lower classes

   private Map<DayOfWeek, SortedSet<MealTime>> availabilities; // Keeps track of which days of week and which meal
   // times the food is available

   public Map<DayOfWeek, SortedSet<MealTime>> getAvailabilities() {
      if (!isServed) {
         throw new RuntimeException(
               "Shouldn't be getting availabities for " + this.getPrintableName() + ", which is not served!");
      }

      return this.availabilities;
   }

   public void setAvailabilities(Map<DayOfWeek, SortedSet<MealTime>> newAvailabilities) {
      if (!isServed) {
         throw new RuntimeException(
               "Shouldn't be getting availabities for " + this.getPrintableName() + ", which is not served!");
      }

      this.availabilities = newAvailabilities;
   }

   /*
    * Get whether served
    */
   public boolean isServed() {
      return this.isServed;
   }

   /*
    * Reads in the availabilities for a served food IF the food is served alone
    * Preconditions: row iterator's next value is "served alone?"
    */
   public void readAvailabilities(Iterator<Cell> rowIterator) {
      // Set isServed to next
      this.isServed = rowIterator.next().getBooleanCellValue();

      // Only execute if the food is served
      if (this.isServed) {
         this.availabilities = Food.availabilitiesStringToMap(rowIterator.next().getStringCellValue());
      }

   }

   /*
    * Returns a map of availabilities (by meal and time) from a string
    */
   private static Map<DayOfWeek, SortedSet<MealTime>> availabilitiesStringToMap(String availabilitiesString) {
      // System.out.println("\navailabilitiesString = " + availabilitiesString);

      Map<DayOfWeek, SortedSet<MealTime>> availabilitiesMap = new EnumMap<DayOfWeek, SortedSet<MealTime>>(
            DayOfWeek.class);

      // Split availabilities string by newlines
      String[] availabilityItems = availabilitiesString.split("\n");

      // Intermediaries
      String[] availabilityItemList;
      DayOfWeek dayOfWeek;
      MealTime mealTime;

      // For each item,
      for (String availabilityItem : availabilityItems) {
         // Separate into 3 parts: Day, " - ", and meal time
         availabilityItemList = availabilityItem.split(" - ");

         // Get the day of the week (first string)
         dayOfWeek = DayOfWeek.valueOf(availabilityItemList[0].toUpperCase());
         // Get the meal (second string)
         mealTime = MealTime.valueOf(availabilityItemList[1].toUpperCase());

         // Add the day of week and collection if not there yet
         if (!availabilitiesMap.containsKey(dayOfWeek)) {
            availabilitiesMap.put(dayOfWeek, new TreeSet<MealTime>());
         }

         // Add the meal time to that day of week in the collection
         availabilitiesMap.get(dayOfWeek).add(mealTime);
      } // for each

      return availabilitiesMap;
   } // public availabilitiesStringToMap

   /*
    * Writes the CAN phase rule (whether this food can be consumed due to DRVs and,
    * if served, the day of the week)
    */
   public String getCanEatRule() {
      String canEatRule = "(defrule can-eat-";

      // Create the name by capitalizing the internal name
      canEatRule += this.getInternalName();

      canEatRule += "-rule\n";

      // Concatenate LHS
      canEatRule += this.getCanEatRuleLHS();

      // Add RHS
      canEatRule += "   =>\n";

      // canEatRule += TAB + "(printout t \"" + TAB + TAB + "Can eat " +
      // this.getPrintableName() + ".\" crlf)\n";
      canEatRule += TAB + "(assert (canEat (food " + this.getInternalName() + ")))\n";
      canEatRule += ")";

      return canEatRule;
   }

   /*
    * Writes the CAN phase rule (whether this food can be consumed due to DRVs and,
    * if served, the day of the week)
    */
   private String getCanEatRuleLHS() {
      String canEatRuleLHS = "";

//      // If the food is served, start with days of the week
//      if (this.isServed()) {
//         // Accumulate the space separated list of days
//         String dayOfWeekPatterns = "";
//
//         // Get the days of week
//         Set<DayOfWeek> daysOfWeek = this.getAvailabilities().keySet();
//
//         // Concatenate days of week (lowercased, full name of day) with spaces
//         for (DayOfWeek dayOfWeek : daysOfWeek) {
//            dayOfWeekPatterns += " (dayOfWeek " + dayOfWeek.toString().toLowerCase() + ")";
//         }
//         dayOfWeekPatterns = dayOfWeekPatterns.substring(1);
//
//         // Add an enclosing (or ...) IF there is more than one day of the week
//         if (daysOfWeek.size() > 1) {
//            dayOfWeekPatterns = "(or " + dayOfWeekPatterns + ")";
//         }
//
//         // Add to string builder
//         canEatRuleLHS += "   " + dayOfWeekPatterns + "\n";
//      }

      // Add need
      canEatRuleLHS += TAB + "(need-canEat (food " + this.getInternalName() + "))\n";

      // Add the DRV facts
      canEatRuleLHS += this.getDRVString();

      // Add the other ingredients
      canEatRuleLHS += this.getIngredientsString();

      return canEatRuleLHS;
   }

   public abstract String getIngredientsString();

   /*
    * Eliminates redundant food groups (so that forward-chaining can be a thing) If
    * NOT_DAIRY_FREE is present, NOT_VEGAN is removed. If NOT_VEGETARIAN is
    * present, NOT_VEGAN is removed
    */
   private static void removeRedundantDietearyRestrictionViolations(
         EnumSet<DietaryRestrictionViolation> dietaryRestrictionViolations) {

      // If NOT_DAIRY_FREE is present, remove NOT_VEGAN
      if (dietaryRestrictionViolations.contains(DietaryRestrictionViolation.NOT_DAIRY_FREE)) {
         dietaryRestrictionViolations.remove(DietaryRestrictionViolation.NOT_VEGAN);
      }

      // If NOT_VEGETARIAN is present, remove NOT_VEGAN
      if (dietaryRestrictionViolations.contains(DietaryRestrictionViolation.NOT_VEGETARIAN)) {
         dietaryRestrictionViolations.remove(DietaryRestrictionViolation.NOT_VEGAN);
      }
   }

   /*
    * Add additional DRVs and ingredient Foods as indented fact strings
    */
   public String getDRVString() {
      String DRVfacts = "";

      // Add the additional DRVs
      EnumSet<DietaryRestrictionViolation> additionalDietaryRestrictionViolations;

      // VERY BAD CODING BUT WHATEVER
      if (this instanceof PrimitiveFood) {
         additionalDietaryRestrictionViolations = ((PrimitiveFood) this).getDietaryRestrictionViolations();
      } else {
         additionalDietaryRestrictionViolations = ((CompositeFood) this).getAdditionalDietaryRestrictionViolations();
      }

      // Filter out redundant DRVs
      Food.removeRedundantDietearyRestrictionViolations(additionalDietaryRestrictionViolations);

      boolean hasADRVs = false;
      for (DietaryRestrictionViolation additionalDietaryRestrictionViolation : additionalDietaryRestrictionViolations) {
         if (!hasADRVs) {
            DRVfacts += "\n";
            hasADRVs = true;
         }

         DRVfacts += TAB + "(dietaryRestriction (applicability no) (restriction ";

         switch (additionalDietaryRestrictionViolation) {
         case NOT_GLUTEN_FREE:
            DRVfacts += "glutenFree";
            break;
         case NOT_VEGAN:
            DRVfacts += "vegan";
            break;
         case NOT_VEGETARIAN:
            DRVfacts += "vegetarian";
            break;
         case NOT_DAIRY_FREE:
            DRVfacts += "dairyFree";
            break;
         case NOT_NUT_FREE:
            DRVfacts += "nutFree";
            break;
         }

         DRVfacts += "))\n";
      }

      return DRVfacts;
   }

   public String getAddFoodRule() {

      // Check that is servable
      if (!this.isServed()) {
         throw new RuntimeException("Error: can't write an add food rule for a food that isn't served");
      }

      String addFoodRule = "(defrule add-";

      // Create the name by capitalizing the internal name
      addFoodRule += this.getInternalName();

      addFoodRule += "-rule\n";

      // Concatenate LHS
      addFoodRule += this.getAddFoodRuleLHS();

      // Add RHS
      addFoodRule += "\n" + TAB + "=>\n";

      addFoodRule += this.getAddFoodRuleRHS();

      addFoodRule += "\n)";

      return addFoodRule;
   }

   private String getAddFoodRuleLHS() {
      String addFoodRuleLHS = "";

      /*
       * Start with satisfied food groups Model: (need-foodGroupNeed (mealTime
       * ?mealTime) (foodGroup ?foodGroup & grain|protein|dairy))
       */
      addFoodRuleLHS += TAB + "(need-foodGroupNeed (mealTime ?mealTime) (foodGroup ?foodGroup & ";
      addFoodRuleLHS += iterableToStringLowerCase(this.getFoodGroups(), "|");
      addFoodRuleLHS += "))";

      /*
       * Proceed with or chain
       */
      // Add the availabilities
      addFoodRuleLHS += "\n\n" + this.getAvailabilitiesString();

      /*
       * Then check that food can be eaten Model: (canEat (food overNightOats))
       */
      addFoodRuleLHS += "\n\n" + TAB + "(canEat (food " + this.getInternalName() + "))";

      /*
       * Finally, add the check that the food isn't already eaten. (not (alreadyAte
       * (mealTime ?mealTime) (food appleCinnamonDanish)))
       */
      addFoodRuleLHS += "\n\n" + TAB + "(not (alreadyAte (mealTime ?mealTime) (food " + this.getInternalName() + ")))";

      return addFoodRuleLHS;
   }

   /*
    * Model: (or (need-foodGroupNeed (dayOfWeek ?dayOfWeek & sunday) (mealTime
    * ?mealTime & breakfast) (foodGroup ?foodGroup)) (need-foodGroupNeed (dayOfWeek
    * ?dayOfWeek & tuesday) (mealTime ?mealTime & breakfast) (foodGroup
    * ?foodGroup)) (need-foodGroupNeed (dayOfWeek ?dayOfWeek & thursday) (mealTime
    * ?mealTime & breakfast) (foodGroup ?foodGroup)) (need-foodGroupNeed (dayOfWeek
    * ?dayOfWeek & saturday) (mealTime ?mealTime & breakfast) (foodGroup
    * ?foodGroup)) )
    */
   private String getAvailabilitiesString() {
      String availabilitiesPatterns = "";

      // Get the days of week
      Set<DayOfWeek> daysOfWeek = this.getAvailabilities().keySet();

//      // Concatenate days of week (lowercased, full name of day) with spaces
//      for (DayOfWeek dayOfWeek : daysOfWeek) {
//         availabilitiesPatterns += "\n" + TAB + TAB + TAB + "(need-foodGroupNeed";
//         availabilitiesPatterns += " (foodGroup ?foodGroup)";
//         availabilitiesPatterns += " (dayOfWeek ?dayOfWeek & " + dayOfWeek.toString().toLowerCase() + ") ";
//
//         availabilitiesPatterns += "(mealTime ?mealTime & "
//               + iterableToStringLowerCase(this.getAvailabilities().get(dayOfWeek), "|");
//         availabilitiesPatterns += "))";
//      }

      // Concatenate days of week (lowercased, full name of day) with spaces
      int count = 0;
      for (DayOfWeek dayOfWeek : daysOfWeek) {
         for (MealTime mealTime : this.getAvailabilities().get(dayOfWeek)) {
            count++;

            availabilitiesPatterns += "\n" + TAB + TAB + TAB + "(need-foodGroupNeed";
            availabilitiesPatterns += " (foodGroup ?foodGroup)";
            availabilitiesPatterns += " (dayOfWeek ?dayOfWeek & " + dayOfWeek.toString().toLowerCase() + ") ";

            availabilitiesPatterns += "(mealTime ?mealTime & " + mealTime.toString().toLowerCase();
            availabilitiesPatterns += "))";
         }
      }

      // Chop off the \n and two tabs
      availabilitiesPatterns = availabilitiesPatterns.substring((new String("\n" + TAB + TAB).length()));

      // Add an enclosing (or ...) IF there is more than one day of the week
      if (count > 1) {
         availabilitiesPatterns = TAB + "(or" + availabilitiesPatterns + "\n" + TAB + ")";
      }

      return availabilitiesPatterns;
   }

   /*
    * Model: (printout t "OvernightOats added to satisfy " ?foodGroup " on day "
    * ?dayOfWeek " and meal time " ?mealTime crlf) (addFood ?dayOfWeek ?mealTime
    * "Over Night Oats" (create$ grain protein dairy))
    */
   private String getAddFoodRuleRHS() {
      String addFoodRuleRHS = "";

      // willEatRuleRHS += " (assert (willEat" + this.getInternalNameFirstUpper() +
      // ")) ; BOGO";

      /*
       * Add the print statement
       */
      // addFoodRuleRHS += TAB + "(printout t \"" + TAB + this.getPrintableName() + "
      // added to satisfy \" ?foodGroup \" on day \" ?dayOfWeek \" and meal time \"
      // ?mealTime crlf)";

      /*
       * Add the addFood function call
       */
      addFoodRuleRHS += "\n" + TAB + "(addFood ?dayOfWeek ?mealTime \"" + this.getPrintableName() + "\" (create$ ";
      addFoodRuleRHS += iterableToStringLowerCase(this.getFoodGroups(), " ");
      addFoodRuleRHS += "))";

      /*
       * Add the assertion that the food has been eaten. Model: (not (alreadyAte
       * (mealTime ?mealTime) (food appleCinnamonDanish)))
       */
      addFoodRuleRHS += "\n" + TAB + "(assert (alreadyAte (mealTime ?mealTime) (food " + this.getInternalName() + ")))";

      return addFoodRuleRHS;
   }

   @Override
   public int compareTo(Food other) {
      return this.getInternalName().compareTo(other.getInternalName());
   }

   private static String iterableToString(Iterable array, String delimiter) {
      String builder = "";

      for (Object item : array) {
         builder += delimiter + item;
      }

      return builder.substring(delimiter.length());
   }

   private static String iterableToStringLowerCase(Iterable array, String delimiter) {
      String builder = "";

      for (Object item : array) {
         builder += delimiter + item.toString().toLowerCase();
      }

      return builder.substring(delimiter.length());
   }

} // public abstract class Food
