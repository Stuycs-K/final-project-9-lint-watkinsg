import java.util.*;
import controlP5.*;

// array of identifiers for controlp5 stuff
String[] elements = {};
final Cipher[] ciphers = { new HillCipher() };
ControlP5 cp5;
void setup() {
  size(1600,800);
  cp5 = new ControlP5(this);
}
void draw() {
    cp5.addButton("encryptButton");
}
