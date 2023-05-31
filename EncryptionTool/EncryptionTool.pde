import controlP5.*;

// array of identifiers for controlp5 stuff
ControlP5 cp5;
final Cipher[] ciphers = { new HillCipher() };
void setup() {
  size(1600, 800);
  cp5 = new ControlP5(this);
  cp5.addTextfield("textinput")
    .setFont(createFont("arial", 20))
    .setPosition(50, 200)
    .setLabelVisible(false)
    .setSize(200, 50)
    .setAutoClear(false);
  cp5.addButton("encryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String encrypted = ciphers[0].encrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(encrypted);
      println("encrypted: " + encrypted);
    }
  }
  )
  .setFont(createFont("Georgia", 20))
    .setSize(100, 50)
    .setPosition(50, 300)
    .setLabel("Encrypt");
  cp5.addButton("decryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String decrypted = ciphers[0].decrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(decrypted);
      println("encrypted: " + decrypted);
    }
  }
  )
  .setFont(createFont("Georgia", 20))
    .setSize(100, 50)
    .setPosition(155, 300)
    .setLabel("Decrypt");
  cp5.addTextlabel("keydisplay")
    .setFont(createFont("Georgia", 20))
    .setSize(200, 200)
    .setPosition(102, 375)
    .setText("83 8 2\n3 6 9\n18 74 24");
  // .setText(keystring);
  ((HillCipher) ciphers[0]).randomKey(cp5);
  cp5.addButton("newKeyButton")
    .setFont(createFont("Georgia", 20))
    .setPosition(102, 425)
    .setLabel("New Key")
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      ((HillCipher) ciphers[0]).randomKey(cp5);
    }
  }
  );
  String[] cs = new String[ciphers.length];
  for (int i = 0; i < ciphers.length; i++) {
    cs[i] = ciphers[i].toString();
  }
  cp5.addScrollableList("dropdown")
    .setPosition(50, 500)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(Arrays.asList(cs));
  // TODO: callback handler to set which cipher is 'selected' (+ other options ex. font)
}
void draw() {
  // createMatrix(new int[][]{{}}, 0, 0);
}
// function to draw a 2d array as a matrix, params are int[][] arr, x, y and returns int width
static int createMatrix(int[][] m, int x, int y, ControlP5 cp5) {
  int currentDist = 0;
  int mostwidth = 0;
  // text label for opening ( (deal with size later)
  // loop by col first then row, if textWidth of the thing is larger than mostwidth then mostwidth = <it> (when drawing, draw at x+currentDist,y)
  // end of each col loop, add set px to currentDist (spacing)
  // draw final ")", add to currentDist
  // return currentDist
  return 0;
}
