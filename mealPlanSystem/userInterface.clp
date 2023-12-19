/*
* Author:                  Jack Hsieh
* Expert:                  Wendy Stirling
* Date of creation:        December 29, 2022
* Functional description:  Runs the user interface, including starting the session, asking questions, and ending the session.
*
* This file includes...
*  Functions for asking yes/no and list-based questions to the user
*  A utility function for converting lists into strings
*  Two default salience-based rules for starting and ending the session
* 
* Note that this file does not contain ALL possible user interface elements: 
* other files also contain code that prints to the console and calls the functions in this file.
* This file is concerned with elements that ONLY concern user interface. As such, no facts are involved here.
*/

/*
* ================================================================================
* GLOBAL USER INTERFACE CONSTANTS
* Used by askYesNoIdkQuestion, askListQuestion, and introSession
* Also used by purely internal functions convertYesNoIdkResponse, convertListResponse, and processAbnormalResponse
* ================================================================================
*/
(defglobal ?*YES_CHAR*     = "y")
(defglobal ?*NO_CHAR*      = "n")
(defglobal ?*IDK_CHAR*     = "d")
(defglobal ?*QUIT_CHAR*    = "q")
(defglobal ?*FACTS_CHAR*   = "f")


/*
* ================================================================================
* INTRO/END FUNCTIONS
* Dictates what to print when starting or ending the session
* ================================================================================
*/

/*
* Prints the intro message for the session to the console. Called upon beginning the session.
* Postconditions: Intro message and input instructions are printed to the console.
*/
(deffunction introSession ()
   (printout t crlf "Welcome to the MEAL PLAN EXPERT SYSTEM! I will try my best to assemble complete meals that represent all five food groups." crlf) 
   (printout t "To do this, I'll need to ask you a few questions." crlf) 

   (printout t crlf "For yes/no/ don't know questions, start your answer with" crlf) 
   (printout t "   '" ?*YES_CHAR* "' for yes" crlf)
   (printout t "   '" ?*NO_CHAR* "' for no" crlf)
   (printout t "   '" ?*IDK_CHAR* "' for don't know" crlf)

   (printout t crlf "For list-based know questions, enter the number on the list corresponding to the desired option." crlf) 
   (printout t "For example, if a question asks" crlf) 
   (printout t crlf "   Q) What is your favorite primary color?" crlf)
   (printout t "     1. Red" crlf)
   (printout t "     2. Yellow" crlf)
   (printout t "     3. Blue" crlf)
   (printout t "and you wish to choose Yellow, enter 2." crlf)

   (printout t crlf "At any point, you may enter " crlf) 
   (printout t "   '" ?*QUIT_CHAR* "' to quit" crlf)
   (printout t "   '" ?*FACTS_CHAR* "' to print current facts" crlf)

   (printout t crlf "Thank you! I will start now." crlf)
   (printout t "========================================================================" crlf crlf)
   
   (return)
) ; deffunction introSession ()

/*
* Prints the message for quitting to the console and halts the rule engine. Called when user wants to quit.
* Postconditions: Quit message is printed to the console and the rule engine is halted.
*/
(deffunction quitSession ()
   (printout t crlf "Quitting the session! See you around!" crlf)
   
   (halt)

   (return)
) ; deffunction quitSession ()

/*
* Ends the session by printing all assembled meals
* Can be modified to change how the system behaves after finishing recommendations.
* Postconditions: Ending message is printed to the console, recommended meals are printed, and the rule engine is halted.
*/
(deffunction endSession ()
   (printout t "========================================================================" crlf crlf)
   (printout t crlf "Okay, that's all! Here's all the meals that I've assembled:" crlf crlf)

   (printAllMeals)
      
   (return)
) ; deffunction endSession ()

/*
* ================================================================================
* QUESTION FUNCTIONS
* Functions for asking yes/no/don't know questions and list-based questions
* ================================================================================
*/

/*
* Request a yes, no, or idk response from the terminal using the given prompt,
* and returns the response as a yes, no, or idk symbol. 
*
* Postconditions: Prompt is printed to the console and user input is requested until valid.
*                 Quits the session or prints facts if directed.
*/
(deffunction askYesNoIdkQuestion (?questionPrompt)
   (printout t "Yes/No/Don't know) " ?questionPrompt " ")

   (bind ?returnSymbol FALSE)                                     ; Guarantees the loop runs at least once

   (while (eq ?returnSymbol FALSE) do                             ; Loops until valid input is received
      (bind ?returnSymbol (convertYesNoIdkResponse (readline)))
      
      (if (eq ?returnSymbol FALSE) then
         (printout t "   Please enter a valid response: ")
      )
   ) ; while (eq ?returnSymbol FALSE) do

   (return ?returnSymbol)
) ; deffunction askYesNoIdkQuestion (?questionPrompt)

/*
* Converts a string response to a yes, no, or idk symbol.
* Returns
*  symbol yes if ?response begins with a 'y'
*  symbol no if ?response begins with a 'n'
*  symbol idk if ?response begins with a 'd',
*  TRUE if ?response begins with a 'q'
* all independent of case. Returns FALSE otherwise.
*
* Preconditions: ?response is a string
* Postconditions: Session is quit if ?response begins with a 'q', and facts are printed if ?response begins with an 'f'
*/
(deffunction convertYesNoIdkResponse (?response)
   (if (eq (str-length ?response) 0) then                               ; Empty inputs are automatically invalid
      (bind ?returnSymbol FALSE)
     
    else
      (bind ?responseChar (sub-string 1 1 (lowcase ?response)))         ; Grab first character as lowercase for comparison

      (if (eq ?responseChar ?*YES_CHAR*) then
         (bind ?returnSymbol yes)
       else
         (if (eq ?responseChar ?*NO_CHAR*) then
               (bind ?returnSymbol no)
          else 
            (if (eq ?responseChar ?*IDK_CHAR*) then
               (bind ?returnSymbol idk)
             else
               (bind ?returnSymbol (processAbnormalResponse ?response)) ; Process quit or facts
            ) ; if (eq ?responseChar ?*IDK_CHAR*) then
         ) ; if (eq ?responseChar ?*NO_CHAR*) then
      ) ; if (eq ?responseChar ?*YES_CHAR*) then
   ) ; if (eq (str-length ?response) 0) then

   (return ?returnSymbol)
) ; deffunction convertYesNoIdkResponse (?response)

/*
* Request an index response from a list using the prompt and given list
* and returns the list element selected by the user.
*
* Preconditions: ?list is a list
* Postconditions: Prompt is printed to the console and user input is requested until valid.
*                 Quits the session or prints facts if directed.
*/
(deffunction askListQuestion (?questionPrompt ?list)
   /*
   * Print the question promot and the list
   */
   (printout t "List) " ?questionPrompt " ")
   
   (for (bind ?i 1) (<= ?i (length$ ?list)) (++ ?i)
      (printout t crlf "   " ?i ". " (nth$ ?i ?list))
   )
   (printout t crlf)

   /*
   * Run the question loop
   */
   (bind ?returnSymbol FALSE)                                     ; Guarantees the loop runs at least once

   (while (eq ?returnSymbol FALSE) do                             ; Loops until valid input is received
      (bind ?returnSymbol (convertListResponse ?list (readline)))
      
      (if (eq ?returnSymbol FALSE) then
         (printout t "   Please enter a valid response: ")
      )
   ) ; while (eq ?returnSymbol FALSE) do

   (return ?returnSymbol)
) ; deffunction askListQuestion (?questionPrompt ?list)

/*
* Converts a string response to a list-based question requesting an index.
* Returns
*  the N-th element ?list if ?response is the natural number N in string form and N is a valid index for ?list
*  TRUE if ?response begins with a 'q' independent of case. 
* Returns FALSE otherwise.
*
* Preconditions: ?list is a list and ?response is a string
* Postconditions: Session is quit if ?response begins with a 'q', and facts are printed if ?response begins with an 'f'
*/
(deffunction convertListResponse (?list ?response)
   (bind ?NATURAL_NUMBER_REGEX "[1-9][0-9]*")         ; Matches natural numbers (i.e. positive integers) only

   (bind ?returnSymbol FALSE)                         ; FALSE by default

   /*
   * Change the return symbol to the selected list element only if ?response is the string form of a valid index of ?list
   */
   (if (regexp ?NATURAL_NUMBER_REGEX ?response) then
      (bind ?index (integer ?response))

      (if (<= ?index (length$ ?list)) then
         (bind ?returnSymbol (nth$ ?index ?list))
      )
   ) ; if (regexp ?NATURAL_NUMBER_REGEX ?response) then
      
   /*
   * Otherwise, process as a quit command, facts command, or invalid response
   */
   (if (eq ?returnSymbol FALSE) then
      (bind ?returnSymbol (processAbnormalResponse ?response))
   )

   (return ?returnSymbol)
) ; deffunction convertListResponse (?list ?response)

/*
* Processes a quit command, facts command, or otherwise invalid response.
* Returns
*    boolean TRUE if ?response begins with a 'q' independent of case
* and FALSE otherwise.
* Preconditions: ?response is a string
* Postconditions: Session is quit if ?response begins with a 'q', and facts are printed if ?response begins with an 'f'
*/
(deffunction processAbnormalResponse (?response)
   (bind ?returnSymbol FALSE)                            ; FALSE by default
   
   (if (> (str-length ?response) 0) then                  ; Empty responses are automatically invalid
      (bind ?responseChar (sub-string 1 1 (lowcase ?response)))
      
      (if (eq ?responseChar ?*QUIT_CHAR*) then           ; Quit if 
         (quitSession)
         (bind ?returnSymbol TRUE)                       ; This ensures that the quit command exits the ask loop

       else
         (if (eq ?responseChar ?*FACTS_CHAR*) then       ; Otherwise, print facts
            (facts)
         )
         
         (bind ?returnSymbol FALSE)                      ; Note that a "facts" command is considered an invalid input so that the question is asked again
      ) ; if (eq? responseChar ?*QUIT_CHAR*) then
   ) ; if (> (str-length ?response) 0) then

   (return ?returnSymbol)
) ; deffunction processAbnormalResponse (?response)

/*
* Asks the user for which day of the week it is.
* Returns the chosen day of the week as a symbol.
* 
* Postconditions: Day-asking question is printed to the console.
*                 Session is quit if ?response begins with a 'q', and facts are printed if ?response begins with an 'f'
*/
(deffunction askDayOfWeekQuestion ()
   (bind ?DAYS_OF_WEEK (create$ sunday monday tuesday wednesday thursday friday saturday))

   (return (askListQuestion "Which day of the week is it?" ?DAYS_OF_WEEK))
) ; deffunction askDayOfWeekQuestion ()

/*
* ================================================================================
* UTILITY FUNCTIONS
* Currently only includes list to string conversion function 
* ================================================================================
*/

/*
* Converts a list to a string
* Returns the list as a string with elements separated by the given delimiter
*
* Preconditions: ?list is a list
*/
(deffunction listToString (?list ?delimiter)
   (bind ?string "")

   (foreach ?item ?list
      (bind ?string (str-cat ?string ?delimiter ?item))  ; concatenate the delimiter followed by the list element to the string
   )

   /*
   * If the list is non-empty, remove the delimiter before the first list element
   */
   (if (> (length$ ?list) 0) then
      (bind ?string (sub-string (+ (str-length ?delimiter) 1) (str-length ?string) ?string))
   )

   (return ?string)
) ; deffunction listToString (?list ?delimiter)

/*
* ================================================================================
* INTRO/END RULES
* Prints intro and ending at start and end of session respectively
* ================================================================================
*/

/*
* Prints the message introducing the session. Should fire first.
*/
(defrule introSessionRule "Prints intro message. Highest salience: should fire first."
   (declare (salience 1))
   =>
   (introSession)
) ; defrule introSession

/*
* Prints the message ending the session. Should fire last.
*/
(defrule endSessionRule "Prints end message. Lowest salience: should fire last."
   (declare (salience -1))
   =>
   (endSession)
) ; defrule endSession