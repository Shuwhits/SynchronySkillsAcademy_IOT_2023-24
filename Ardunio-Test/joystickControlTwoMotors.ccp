#include <Servo.h>

// Define the pins for the joystick axes
const int joystickXPin = A0; // X-axis of joystick connected to analog pin A0
const int joystickYPin = A1; // Y-axis of joystick connected to analog pin A1
const int joystickZPin = A2; // Z-axis of joystick connected to analog pin A2

// Define the pins for the motor control
const int motor1Pin = 9; // Control pin for motor 1
const int motor2Pin = 10; // Control pin for motor 2

// Define the neutral position of the joystick
const int joystickNeutral = 512;

// Create servo objects to control the motors
Servo motor1;
Servo motor2;

void setup() {
  // Attach the servo objects to the motor control pins
  motor1.attach(motor1Pin);
  motor2.attach(motor2Pin);
}

void loop() {
  // Read the joystick values
  int joystickXValue = analogRead(joystickXPin);
  int joystickYValue = analogRead(joystickYPin);
  int joystickZValue = analogRead(joystickZPin);
  
  // Map joystick values to motor speeds
  int motorSpeed1 = map(joystickYValue, 0, 1023, -100, 100);
  int motorSpeed2 = map(joystickXValue, 0, 1023, -100, 100);
  int motorSpeed3 = map(joystickZValue, 0, 1023, -100, 100);

  // Calculate the final motor speeds by combining X, Y, and Z values
  int finalSpeed1 = motorSpeed1 + motorSpeed2 + motorSpeed3;
  int finalSpeed2 = motorSpeed1 - motorSpeed2 + motorSpeed3;

  // Constrain the values to ensure they are within valid range
  finalSpeed1 = constrain(finalSpeed1, -100, 100);
  finalSpeed2 = constrain(finalSpeed2, -100, 100);

  // Set the motor speeds
  int motor1Speed = map(finalSpeed1, -100, 100, 0, 180);
  int motor2Speed = map(finalSpeed2, -100, 100, 0, 180);
  
  motor1.write(motor1Speed);
  motor2.write(motor2Speed);

  // Wait a short duration before reading the joystick again
  delay(100);
}
