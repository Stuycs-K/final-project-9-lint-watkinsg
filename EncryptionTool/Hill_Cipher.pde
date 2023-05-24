import java.util.*;

public static class Hill_Cipher{
  
  public static char[] alphabet;
  
  public float[][] encryptKey;
  public float[][] decryptKey;
  
  public static float[][] defaultKey={{5,3},{4,3}};
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

  static String encrypt(String s){
    float[][] input=stringToNum(s);
    float[][] newInput=new float[input.length][input[0].length];
    for(int i=0;i<defaultKey.length;i++){
      for(int j=0;j<defaultKey[i].length;j++){
        int replace=0;
        for(int k=0;k<defaultKey.length;k++){
          replace+=defaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
      }
    }
    return numToString(newInput);
  }
  
  //a b c       m n o x             am   
  //e f g       q r s y             bq
  //i j k       u v w z             cu
        
              
  static String decrypt(String s){
    float[][] input=stringToNum(s);
    float[][] newInput=new float[input.length][input[0].length];
    for(int i=0;i<inverseDefaultKey.length;i++){
      for(int j=0;j<inverseDefaultKey[i].length;j++){
        int replace=0;
        for(int k=0;k<defaultKey.length;k++){
          replace+=inverseDefaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
      }
    }
    return numToString(newInput);
  }
  
  static float[][] stringToNum(String s){
    String alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
    alphabet=alpha.toCharArray();
    float[][] x=new float[defaultKey.length][ceil(s.length()/defaultKey.length)];
    for(int i=0;i<x[0].length;i++){
      for(int j=0;j<x.length;j++){
        int smt=s.charAt(i*x.length+j);
        System.out.println("smt b4: "+smt);
        if(smt==32){
          smt=alphabet.length-1;
        } else if (smt<58){
          smt=smt%48+26;
        } else if(smt<91){
          smt=smt%65;
        //} else {
        //  smt=smt%97;
        }
        System.out.println("smt after: "+smt);
        x[j][i]=smt;
      }
    }
    //System.out.println("final x[i]: "+Arrays.toString(x));
    System.out.println("x stn");
    System.out.println(Arrays.toString(x[0]));
    System.out.println(Arrays.toString(x[1]));
    return x;
  }
  
  static String numToString(float[][] x){
    String alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
    alphabet=alpha.toCharArray();
    String s="";
    //System.out.println(Arrays.toString(alphabet));
    //System.out.println("x nts");
    //System.out.println(Arrays.toString(x[0]));
    //System.out.println(Arrays.toString(x[1]));
    for(int i=0;i<x[0].length;i++){
      for(int j=0;j<x.length;j++){
        //System.out.println((int)(x[i]%alphabet.length));
        //System.out.println("x[i]: "+x[i]);
        float y=x[j][i];
        while(y<0){
          y+=alphabet.length;
        }
        //System.out.println((y%alphabet.length));
        //System.out.println(alphabet[(int)(y%alphabet.length)]);
        s+=alphabet[(int)(y%alphabet.length)];
      }
    }
    //for(int i=0;i<x.length;i++){
    //  System.out.println(x[i]);
    //}
    System.out.println("x nts");
    System.out.println(Arrays.toString(x[0]));
    System.out.println(Arrays.toString(x[1]));
    return s;
  }
  
}
