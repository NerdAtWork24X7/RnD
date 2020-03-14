
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

char * ssid_ap = "ESP8266_SSID";
char * password_ap = "tenonezero";

IPAddress ip(192,168,11,4);
IPAddress gateway(192,168,11,1);
IPAddress subnet(255,255,255,0);

ESP8266WebServer server;

float sensor_value = 10.0;

void setup() {
  
  // put your setup code here, to run once:
  Serial.begin(115200);
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(ip,gateway,subnet);
  WiFi.softAP(ssid_ap,password_ap);

  Serial.println();
  Serial.print("IP Address: ");Serial.println(WiFi.localIP());

  server.on("/",handleIndex);
  server.on("/update",handleUpdate);
  server.begin();
}

void handleIndex()
{
  server.send(200,"text/plain",String(sensor_value));
}

void handleUpdate()
{
  sensor_value = server.arg("value").toFloat();
  Serial.println(sensor_value);
  server.send(200,"text/plain","Updated");
}

void loop() {
  // put your main code here, to run repeatedly:
server.handleClient();
}
