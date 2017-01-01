#include "account.h"

#ifndef WIFI_SSID
  #error "Please define WIFI_SSID"
#endif
#ifndef WIFI_PASSWORD
  #error "Please define WIFI_PASSWORD"
#endif

#include <Adafruit_NeoPixel.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

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

#define PORT 80
ESP8266WebServer server (PORT);

int prevButton = LOW;
unsigned long lastTime = 0;

int buttonState = LOW;
int count = 0;

#define STATES 2
int state = 0;
int forceRefresh = 0;
int mode = 0;

unsigned long lastRefresh = 0;

const uint32_t COLOR_OFF = np.Color(0, 0, 0);
uint32_t COLOR_ON = np.Color(255, 147, 41);

int rainbow = 0;

int connected = 0;
uint32_t rgb = COLOR_OFF;

void setup() {
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif

  pinMode(PIN_BUTTON, INPUT);
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_STRIP, OUTPUT);

  np.begin();
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  resetColor();
  np.show();

  intro();

  refresh();
}

void setState(int s) {
  if (s >= STATES) s = 0;
  state = s;
  mode = 0;
  forceRefresh = 1;
}

void handleState() {
  int s = atoi(server.arg("state").c_str());
  setState(s);
  server.send(200, "text/plain", "OK");
}

void handleReset() {
  COLOR_ON = np.Color(255, 147, 41);
  setState(0);
  server.send(200, "text/plain", "OK");
}

void handleOff() {
  setState(0);
  server.send(200, "text/plain", "OK");
}

void handleOn() {
  setState(1);
  server.send(200, "text/plain", "OK");
}

void handleRgb() {
  int r = atoi(server.arg("r").c_str());
  int g = atoi(server.arg("g").c_str());
  int b = atoi(server.arg("b").c_str());
  rgb = np.Color(r, g, b);
  server.send(200, "text/plain", "OK");
  mode = 1;
  forceRefresh = 1;
}

void handleColor() {
  int r = atoi(server.arg("r").c_str());
  int g = atoi(server.arg("g").c_str());
  int b = atoi(server.arg("b").c_str());
  COLOR_ON = np.Color(r, g, b);
  server.send(200, "text/plain", "OK");
  mode = 0;
  forceRefresh = 1;
}

void loop() {
  int changed = detectChange();

  if (changed) {
    state = (state + 1) % STATES;
    mode = 0;
  }

  if (forceRefresh || changed || (millis() - lastRefresh > REFRESH)) {
    if (forceRefresh) forceRefresh = 0;
    lastRefresh = millis();
    refresh();
  }

  if (!connected)
    checkWifi();
  else
    server.handleClient();
}

unsigned long lastWifiCheck = 0;
int led = 0;
void checkWifi() {
  if (millis() - lastWifiCheck < 500)
    return;

  lastWifiCheck = millis();
  led = !led;
  digitalWrite(PIN_LED, led ? LOW : HIGH);

  if (WiFi.status() == WL_CONNECTED) {
    connected = 1;
    led = 0;
    digitalWrite(PIN_LED, led ? LOW : HIGH);
  }

  if (connected) {
    server.on("/state", handleState);
    server.on("/reset", handleReset);
    server.on("/rgb", handleRgb);
    server.on("/color", handleColor);
    server.on("/off", handleOff);
    server.on("/on", handleOn);
    server.begin();
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
  if (mode == 1) {
    for (int i=0; i<PIXELS; i++)
      np.setPixelColor(i, rgb);
  }
  else {
    resetColor();
  
    if (state == 1) {
      for (int i = 0; i < PIXELS; i++)
        np.setPixelColor(i, COLOR_ON);
    }
//    else if (state == 2) {
//      for (int i = 16; i < 32; i++)
//        np.setPixelColor(i, COLOR_ON);
//    }
//    else if (state == 3) {
//      for (int i=32; i<PIXELS; i++)
//        np.setPixelColor(i, COLOR_ON);
//    }
//    else if (state == 4) {
//      for (int i=0; i<PIXELS; i++)
//        np.setPixelColor(i, COLOR_ON);
//    }
//    else if (state == 5) {
//      for(int i=0; i<PIXELS; i++) {
//        np.setPixelColor(i, Wheel((i+rainbow) & 255));
//      }
//      rainbow = (rainbow + 1) % 255;
//      lastRefresh = millis() - REFRESH + 10; 
//    }
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

