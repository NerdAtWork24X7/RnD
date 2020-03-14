#include <ESP8266WiFi.h>

float volts = 0.0, temperatureC = 0.0;

char *ssid = "ESP8266_SSID";
char *password = "tenonezero";
const char* host = "192.168.11.4";

WiFiClient client;

void setup() {
    // put your setup code here, to run once:
  pinMode(A0,INPUT);
  //Connect to the server
  WiFi.begin(ssid,password);
  Serial.begin(115200);
  while(WiFi.status()!= WL_CONNECTED)
  {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("IP Addess (AP): "); Serial.println(WiFi.localIP());
  //Get a measurement from sensor
  volts = analogRead(A0)*3.3/1024;
  temperatureC = (volts - 0.5) * 100;
  Serial.print("Temperature C: "); Serial.println(temperatureC);
  // Connect to the server and send the data as a URL paramenter
  if(client.connect(host,80)){
    String url = "/update?value=";
    url += String(temperatureC);
    client.print(String("GET") + url + " HTTP/1.1\r\n" + host + "\r\n" + "Connection: keep-alive\r\n\r\n"); //URL header
    delay(10);
    //Read all lines of the response and print them to serial
    Serial.println("Response: ");
    while(client.available()){
      String line = client.readStringUntil('\r');
      Serial.print(line); 
    }
  }
  
  
  
}

void loop() {
  // put your main code here, to run repeatedly:

}
