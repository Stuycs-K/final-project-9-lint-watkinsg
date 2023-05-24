import java.util.*;

void setup() {
    size(800,800);
    Hill_Cipher.makeDecryptKey();
    fill(0);
    textSize(80);
    text(Arrays.toString(Hill_Cipher.inverseDefaultKey[0]), 200.0, 200.0);
    text(Arrays.toString(Hill_Cipher.inverseDefaultKey[1]), 200.0, 300.0);
    //text(Hill_Cipher.encrypt("UR MOM"), 200.0, 400.0);
    //text(Hill_Cipher.decrypt("RRX8AA"), 200.0, 500.0);
  }
  void draw() {
  }
