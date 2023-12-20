import java.util.Arrays;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class CompositeFood extends Food {
   private SortedSet<Food> mainIngredients; // Stores main ingredients (food groups + dietary restrictions)
   private SortedSet<Food> traceIngredients; // Stores trace ingredients (dietary restrictions)
   private EnumSet<DietaryRestrictionViolation> additionalDietaryRestrictionViolations; // Other restrictions

   public SortedSet<Food> getMainIngredients() {
      return this.mainIngredients;
   }

   public SortedSet<Food> getTraceIngredients() {
      return this.traceIngredients;
   }

   public EnumSet<DietaryRestrictionViolation> getAdditionalDietaryRestrictionViolations() {
      return this.additionalDietaryRestrictionViolations;
   }

   private boolean ingredientReferencesMade = false; // Whether ingredients string references have been linked to
   // actual references to the correct objects

   private SortedSet<String> mainIngredientsStrings;
   private SortedSet<String> traceIngredientsStrings;

   /*
    * Returns EnumSet of the represented food groups of this composite food
    * Includes only food groups of main ingredients
    */
   @Override
   public EnumSet<FoodGroup> getFoodGroups() {
      // Start an empty enum set
      EnumSet<FoodGroup> foodGroups = EnumSet.noneOf(FoodGroup.class);

      // Add all food groups of main ingredients
      for (Food mainIngredient : mainIngredients) {
         foodGroups.addAll(mainIngredient.getFoodGroups());
      }

      return foodGroups;
   }

   /*
    * Returns EnumSet of the dietary restrictions of this composite food. Includes
    * dietary restrictions of main ingredients, trace ingredients, and additionals
    */
   @Override
   public EnumSet<DietaryRestrictionViolation> getDietaryRestrictionViolations() {
      // Start an empty enum set
      EnumSet<DietaryRestrictionViolation> dietaryRestrictionViolations = EnumSet
            .noneOf(DietaryRestrictionViolation.class);

      // Add all DRVs of main ingredients
      for (Food mainIngredient : mainIngredients) {
         dietaryRestrictionViolations.addAll(mainIngredient.getDietaryRestrictionViolations());
      }

      // Add all DRVs of trace ingredients
      for (Food traceIngredient : traceIngredients) {
         dietaryRestrictionViolations.addAll(traceIngredient.getDietaryRestrictionViolations());
      }

      // Add all DRVs of additional DRVs
      dietaryRestrictionViolations.addAll(additionalDietaryRestrictionViolations);

      return dietaryRestrictionViolations;
   }
   
   /*
    * Returns the food and its attributes as a string
    */
   @Override
   public String toString() {
      String builder = "[composite] " + this.getPrintableName();
      builder += "\n\t internal name: " + this.getInternalName();

      builder += "\n\t food groups: " + Arrays.toString(getFoodGroups().toArray());
      builder += "\n\t dietary restrictions: " + Arrays.toString(getDietaryRestrictionViolations().toArray());

      builder += "\n\t main ingredients: " + Arrays.toString(mainIngredientsStrings.toArray());
      builder += "\n\t trace ingredients: " + Arrays.toString(traceIngredientsStrings.toArray());
      builder += "\n\t additional DRVs: " + Arrays.toString(additionalDietaryRestrictionViolations.toArray());

      builder += "\n\t served: " + this.isServed();

      // Add availabilities if served
      if (this.isServed()) {
         builder += "\n\t\t availabilities: " + this.getAvailabilities();
      }

      return builder;
   }

   /*
    * Reads a primitive given a full spreadsheet row Order: Food, Primitive?,
    * NotGlutenFree, NotVegan, NotVegetarian, NotDairyFree, NotNutFree, FoodGroup,
    * Served alone?, DayOfWeek - TimeOfDay, Component 1, Component 2, Component 3,
    * Component 4, Component 5, Trace Ingredient 1, Trace Ingredient 2, Trace
    * Ingredient 3, Trace Ingredient 4, Trace Ingredient 5 BOGO: implement "served"
    * side
    */
   public CompositeFood(Row row) {
      Iterator<Cell> cellIterator = row.cellIterator();

      // Read the name
      this.setPrintableName(cellIterator.next().getStringCellValue());

      // Confirm that the food is a composite
      if (cellIterator.next().getBooleanCellValue()) {
         throw new RuntimeException("Error! Trying to assert a CompositeFood, but is flagged as a primitive");
      }

      // Read the additional dietary restriction violations
      this.additionalDietaryRestrictionViolations = EnumSet.noneOf(DietaryRestrictionViolation.class); // Empty enum
      // set

      // Order: Gluten, Vegan, Vegetarian, Dairy, Nut
      if (cellIterator.next().getBooleanCellValue()) {
         additionalDietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_GLUTEN_FREE);
      }
      if (cellIterator.next().getBooleanCellValue()) {
         additionalDietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_VEGAN);
      }
      if (cellIterator.next().getBooleanCellValue()) {
         additionalDietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_VEGETARIAN);
      }
      if (cellIterator.next().getBooleanCellValue()) {
         additionalDietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_DAIRY_FREE);
      }
      if (cellIterator.next().getBooleanCellValue()) {
         additionalDietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_NUT_FREE);
      }

      // Skip the food group column
      cellIterator.next();

      // Add the 5 main ingredients as string references
      mainIngredientsStrings = new TreeSet<String>();

      String mainIngredientString;
      for (int i = 1; i <= 5; i++) {
         mainIngredientString = cellIterator.next().getStringCellValue();

         if (!mainIngredientString.isEmpty()) {
            mainIngredientsStrings.add(mainIngredientString);
         }
      }

      // Add the 5 trace ingredients as string references
      traceIngredientsStrings = new TreeSet<String>();

      String traceIngredientString;
      for (int i = 1; i <= 5; i++) {
         traceIngredientString = cellIterator.next().getStringCellValue();

         if (!traceIngredientString.isEmpty()) {
            traceIngredientsStrings.add(traceIngredientString);
         }
      }

      // Conditionally execute if served
      super.readAvailabilities(cellIterator);
   }

   /*
    * Substitutes string references with object references
    */
   public void substituteReferences(Map<String, Food> map) {
      // Substitute main ingredients
      this.mainIngredients = new TreeSet<Food>();
      for (String mainIngredientString : this.mainIngredientsStrings) {
         this.mainIngredients.add(map.get(mainIngredientString));

         if (map.get(mainIngredientString) == null) {
            throw new RuntimeException("There is no reference by the name of " + mainIngredientString);
         }
      }

      // Substitute main ingredients
      this.traceIngredients = new TreeSet<Food>();
      for (String traceIngredientString : this.traceIngredientsStrings) {
         this.traceIngredients.add(map.get(traceIngredientString));

         if (map.get(traceIngredientString) == null) {
            throw new RuntimeException("There is no reference by the name of " + traceIngredientString);
         }
      }

      // Set "references made" flag to true
      this.ingredientReferencesMade = true;
   }

   @Override
   public String getIngredientsString() {

      String ingredientsString = "";
      
      // Add the main ingredients
      boolean hasMainIngredients = false;
      for (Food mainIngredient : ((CompositeFood) this).getMainIngredients()) {
         if (!hasMainIngredients) {
            ingredientsString += "\n";
            hasMainIngredients = true;
         }
         ingredientsString += TAB + "(canEat (food " + mainIngredient.getInternalName() + "))\n";
      }

      // Add the trace ingredients
      boolean hasTraceIngredients = false;
      for (Food traceIngredient : ((CompositeFood) this).getTraceIngredients()) {
         if (!hasTraceIngredients) {
            ingredientsString += "\n";
            hasTraceIngredients = true;
         }
         ingredientsString += TAB + "(canEat (food " + traceIngredient.getInternalName() + "))\n";
      }

      return ingredientsString;
   } 

} // CompositeFood
