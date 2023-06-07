import controlP5.*;

// array of identifiers for controlp5 stuff
final Cipher[] ciphers = { new HillCipher(), new Caesar(), new MorseCode() };
Cipher cipher=ciphers[0];
ControlP5 cp5;
color bgColor=#962832;
color buttonColor=#781726;
Textlabel theKey;

void setup() {
  size(1600, 800);
  background(bgColor);
  cp5 = new ControlP5(this);
  int textBoxSize=1000;
  cp5.addTextfield("textinput")
    .setFont(createFont("arial", 20))
    .setPosition(width/2-textBoxSize/2, 680)
    .setLabelVisible(false)
    .setSize(textBoxSize, 50)
    .setAutoClear(false)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    ;
  cp5.addTextfield("key")
    .setFont(createFont("arial", 30))
    .setPosition(width/2-700, height/2-100-100+20)
    .setColorForeground(bgColor)
    .setColorBackground(bgColor);
  cp5.addTextfield("Input")
    .setFont(createFont("arial", 30))
    .setPosition(width/2-49+15, 15)
    .setColorForeground(bgColor)
    .setColorBackground(bgColor)
    ;
  cp5.addTextfield("Output")
    .setFont(createFont("arial", 30))
    .setPosition(width/2-700+500+400, height/2-100-100+20)
    .setColorForeground(bgColor)
    .setColorBackground(bgColor)
    ;
  theKey = cp5.addTextlabel("ek")
    .setValue(((HillCipher)ciphers[0]).arrayToString(((HillCipher)ciphers[0]).defaultKey,6))
    .setPosition(width/2-700, height/2-100+20)
    .setColor(#FFFFFF)
    .setFont(createFont("Georgia", 30))
    ;
  cp5.addButton("encryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String encrypted = cipher.encrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(encrypted);
      println("encrypted: " + encrypted);
      theKey.setValue(((HillCipher)ciphers[0]).arrayToString(((HillCipher)ciphers[0]).defaultKey,6));
    }
  }
  )
  .setFont(createFont("Georgia", 20))
    .setSize(100, 50)
    .setPosition(width/2-100-50+10+10, height/2+200+10)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .setLabel("Encrypt");
  cp5.addButton("decryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String decrypted = cipher.decrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(decrypted);
      println("encrypted: " + decrypted);
      theKey.setValue(((HillCipher)ciphers[0]).arrayToString(((HillCipher)ciphers[0]).inverseDefaultKey,6));
    }
  }
  )
  .setFont(createFont("Georgia", 20))
    .setSize(100, 50)
    .setPosition(width/2+100-50-10-10, height/2+200+10)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .setLabel("Decrypt");
  cp5.addButton("newKeyButton")
    .setFont(createFont("Georgia", 20))
    .setPosition(100, 680)
    .setSize(105,45)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .setLabel("New Key")
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      ((HillCipher) ciphers[0]).randomKey(cp5);
      theKey.setValue(((HillCipher)ciphers[0]).arrayToString(((HillCipher)ciphers[0]).defaultKey,6));
    }
  }
  );
  String[] cs = new String[ciphers.length];
  for (int i = 0; i < ciphers.length; i++) {
    cs[i] = ciphers[i].toString();
  }
  cp5.addScrollableList("dropdown")
    .setPosition(50, 50)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .addItems(Arrays.asList(cs))
    .setOpen(false)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      
    }
  }
  );
  // TODO: callback handler to set which cipher is 'selected' (+ other options ex. font)
}

void draw() {
  // createMatrix(new int[][]{{}}, 0, 0);
  background(bgColor);
}

void dropdown(int index) {
  String x= cp5.get(ScrollableList.class, "dropdown").getItem(index).get("name").toString();
  for(int i=0;i<ciphers.length;i++){
    if(ciphers[i].toString().equals(x)){
      cipher=ciphers[i];
    }
  }
}
