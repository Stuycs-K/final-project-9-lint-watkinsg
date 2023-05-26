import java.util.*;
import controlP5.*;

// array of identifiers for controlp5 stuff
ArrayList<String> elements = new ArrayList<>();
final Cipher[] ciphers = { new HillCipher() };
ControlP5 cp5;
void setup() {
  size(1600,800);
  cp5 = new ControlP5(this);
  cp5.addButton("encryptButton");
  elements.add("encryptButton");
}
void draw() {
    Controller c = cp5.getController(elements.get(0));
    // println(c.getValue());
}
void encryptButton(int val) {
  print(val);
}
