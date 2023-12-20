import java.util.Arrays;
import java.util.EnumSet;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class PrimitiveFood extends Food {
	private EnumSet<DietaryRestrictionViolation> dietaryRestrictionViolations; // Stores primitive dietary restriction
																				// violations
	private FoodGroup foodGroup;

	/*
	 * Set dietary restriction violations
	 */
	public void setDietaryRestrictionViolations(EnumSet<DietaryRestrictionViolation> newDietaryRestrictionViolations) {
		this.dietaryRestrictionViolations = newDietaryRestrictionViolations;
	}

	/*
	 * Get dietary restriction violations
	 */
	@Override
	public EnumSet<DietaryRestrictionViolation> getDietaryRestrictionViolations() {
		return this.dietaryRestrictionViolations;
	}

	/*
	 * Set food group
	 */
	public void setFoodGroup(FoodGroup newFoodGroup) {
		this.foodGroup = newFoodGroup;
	}

	/*
	 * Returns EnumSet of just this food group
	 */
	@Override
	public EnumSet<FoodGroup> getFoodGroups() {
		return EnumSet.of(this.foodGroup);
	}

	/*
	 * Returns the food and its attributes as a string
	 */
	@Override
	public String toString() {
		String builder = "[primitive] " + this.getPrintableName();
		builder += "\n\t internal name: " + this.getInternalName();
		builder += "\n\t food group: " + Arrays.toString(getFoodGroups().toArray());
		builder += "\n\t dietary restrictions: " + Arrays.toString(getDietaryRestrictionViolations().toArray());
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
	public PrimitiveFood(Row row) {
		Iterator<Cell> cellIterator = row.cellIterator();

		// Read the name
		this.setPrintableName(cellIterator.next().getStringCellValue());

		// Confirm that the food is a primitive
		if (!cellIterator.next().getBooleanCellValue()) {
			throw new RuntimeException("Error! Trying to assert a PrimitiveFood, but is flagged as not a primitive");
		}

		// Read the dietary restriction violations
		this.dietaryRestrictionViolations = EnumSet.noneOf(DietaryRestrictionViolation.class); // Empty enum set

		// Order: Gluten, Vegan, Vegetarian, Dairy, Nut
		if (cellIterator.next().getBooleanCellValue()) {
			dietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_GLUTEN_FREE);
		}
		if (cellIterator.next().getBooleanCellValue()) {
			dietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_VEGAN);
		}
		if (cellIterator.next().getBooleanCellValue()) {
			dietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_VEGETARIAN);
		}
		if (cellIterator.next().getBooleanCellValue()) {
			dietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_DAIRY_FREE);
		}
		if (cellIterator.next().getBooleanCellValue()) {
			dietaryRestrictionViolations.add(DietaryRestrictionViolation.NOT_NUT_FREE);
		}

		// Set the food group
		this.setFoodGroup(FoodGroup.valueOf(cellIterator.next().getStringCellValue().toUpperCase()));

		// Skip past the next 10 columns
		for (int i = 1; i <= 10; i++) {
			cellIterator.next();
		}

		// Conditionally execute if served
		super.readAvailabilities(cellIterator);
	}

	/*
	 * No ingredients
	 */
   @Override
   public String getIngredientsString() {
      return "";
   }

} // PrimitiveFood
