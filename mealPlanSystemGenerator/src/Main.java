/*
 * Java program to read foods from spreadsheet and write the canEat rules and addFood rules
 * Cleaned up 2023/10/19
 */

// Import statements
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

// Main class
public class Main {

   // Whether to print progress and food base to console
   public static boolean printToConsole = true;

   // File to read from
   public static String filename = "input/CuatroFoods.xlsx";

   // File to output to
   public static String canEatRulesFilename = "output/canEatRules.clp";
   public static String addFoodRulesFilename = "output/addFoodRules.clp";

   // Main driver method
   public static void main(String[] args) {

      // Try block to check for exceptions
      try {

         // Reading file from local directory
         FileInputStream file = new FileInputStream(new File(Main.filename));

         // Create Workbook instance holding reference to .xlsx file
         XSSFWorkbook workbook = new XSSFWorkbook(file);

         // Get first/desired sheet from the workbook
         XSSFSheet sheet = workbook.getSheetAt(0);

         // Iterate through each rows one by one
         Iterator<Row> rowIterator = sheet.iterator();

         // Skip the first row (headers)
         rowIterator.next();

         // Till has next, add foods to map
         Map<String, Food> map = new HashMap<String, Food>();

         while (rowIterator.hasNext()) {

            Row row = rowIterator.next();

            // Get whether the food is a primitive (2nd column)
            boolean isPrimitive = row.getCell(1).getBooleanCellValue();

            // If the food is a primitive, read as a primitive
            if (isPrimitive) {
               PrimitiveFood primitiveFood = new PrimitiveFood(row);
               map.put(primitiveFood.getPrintableName(), primitiveFood);
            }
            
            // Otherwise, read as a composite and print
            else {
               CompositeFood compositeFood = new CompositeFood(row);
               map.put(compositeFood.getPrintableName(), compositeFood);
            }
         } // while (rowIterator.hasNext())
         
         // Fill references for all composite foods
         for (Food food : map.values()) {
            if (food instanceof CompositeFood) {
               ((CompositeFood) food).substituteReferences(map);
            }
         }

         // Optionally print all rule entries
         if (printToConsole) {
            System.out.println("=======================================================");
            
            for (Food food : map.values()) {
               System.out.println("------------------------------");

               System.out.println(food.toString() + "\n");
               System.out.println(food.getCanEatRule() + "\n");

               if (food.isServed()) {
                  System.out.println(food.getAddFoodRule() + "\n");
               }
            }
         }

         // Write all food canEat rules to a file
         FileWriter fileWriter = new FileWriter(Main.canEatRulesFilename);

         for (Food food : map.values()) {
            fileWriter.write(food.getCanEatRule() + "\n\n");
         }
         fileWriter.close();

         // Write all served foods to the file
         fileWriter = new FileWriter(Main.addFoodRulesFilename);

         for (Food food : map.values()) {
            if (food.isServed()) {
               fileWriter.write(food.getAddFoodRule() + "\n\n");
            }
         }
         fileWriter.close();

         System.out.println("Total num entries = " + map.size());

         // Close workbook
         workbook.close();

         // Close file output streams
         file.close();

      } // try

      // Catch block to handle exceptions
      catch (Exception e) {

         // Display the exception along with line number
         // using printStackTrace() method
         e.printStackTrace();
      } // catch

      System.out.println("Goodbye world!");

   } // main
}
// public class Main
