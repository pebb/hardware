// Note: This will only work on Leostick or Leonardo that have seperate USB channel for HID

void setup() { 
  Serial.begin(9600);
  Serial.setTimeout(1000);
  Keyboard.begin();
}

void loop() {
  if (Serial.find("/")) // start of a command
  {
    // next character is key up or down
    char cmd = Serial.read();
    char key = Serial.read();
    if(cmd == 'D') {
      Keyboard.press(key); 
    } 
    else if(cmd == 'U') {
      Keyboard.release(key);
    }
  }
}


