interface Cipher{
  
  public abstract String encrypt(String s, ControlP5 cp5, ArrayList<String> elements);
  public abstract String decrypt(String s, ControlP5 cp5, ArrayList<String> elements);
  
}
