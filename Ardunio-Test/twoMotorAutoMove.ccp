#include <Servo.h>

// Define servo objects for motor 1 and motor 2
Servo motor1;
Servo motor2;

// Define the time intervals for direction change (in milliseconds)
const unsigned long interval1 = 1000; // 1 second for motor 1
const unsigned long interval2 = 2000; // 2 seconds for motor 2

// Variables to manage time and state
unsigned long previousMillis1 = 0;
unsigned long previousMillis2 = 0;
bool direction1 = true; // true for forward, false for backward for motor 1
bool direction2 = true; // true for forward, false for backward for motor 2

void setup() {
  // Attach servos to their respective pins
  motor1.attach(9); // Motor 1 control pin
  motor2.attach(6); // Motor 2 control pin
  
  // Start serial communication at 9600 baud
  Serial.begin(9600);

  // Initialize servo positions
  motor1.write(0); // Start at 0 degrees
  motor2.write(0); // Start at 0 degrees
}

void loop() {
  // Get the current time
  unsigned long currentMillis = millis();
  
  // Check if the interval for motor 1 has passed
  if (currentMillis - previousMillis1 >= interval1) {
    // Save the last time you changed direction for motor 1
    previousMillis1 = currentMillis;
    
    // Toggle the direction for motor 1
    direction1 = !direction1;
    
    // Set servo position for motor 1 based on direction
    if (direction1) {
      motor1.write(0); // Move to 0 degrees
      Serial.println("Motor 1 Direction: Forward");
    } else {
      motor1.write(225); // Move to 225 degrees
      Serial.println("Motor 1 Direction: Backward");
    }
    
    // Print the current position of motor 1 to the serial monitor
    Serial.print("Motor 1 Position: ");
    Serial.println(motor1.read());
  }
  
  // Check if the interval for motor 2 has passed
  if (currentMillis - previousMillis2 >= interval2) {
    // Save the last time you changed direction for motor 2
    previousMillis2 = currentMillis;
    
    // Toggle the direction for motor 2
    direction2 = !direction2;
    
    // Set servo position for motor 2 based on direction
    if (direction2) {
      motor2.write(0); // Move to 0 degrees
      Serial.println("Motor 2 Direction: Forward");
    } else {
      motor2.write(225); // Move to 225 degrees
      Serial.println("Motor 2 Direction: Backward");
    }
    
    // Print the current position of motor 2 to the serial monitor
    Serial.print("Motor 2 Position: ");
    Serial.println(motor2.read());
  }
  
  // Small delay to ensure serial output is readable
  delay(100);
}
