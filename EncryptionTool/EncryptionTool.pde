import controlP5.*;

// array of identifiers for controlp5 stuff
final Cipher[] ciphers = { new HillCipher() };
ControlP5 cp5;
void setup() {
  printArray(PFont.list());
  size(1600, 800);
  background(245,208,208);
  cp5 = new ControlP5(this);
  int textBoxSize=1000;
  cp5.addTextfield("textinput")
    .setFont(createFont("arial", 20))
    .setPosition(width/2-textBoxSize/2, 680)
    .setLabelVisible(false)
    .setSize(textBoxSize, 50)
    .setAutoClear(false)
    .setColorForeground(color(140,201,157))
    .setColorBackground(color(140,201,157));
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
    .setPosition(width/2-100-50+10+10, height/2+200+10)
    .setColorForeground(color(140,201,157))
    .setColorBackground(color(140,201,157))
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
    .setPosition(width/2+100-50-10-10, height/2+200+10)
    .setColorForeground(color(140,201,157))
    .setColorBackground(color(140,201,157))
    .setLabel("Decrypt");
  String[] cs = new String[ciphers.length];
  for (int i = 0; i < ciphers.length; i++) {
    cs[i] = ciphers[i].toString();
  }
  cp5.addScrollableList("dropdown")
    .setPosition(50, 50)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .setColorForeground(color(140,201,157))
    .setColorBackground(color(140,201,157))
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
  
