#This calculates someone's gpa on a 100 point scale using their math score, 

# Variable
name = "" #String variables
grade = ""
yon = ""
gpa = 0 #integer variable

# Lists
grades = [] #list

# Functions
#This function asks users to enter the grades of 4 of their classes. 
#It accomplishes this by using a loop repeatedly asking them for their
#grades.  Then it cycles through the loop 4 times.  Lastly the program
#will find the average or the GPA by adding up all the grades and #dividing it. 
def calculateGrade():
    print("\nEnter your grade for your classes, in order of")
    print("Math, Science, English, and Social Studies.")
    NOC = 4
    while NOC > 0: #loop
        num = float(input("\nEnter the grade from that class: "))
        grades.append(num)
        NOC -= 1
    total = sum(grades)
    gpa = total / len(grades) / 100 * 4.0
    return gpa

#This function just asks the user for personal infomration like their name and grade. 
#It stores these values in a variable to report it out
#later when this program prints out their report card. 
def studentInfo():
    global name, grade
    name = input("Enter your name: ")
    print("Hello " + name + ".\n")
    grade = input("What grade are you in?: ")
    print("So you are " + name + " and your grade level is " + grade + " correct?\n") 

################################

# Calls student information
studentInfo()

# Ask the user if they want to use the GPA calculator
yon = input("Type 'True' for yes, 'False' for no: ").strip().lower() == 'true' #boolean variable

# Calculate GPA if the user says yes
if yon: #decison making part. 
  gpa = calculateGrade() #Calls the function to calculate the gpa 
  if gpa < 1.0:
    yon = input("\nDid you make an error reporting your grade?").strip().lower()
    if yon == "yes":
      gpa = calculateGrade()
    else:
      print("\nYour GPA is very low, you should work harder in school.")

# Prints report card by retrieving the information from variables and creates the report card. 
print("\n ****Here is your report card****")
print("Name: " + name)
print("Grade: " + grade)
print("GPA:", gpa)
print("Math: ",grades[0])
print("Science: ",grades[1])
print("English: ",grades[2])
print("Social Studies: ",grades[3])
