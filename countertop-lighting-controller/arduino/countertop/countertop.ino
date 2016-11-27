#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

#define PIN_BUTTON 3
#define PIN_LED    1
#define PIN_STRIP  2

#define DEBOUNCE   200
#define REFRESH    5000

#define PIXELS     47
Adafruit_NeoPixel np = Adafruit_NeoPixel(PIXELS, PIN_STRIP, NEO_GRB + NEO_KHZ800);


int prevButton = LOW;
unsigned long lastTime = 0;

int buttonState = LOW;
int count = 0;

#define STATES 6
int state = 0;
int led = 0;

unsigned long lastRefresh = 0;

const uint32_t COLOR_OFF = np.Color(0, 0, 0);
const uint32_t COLOR_ON = np.Color(255, 147, 41);

int rainbow = 0;

void setup() {
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif

  pinMode(PIN_BUTTON, INPUT);
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_STRIP, OUTPUT);

  np.begin();

  resetColor();
  np.show();

  intro();

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

void resetColor() {
  for (int i = 0; i < PIXELS; i++)
    np.setPixelColor(i, COLOR_OFF);
}

void refresh() {
  if (led) {
    digitalWrite(PIN_LED, HIGH);
  } else {
    digitalWrite(PIN_LED, LOW);
  }

  resetColor();

  if (state == 1) {
    for (int i = 0; i < 16; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 2) {
    for (int i = 16; i < 32; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 3) {
    for (int i=32; i<PIXELS; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 4) {
    for (int i=0; i<PIXELS; i++)
      np.setPixelColor(i, COLOR_ON);
  }
  else if (state == 5) {
    for(int i=0; i<PIXELS; i++) {
      np.setPixelColor(i, Wheel((i+rainbow) & 255));
    }
    rainbow = (rainbow + 1) % 255;
    lastRefresh = millis() - REFRESH + 10; 
  }

  np.show();
}

void intro() {
  resetColor();

  for(int j=0; j<256; j++) {
    for(int i=0; i<PIXELS; i++) {
      np.setPixelColor(i, Wheel((i+j) & 255));
    }
    np.show();
    delay(1);
  }

  delay(500);
  resetColor();
  np.show();
}

uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85) {
    return np.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return np.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return np.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
}

