# MealPlanner
A user-friendly expert system that generates nutritional meal plans based on cafeteria menu and complient with dietary constraints.

## Overview
MealPlanner is an expert system that...
- Asks the user about their dietary constraints (Vegetarian, Vegan, Gluten-free, Nut-free, Dairy-free)

- Prints a three-meal plan for the day, where each meal
   - Consists of entrees, sides, and drinks available at the cafeteria at the given time and day
   - Is fully compliant with the provided dietary constraints
   - Provides all of the necessary food groups (Grain, Protein, Produce, Fat, Dairy)

The MealPlanner system is split into two parts:
1. MealPlanner, a Jess expert system that consists of a customizable knowledge base and the logic used to generate meals.
2. MealPlannerGenerator, a Java program that generates the knowledge base for MealPlanner based on a food choice/availability spreadsheet.

## Usage

### Dependencies
MealPlanner
- [Jess rule engine for Java](http://alvarestech.com/temp/fuzzyjess/Jess60/Jess70b7/docs/intro.html#setup)

MealPlannerGenerator
- [Apache POI](https://poi.apache.org/) for Java

### Running MealPlanner
1. Install Jess.
2. In the terminal, navigate to the correct directory and run Jess by entering `bin/jess`
3. Batch in the _src/setup.clp_ file by entering `(batch src/setup.clp)`
4. To run the program, enter `(run)`
5. The program will ask the user for needed information.
6. Once all relevant questions have been answered, the program will print several potential meals to the console.
7. To restart, enter `(reset) (run)`

### Running MealPlannerGenerator
1. Include Apache POI in Referenced Libraries.
2. Customize the .xlsx file in the _input_ folder by adding desired foods, availability, and nutritional data.
3. Once done, run _Main.java_.
4. The program will produce the corresponding _canEatRules.clp_ and _addFoodRules.clp_ rule files in the _output_ folder.
   - Changing `printToConsole` to `true` will print each food and the corresponding rules to the console.

## Acknowledgments
Thank you to Wendy Sterling, MS, RD, CSSD, CEDRD-S for her expertise for assembling meals plans under dietary restrictions.
