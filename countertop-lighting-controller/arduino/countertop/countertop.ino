#include <Adafruit_NeoPixel.h>

#define PIN_BUTTON 3
#define PIN_LED    1
#define PIN_STRIP  2

#define DEBOUNCE   200

#define PIXELS     15
Adafruit_NeoPixel np = Adafruit_NeoPixel(PIXELS, PIN_STRIP, NEO_GRB + NEO_KHZ800);

void setup() {
  pinMode(PIN_BUTTON, INPUT);
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_STRIP, OUTPUT);

  for (int i=0; i<PIXELS; i++)
    np.setPixelColor(i, np.Color(0, 0, 0));
  np.show();
}

int prevButton = LOW;
unsigned long lastTime = 0;

int state = LOW;
int count = 0;

void loop() {
  int button = digitalRead(PIN_BUTTON);
  if (button != prevButton) {
    lastTime = millis();
  }
  prevButton = button;

  if (millis() - lastTime > DEBOUNCE) {
    if (button != state) {
      state = button;
      if (state == HIGH) {
        count = (count % PIXELS) + 1;
      }
    }
  }

  if (count % 2 == 0) {
    digitalWrite(PIN_LED, LOW);
  } else {
    digitalWrite(PIN_LED, HIGH);
  }

  for (int i=0; i<count; i++) {
    np.setPixelColor(i, np.Color(16, 0, 0));
  }
  for (int i=count; i<PIXELS; i++) {
    np.setPixelColor(i, np.Color(0, 0, 16));
  }
  np.show();
}

