public static class Hill_Cipher{
  
  // A-Z 0-9 corresponds to 0-35
  //use ascii for easier conversion A==65 Z==90 0==48 9==57
  
  public int[][] encryptKey;
  public int[][] decryptKey;
  
  public int[][] testingKey={{1,2},{2,3}};
  
  static String encryt(String s){
    
    return "";
  }
  
  static String decrypt(String s){
    return "";
  }
  
  static int[] stringToNum(String s){
    int[] x=new int[s.length()];
    for(int i=0;i<x.length;i++){
      x[i]=s.charAt(i);
    }
    return x;
  }
  
  static String numToString(int[] x){
    String s="";
    for(int i=0;i<x.length;i++){
      s+=char(x[i]);
    }
    return s;
  }
  
}
