import controlP5.*;

// array of identifiers for controlp5 stuff
final Cipher[] ciphers = { new HillCipher() };
ControlP5 cp5;
void setup() {
  size(1600,800);
  cp5 = new ControlP5(this);
  cp5.addTextfield("textinput")
  .setFont(createFont("arial",20))
  .setPosition(50,200)
  .setLabelVisible(false)
  .setSize(200,50);
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
    })
    .setFont(createFont("Georgia",20))
    .setSize(100,50)
    .setPosition(50,300)
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
    })
    .setFont(createFont("Georgia",20))
    .setSize(100,50)
    .setPosition(155,300)
    .setLabel("Decrypt");
}
void draw() {
}
