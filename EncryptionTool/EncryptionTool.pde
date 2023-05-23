import java.util.*;

void setup() {
    size(800,800);
    Hill_Cipher.makeDecryptKey();
    fill(0);
    text(Arrays.toString(Hill_Cipher.inverseTestingKey[0]), 100.0, 100.0);
  }
  void draw() {
  }
