#include <Adafruit_NeoPixel.h>

#define PIN_BUTTON 3
#define PIN_LED    1
#define PIN_STRIP  2

#define DEBOUNCE   200
#define REFRESH    5000

#define PIXELS     15
Adafruit_NeoPixel np = Adafruit_NeoPixel(PIXELS, PIN_STRIP, NEO_GRB + NEO_KHZ800);


int prevButton = LOW;
unsigned long lastTime = 0;

int buttonState = LOW;
int count = 0;

#define STATES 5
int state = 0;
int led = 0;

unsigned long lastRefresh = 0;

const uint32_t COLOR_OFF = np.Color(0, 0, 0);
const uint32_t COLOR_ON = np.Color(64, 64, 64);

void setup() {
  pinMode(PIN_BUTTON, INPUT);
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_STRIP, OUTPUT);

  for (int i=0; i<PIXELS; i++)
    np.setPixelColor(i, np.Color(0, 0, 0));
  np.show();

  refresh();
}

void loop() {
  int changed = detectChange();

  if (changed) {
    state = (state + 1) % STATES;
    led = !led;
  }

  if (changed || (millis() - lastRefresh > REFRESH)) {
    lastRefresh = millis();
    refresh();
  }
}

int detectChange() {
  int button = digitalRead(PIN_BUTTON);
  if (button != prevButton) {
    lastTime = millis();
  }
  prevButton = button;

  if (millis() - lastTime > DEBOUNCE) {
    if (button != buttonState) {
      buttonState = button;
      if (buttonState == HIGH) {
        return 1;
      }
    }
  }

  return 0;
}

void refresh() {
  if (led) {
    digitalWrite(PIN_LED, HIGH);
  } else {
    digitalWrite(PIN_LED, LOW);
  }

  for (int i=0; i<PIXELS; i++) 
    np.setPixelColor(i, COLOR_OFF);

  if (state == 1) {
    for (int i=0; i<5; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 2) {
    for (int i=5; i<10; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 3) {
    for (int i=10; i<15; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 4) {
    for (int i=0; i<PIXELS; i++)
      np.setPixelColor(i, COLOR_ON);
  }

  np.show();
}

