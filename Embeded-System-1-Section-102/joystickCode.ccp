#include <Servo.h>

Servo servo1;  // create servo object to control first servo
Servo servo2;  // create servo object to control second servo
Servo servo3;  // create servo object to control third servo

int joystickXPin = A0;  // Joystick X-axis connected to analog pin A0
int joystickYPin = A1;  // Joystick Y-axis connected to analog pin A1
int joystickZPin = A2;  // Joystick Z-axis connected to analog pin A2

int joyXValue = 0;  // Variable to store joystick X-axis reading
int joyYValue = 0;  // Variable to store joystick Y-axis reading
int joyZValue = 0;  // Variable to store joystick Z-axis reading

int ledPin = 13;  // Define the LED pin 

void setup() {
  servo1.attach(9);   // attaches the first servo to pin 9
  servo2.attach(10);  // attaches the second servo to pin 10
  
  pinMode(joystickXPin, INPUT); // set joystick X-axis pin as input
  pinMode(joystickYPin, INPUT); // set joystick Y-axis pin as input
  pinMode(joystickZPin, INPUT); // set joystick Z-axis pin as input

  pinMode(ledPin, OUTPUT); // set LED pin as output
}

void loop() {
  // Read joystick values
  joyXValue = analogRead(joystickXPin);
  joyYValue = analogRead(joystickYPin);
  joyZValue = analogRead(joystickZPin);

  // Map joystick values to servo positions (0-180 degrees)
  int servo1Pos = map(joyXValue, 0, 1023, 0, 180);
  int servo2Pos = map(joyYValue, 0, 1023, 0, 180);
  int servo3Pos = map(joyZValue, 0, 1023, 0, 180);

  // Control the servos with joystick values
  servo1.write(servo1Pos);
  servo2.write(servo2Pos);

  if (joyXValue != 512 || joyYValue != 512 || joyZValue != 512){ // Checks if joystick is moved
    digitalWrite(ledPin, HIGH); //Digital Write function
  } else {
    digitalWrite(ledPin, LOW); //Digital Write function
  }

  // Delay for stability
  delay(15);
}
