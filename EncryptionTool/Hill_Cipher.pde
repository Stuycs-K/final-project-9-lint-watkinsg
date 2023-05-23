public static class Hill_Cipher{
  
  // A-Z 0-9 corresponds to 0-35
  //use ascii for easier conversion A==65 Z==90 0==48 9==57
  
  public int[][] encryptKey;
  public int[][] decryptKey;
  
  public static int[][] testingKey={{1,2},{2,3}};
  
  static int[][] minor(int[][] x, int a, int b){
    return new int[1][1];
  }
  
  static void cofactor(int[][] x, int a, int b, int[][] result){
    if(x.length>2){
      for(int i=0;i<x.length;i++){
        if(i!=a){
          for(int j=0;j<x[i].length;j++){
            if(j!=b){
              result[index]=x[i][j];
              index++;
            }
          }
        }
      }
      return result;
    }
    else{
      
    }
  }
  
  static void transpose(int[][] x){
    int[][] result=new int[x.length][x[0].length];
    for(int i=0;i<x.length;i++){
      for(int j=0;j<x[i].length;j++){
        result[i][j]=x[j][i];
      }
    }
    x=result;
  }
  
  static int[][] cofactor(int[][] x){
    int[][] cof=new int[x.length][x[0].length];
    for(int i=0;i<cof.length;i++){
      for(int j=0;j<cof[0].length;j++){
        cof[i][j]=minor(x, i, j);
      }
    }
    return cof;

    
  
  static void makingDecryptKey(){
    
  }
  
  static String encryt(String s){
    int[] input=stringToNum(s);
    int[] newInput=new int[input.length+input.length%testingKey.length];
    for(int i=0;i<testingKey.length;i++){
      int replace=0;
      for(int j=0;j<testingKey[i].length;j++){
        replace+=testingKey[i][j]*input[j];
      }
      newInput[i]=replace;
    }
    return numToString(newInput);
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
