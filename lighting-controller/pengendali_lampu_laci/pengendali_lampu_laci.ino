#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

typedef struct {
  int pin;
  int n;
  int pos[6];
} Lights;

//////////////////////////////////////////////////////////////////////

#define NUM_INPUT 8
const int inputPins[NUM_INPUT] = { 2, 3, 4, 5, 6, 7, 8, 9 };

#define NUM_OUTPUT 4
const int outputPins[NUM_OUTPUT]   = { 10, 11, 12, 13 };
const int outputPixels[NUM_OUTPUT] = {  7,  7,  7,  7 };

Lights lights[NUM_INPUT] = {
  { .pin = 0, .n = 4, .pos = { 0, 2, 4, 6 } },
  { .pin = -1 },
  { .pin = -1 },
  { .pin = -1 },
  { .pin = -1 },
  { .pin = -1 },
  { .pin = -1 },
  { .pin = -1 }
};

const uint32_t colorOn = Adafruit_NeoPixel::Color(255 >> 2, 147 >> 2, 41 >> 2);
const uint32_t colorOff = Adafruit_NeoPixel::Color(0, 0, 0);

//////////////////////////////////////////////////////////////////////

int inputStates[NUM_INPUT];
Adafruit_NeoPixel* pixels[NUM_OUTPUT];

void setup() {
  for (int i=0; i<NUM_INPUT; i++) {
    inputStates[i] = LOW;
    int pin = inputPins[i];
    pinMode(pin, INPUT);
  }
  for (int i=0; i<NUM_OUTPUT; i++) {
    int pin = outputPins[i];
    int npixel = outputPixels[i];
    pixels[i] = new Adafruit_NeoPixel(npixel, pin, NEO_GRB + NEO_KHZ800);
    pixels[i]->begin();
  }
}

void loop() {
  readInputs();
  writeOutputs();
}

void readInputs() {
  for (int i=0; i<NUM_INPUT; i++) {
    int pin = inputPins[i];
    inputStates[i] = digitalRead(pin); 
  }
}

void writeOutputs() {
  for (int i=0; i<NUM_INPUT; i++) {
    int pin = lights[i].pin;
    int n = lights[i].n;
    if (pin < 0 || n < 1) continue;

    int state = inputStates[i];
    if (state == HIGH) {
      for (int j=0; j<n; j++) {
        int pos = lights[i].pos[j];
        pixels[pin]->setPixelColor(pos, colorOff);
      } 
    }
    else {
      for (int j=0; j<n; j++) {
        int pos = lights[i].pos[j];
        pixels[pin]->setPixelColor(pos, colorOn);
      } 
    }
    pixels[pin]->show();
  }
}



