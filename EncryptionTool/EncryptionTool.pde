import controlP5.*;

ControlP5 cp5;
color bgColor=#962832;
color buttonColor=#629b5e;

// array of identifiers for controlp5 stuff
Cipher[] ciphers;
Cipher cipher;
ArrayList<Textlabel> elements;
int DELAY=10;
Button newKeyButton;
boolean newKeyButtonDisplay=true;

void setup() {
  size(1600, 800);
  background(bgColor);
  cp5 = new ControlP5(this);
  ciphers = new Cipher[3];
  ciphers[0]=new HillCipher(cp5);
  ciphers[1]=new Caesar(cp5);
  ciphers[2]=new MorseCode(cp5);
  cipher=ciphers[0];
  cipher.showElements();
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
  cp5.addButton("encryptButton")
    .onPress(new CallbackListener() { // a callback function that will be called onPress
    public void controlEvent(CallbackEvent theEvent) {
      String name = theEvent.getController().getName();
      float value = theEvent.getController().getValue();
      println("got a press from a " + name + ", the value is " + value);
      String encrypted = cipher.encrypt(cp5.get(Textfield.class, "textinput").getText(), cp5);
      cp5.get(Textfield.class, "textinput").setText(encrypted);
      println("encrypted: " + encrypted);
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
    }
    }
    )
    .setFont(createFont("Georgia", 20))
    .setSize(100, 50)
    .setPosition(width/2+100-50-10-10, height/2+200+10)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .setLabel("Decrypt");
  newKeyButton = cp5.addButton("newKeyButton")
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
      if(cipher.extraToString().equals("Hill Cipher")){
        ((HillCipher)cipher).defaultKey=((HillCipher)cipher).randomKey();
        ((HillCipher)cipher).makeDecryptKey();
        cipher.showElements();
      }
      if(cipher.extraToString().equals("Caesar")){
        ((Caesar)cipher).rot=(((Caesar)cipher).rot+1)%26;
        if(((Caesar)cipher).rot==0){
          ((Caesar)cipher).rot=26;
        }
        ciphers[1]=new Caesar(((Caesar)cipher).rot,cp5);
        cipher=ciphers[1];
        cipher.showElements();
      }
    }
    }
    );
  String[] cs = new String[ciphers.length];
  for (int i = 0; i < ciphers.length; i++) {
    cs[i] = ciphers[i].toString();
  }
  cs[1]="Caesar";
  cp5.addScrollableList("dropdown")
    .setPosition(50, 50)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .setColorForeground(buttonColor)
    .setColorBackground(buttonColor)
    .addItems(Arrays.asList(cs))
    .setOpen(false)
    ;
  // TODO: callback handler to set which cipher is 'selected' (+ other options ex. font)
}

void draw() {
  background(bgColor);
  hideButton();
}

void hideButton(){
  if(newKeyButtonDisplay==false){
    newKeyButton.hide();
  }else{
    newKeyButton.show();
  }
}

void dropdown(int index) {
  String x= cp5.get(ScrollableList.class, "dropdown").getItem(index).get("name").toString();
  for(int i=0;i<ciphers.length;i++){
    if(ciphers[i].extraToString().substring(0,6).equals(x.substring(0,6))){
      cipher=ciphers[i];
      cipher.showElements();
      if(cipher.extraToString().equals("Morse Code")){
        newKeyButtonDisplay=false;
      }else{
        newKeyButtonDisplay=true;
      }
    }
  }
}
