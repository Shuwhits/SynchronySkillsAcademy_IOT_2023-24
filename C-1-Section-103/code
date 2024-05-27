#include <iostream>
#include <vector>
#include <string>

using namespace std;

// Function 
float calculateGrade();
void studentInfo();

// Global variables
string name = "";
string grade = "";
vector<float> grades;

int main() {
    // Calls student information
    studentInfo();

    // Ask the user if they want to use the GPA calculator
    cout << "Type 'true' for yes, 'false' for no: ";
    string yon;
    cin >> yon;

    // Calculate GPA if the user says yes
    if (yon == "true") {
        float gpa = calculateGrade(); // Calls the function to calculate the GPA
        if (gpa < 1.0) {
            cout << "\nDid you make an error reporting your grade?";
            string response;
            cin >> response;
            if (response == "yes") {
                gpa = calculateGrade();
            } else {
                cout << "\nYour GPA is very low, you should work harder in school.";
            }
        }

        // Prints report card
        cout << "\n**** Here is your report card ****\n";
        cout << "Name: " << name << endl;
        cout << "Grade: " << grade << endl;
        cout << "GPA: " << gpa << endl;
        cout << "Math: " << grades[0] << endl;
        cout << "Science: " << grades[1] << endl;
        cout << "English: " << grades[2] << endl;
        cout << "Social Studies: " << grades[3] << endl;
    }

    return 0;
}

// Function to calculate GPA
//This function asks users to enter the grades of 4 of their classes. 
//will find the average or the GPA by adding up all the grades and 
//dividing it. 
float calculateGrade() {
    cout << "\nEnter your grade for your classes, in order of\n";
    cout << "Math, Science, English, and Social Studies." << endl;

    int NOC = 4;
    while (NOC > 0) {
        float num;
        cout << "\nEnter the grade from that class: ";
        cin >> num;
        grades.push_back(num);
        NOC--;
    }

    float total = 0;
    for (float grade : grades) {
        total += grade;
    }
    float gpa = (total / grades.size()) / 100 * 4.0;
    return gpa;
}

// Function to collect student information
void studentInfo() {
    cout << "Enter your name: ";
    cin >> name;
    cout << "Hello " << name << ".\n";
    cout << "What grade are you in?: ";
    cin >> grade;
    cout << "So you are " << name << " and your grade level is " << grade << " correct?\n";
}
