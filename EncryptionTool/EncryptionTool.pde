import java.util.*;
import controlP5.*;

// array of identifiers for controlp5 stuff
ArrayList<String> elements = new ArrayList<>();
final Cipher[] ciphers = { new HillCipher() };
ControlP5 cp5;
void setup() {
  size(1600,800);
  cp5 = new ControlP5(this);
  cp5.addButton("encryptButton")
      .onPress(new CallbackListener() { // a callback function that will be called onPress
      public void controlEvent(CallbackEvent theEvent) {
        String name = theEvent.getController().getName();
        float value = theEvent.getController().getValue();
        println("got a press from a " + name + ", the value is " + value);
      }
    });
  elements.add("encryptButton");
}
void draw() {
    Controller c = cp5.getController(elements.get(0));
    //print(c.getInfo());
    // println(c.getValue());
}
