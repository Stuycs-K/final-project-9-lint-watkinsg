import java.util.*;

public static class Hill_Cipher{
  
  public static char[] alphabet;
  
  public float[][] encryptKey;
  public float[][] decryptKey;
  
  public static float[][] defaultKey={{1,2},{2,3}};
  public static float[][] inverseDefaultKey;
  
  
  static float[][] minor(float[][] x, float a, float b){
    float[][] m=new float[x.length-1][x[0].length-1];
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
  
  static float determinent(float[][] x){
    if(x.length<=2){
      return x[0][0]*x[1][1]-x[0][1]*x[1][0];
    } else {
      float d=0;
      for(int i=0;i<x.length;i++){
        d+=x[0][i]*determinent(minor(x,0,i));
      }
      return d;
    }
  }
  
  static float[][] cofactor(float[][] x){
    float[][] result=new float[x.length][x[0].length];
    if(x.length>2){
      for(int i=0;i<x.length;i++){
        for(int j=0;j<x[0].length;j++){
          result[i][j]=determinent(minor(x, i, j))*(float)Math.pow(-1,i+j);
        }
      }
    } else {
      for(int i=0;i<x.length;i++){
        for(int j=0;j<x[0].length;j++){
          result[i][j]=x[(i+1)%2][(j+1)%2]*(float)Math.pow(-1,i+j);
        }
      }
    }
    return result;
  }
  
  static float[][] transpose(float[][] x){
    float[][] result=new float[x.length][x[0].length];
    for(int i=0;i<x.length;i++){
      for(int j=0;j<x[i].length;j++){
        result[i][j]=x[j][i];
      }
    }
    return result;
  }

  static void makeDecryptKey(){
    float d = 1/determinent(defaultKey);
    System.out.println("d: "+d);
    System.out.println(determinent(defaultKey));
    inverseDefaultKey=transpose(cofactor(defaultKey));
    System.out.println("transpose: ");
    for(int i=0;i<defaultKey.length;i++){
     System.out.println(Arrays.toString(inverseDefaultKey[i]));
    }
    for(int i=0;i<defaultKey.length;i++){
      for(int j=0;j<defaultKey[0].length;j++){
        inverseDefaultKey[i][j]*=d;
      }
    }
  }
  
  static String encryt(String s){
    float[] input=stringToNum(s);
    float[] newInput=new float[input.length+input.length%defaultKey.length];
    for(int i=0;i<defaultKey.length;i++){
      float replace=0;
      for(int j=0;j<defaultKey[i].length;j++){
        replace+=defaultKey[i][j]*input[j];
      }
      newInput[i]=replace;
    }
    return numToString(newInput);
  }
  
  static String decrypt(String s){
    System.out.println("s: "+s);
    float[] input=stringToNum(s);
    System.out.println("Input");
    System.out.println(Arrays.toString(input));
    System.out.println(numToString(input));
    float[] newInput=new float[input.length+input.length%defaultKey.length];
    for(int i=0;i<defaultKey.length;i++){
      float replace=0;
      for(int j=0;j<defaultKey[i].length;j++){
        replace+=inverseDefaultKey[i][j]*input[j];
      }
      System.out.println("replace: "+replace);
      newInput[i]=replace;
    }
    System.out.println("newInput");
    System.out.println(Arrays.toString(newInput));
    System.out.println(numToString(newInput));
    return numToString(newInput);
  }
  
  static float[] stringToNum(String s){
    String alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    alphabet=alpha.toCharArray();
    float[] x=new float[s.length()];
    for(int i=0;i<x.length;i++){
      int smt=s.charAt(i);
      System.out.println("smt b4: "+smt);
      if(smt<58){
        smt=smt%48+52;
      } else if(smt<91){
        smt=smt%65+26;
      } else {
        smt=smt%97;
      }
      //System.out.println("smt after: "+smt);
      x[i]=smt;
    }
    System.out.println("final x[i]: "+Arrays.toString(x));
    return x;
  }
  
  static String numToString(float[] x){
    String alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    alphabet=alpha.toCharArray();
    String s="";
    //System.out.println(Arrays.toString(alphabet));
    for(int i=0;i<x.length;i++){
      //System.out.println((int)(x[i]%alphabet.length));
      //System.out.println("x[i]: "+x[i]);
      s+=alphabet[(int)x[i]];
    }
    //for(int i=0;i<x.length;i++){
    //  System.out.println(x[i]);
    //}
    return s;
  }
  
}
