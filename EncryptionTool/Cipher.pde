interface Cipher {

  public String encrypt(String s, ControlP5 cp5);
  public String decrypt(String s, ControlP5 cp5);
  public String toString();
  public void emptyTextlabels();
  public void showTextlabels();
  public String textlabelsToString();
  
}
