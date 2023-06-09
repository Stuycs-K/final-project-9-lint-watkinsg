import controlP5.*;

ControlP5 cp5;
color bgColor=#962832;
color buttonColor=#629b5e;

// array of identifiers for controlp5 stuff
Cipher[] ciphers;
Cipher cipher;

void setup() {
  size(1600, 800);
  background(bgColor);
  cp5 = new ControlP5(this);
  ciphers = new Cipher[3];
  ciphers[0]=new HillCipher(cp5);
  ciphers[1]=new Caesar(cp5);
  ciphers[2]=new MorseCode(cp5);
  cipher=ciphers[0];
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
  cp5.addButton("encryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String encrypted = cipher.encrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(encrypted);
      println("encrypted: " + encrypted);
      if(cipher.toString().equals("HillCipher")){
        ((HillCipher)cipher).theKey.setValue(((HillCipher)cipher).arrayToString(((HillCipher)cipher).defaultKey,6));
      }
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
      if(cipher.toString().equals("HillCipher")){
        ((HillCipher)cipher).theKey.setValue(((HillCipher)cipher).arrayToString(((HillCipher)cipher).inverseDefaultKey,6));
      }
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
      if(cipher.toString().equals("HillCipher")){
        ((HillCipher)cipher).theKey.setValue(((HillCipher)ciphers[0]).arrayToString(((HillCipher)ciphers[0]).defaultKey,6));
      }
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
