public static class Hill_Cipher{
  
  // A-Z 0-9 corresponds to 0-35
  //use ascii for easier conversion A==65 Z==90 0==48 9==57
  
  public int[][] encryptKey;
  public int[][] decryptKey;
  
  public static int[][] testingKey={{1,2},{2,3}};
  public static int[][] inverseTestingKey;
  
  public static void main(String[] args){
    makeDecryptKey();
    System.out.println(inverseTestingKey);
  }
  
  static int[][] minor(int[][] x, int a, int b){
    int[][] m=new int[x.length-1][x[0].length-1];
    int row=0;
    int col=0;
    for(int i=0;i<x.length;i++){
      if(i!=a){
        for(int j=0;j<x[i].length;j++){
          if(j!=b){
            m[row][col]=x[i][j];
            col++;
            if(col==m[0].length){
              row++;
              col=0;
            }
          }
        }
      }
    }
    return m;
  }
  
  static int determinent(int[][] x){
    if(x.length<=2){
      return x[0][0]*x[1][1]-x[0][1]*x[1][0];
    } else {
      int d=0;
      for(int i=0;i<x.length;i++){
        d+=x[0][i]*determinent(minor(x,0,i));
      }
      return d;
    }
  }
  
  static int[][] cofactor(int[][] x){
    int[][] result=new int[x.length][x[0].length];
    if(x.length>2){
      for(int i=0;i<x.length;i++){
        for(int j=0;j<x[0].length;j++){
          result[i][j]=determinent(minor(x, i, j))*(int)Math.pow(-1,i+j);
        }
      }
    } else {
      for(int i=0;i<x.length;i++){
        for(int j=0;j<x[0].length;j++){
          result[i][j]=x[(i+1)%2][(j+1)%2]*(int)Math.pow(-1,i+j);
        }
      }
    }
    return result;
  }
  
  static int[][] transpose(int[][] x){
    int[][] result=new int[x.length][x[0].length];
    for(int i=0;i<x.length;i++){
      for(int j=0;j<x[i].length;j++){
        result[i][j]=x[j][i];
      }
    }
    return result;
  }

  static void makeDecryptKey(){
    int d = 1/determinent(testingKey);
    inverseTestingKey=transpose(testingKey);
    for(int i=0;i<testingKey.length;i++){
      for(int j=0;j<testingKey[0].length;j++){
        inverseTestingKey[i][j]*=d;
      }
    }
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
    int[] input=stringToNum(s);
    int[] newInput=new int[input.length+input.length%testingKey.length];
    for(int i=0;i<testingKey.length;i++){
      int replace=0;
      for(int j=0;j<testingKey[i].length;j++){
        replace+=inverseTestingKey[i][j]*input[j];
      }
      newInput[i]=replace;
    }
    return numToString(newInput);
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
