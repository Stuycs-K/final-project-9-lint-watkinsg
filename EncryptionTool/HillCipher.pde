import java.util.*;

public class HillCipher implements Cipher {
  
  public float[][] encryptKey0={{1,2},{3,4}};
  public float[][] encryptKey1={{2,3},{2,2}};
  public float[][] encryptKey2={{1,2},{3,4}};
  public float[][] encryptKey3={{4,3},{3,2}};
  public float[][] encryptKey4={{7,5,6},{3,8,2},{6,6,5}};
  public float[][] encryptKey5={{1,0,5},{2,1,6},{3,4,0}};

  public float[][] defaultKey=encryptKey5;
  public float[][] inverseDefaultKey;
  public String alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
  public char[] alphabet=alpha.toCharArray();
  
  public HillCipher() {
    makeDecryptKey();
    randomKey(cp5);
  }
  
  void randomKey(ControlP5 cp5){
    float[][] x=new float[2][2];
    boolean b=true;
    while(b){
      x[0][0]=round(random(100));
      x[0][1]=round(random(100));
      x[1][0]=round(random(100));
      x[1][1]=round(random(100));
      float huh=x[0][0]*x[1][1]-x[0][1]*x[1][0];
      if(huh==0)
        break;
      boolean doomedEssay=true;
      int keepCount=1;
      if(huh<0){
        huh*=-1;
      }
      while(huh*keepCount%alphabet.length!=1){
        keepCount++;
        if(keepCount>100){
          doomedEssay=false;
          break;
        }
      }
      if(doomedEssay){
        b=false;
      }
    }
    defaultKey=x;
    makeDecryptKey();
    //cp5.addTextlabel("user input translated to numbers")
    //      .setText(x)
    //      .setPosition(100, 50)
    //      .setColorValue(0xffffff00)
    //      .setFont(createFont("Georgia", 20))
    //      ;
    //cp5.addTextlabel("user input translated to numbers")
    //      .setText(inverseDefaultKey)
    //      .setPosition(100, 50)
    //      .setColorValue(0xffffff00)
    //      .setFont(createFont("Georgia", 20))
    //      ;
  }
  
  float[][] minor(float[][] x, float a, float b) {
    float[][] m=new float[x.length-1][x[0].length-1];
    int row=0;
    int col=0;
    for (int i=0; i<x.length; i++) {
      if (i!=a) {
        for (int j=0; j<x[i].length; j++) {
          if (j!=b) {
            m[row][col]=x[i][j];
            col++;
            if (col==m[0].length) {
              row++;
              col=0;
            }
          }
        }
      }
    }
    return m;
  }

  float determinent(float[][] x) {
    if (x.length<=2) {
      return x[0][0]*x[1][1]-x[0][1]*x[1][0];
    } else {
      float d=0;
      for (int i=0; i<x.length; i++) {
        d+=x[0][i]*determinent(minor(x, 0, i));
      }
      return d;
    }
  }

  float[][] cofactor(float[][] x) {
    float[][] result=new float[x.length][x[0].length];
    if (x.length>2) {
      for (int i=0; i<x.length; i++) {
        for (int j=0; j<x[0].length; j++) {
          result[i][j]=determinent(minor(x, i, j))*(float)Math.pow(-1, i+j);
        }
      }
    } else {
      for (int i=0; i<x.length; i++) {
        for (int j=0; j<x[0].length; j++) {
          result[i][j]=x[(i+1)%2][(j+1)%2]*(float)Math.pow(-1, i+j);
        }
      }
    }
    return result;
  }

  float[][] transpose(float[][] x) {
    float[][] result=new float[x.length][x[0].length];
    for (int i=0; i<x.length; i++) {
      for (int j=0; j<x[i].length; j++) {
        result[i][j]=x[j][i];
      }
    }
    return result;
  }

  float[][] mod(float[][]x) {
    for (int i=0; i<x.length; i++) {
      for (int j=0; j<x[0].length; j++) {
        x[i][j]=mod(x[i][j]);
      }
    }
    return x;
  }

  float mod(float x) {
    while (x<0) {
      x+=alphabet.length;
    }
    //System.out.println("x:   "+x%alphabet.length);
    return x%alphabet.length;
  }

  void makeDecryptKey() {
    //System.out.println("testing");
    //System.out.println(alphabet.length);
    System.out.println("makeDecryptKey");
    float d = determinent(defaultKey);
    boolean b=false;
    if (d<0) {
      d*=-1;
      b=true;
    }
    System.out.println("d: "+d);
    int igiveup=0;
    while ((d*igiveup)%alphabet.length!=1) {
      igiveup++;
      if (igiveup<5)
        System.out.println(igiveup);
      if (igiveup>100) {
        System.out.println("key noninvertible mod "+alphabet.length);
        break;
      }
    }
    if (b) {
      igiveup*=-1;
    }
    System.out.println("makeDecryptKey");
    d=igiveup;
    System.out.println("d: "+d);
    inverseDefaultKey=transpose(cofactor(defaultKey));
    System.out.println("transpose: ");
    for (int i=0; i<defaultKey.length; i++) {
      System.out.println(Arrays.toString(inverseDefaultKey[i]));
    }
    //mod(inverseDefaultKey);
    if (defaultKey.length<=2) {
      for (int i=0; i<defaultKey.length; i++) {
        for (int j=0; j<defaultKey[0].length; j++) {
          inverseDefaultKey[i][j]*=d;
        }
      }
    }
    inverseDefaultKey=mod(inverseDefaultKey);
  }

  String encrypt(String s, ControlP5 cp5) {
    System.out.println("encrypt");
    cp5.addTextlabel("user input")
      .setText(s)
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(createFont("Georgia", 20))
      ;
    for (int i=0; i<defaultKey[0].length; i++) {
      for (int j=0; j<defaultKey.length; j++) {
        cp5.addTextlabel("key")
          .setText(defaultKey[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    float[][] input=stringToNum(s);
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<input.length; j++) {
        cp5.addTextlabel("user input translated to numbers")
          .setText(input[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    float[][] newInput=new float[input.length][input[0].length];
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<defaultKey[0].length; j++) {
        int replace=0;
        for (int k=0; k<defaultKey.length; k++) {
          replace+=defaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
        cp5.addTextlabel("input after change")
          .setText(newInput[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    System.out.println("newInput");
    for (int i=0; i<newInput.length; i++) {
      System.out.println(Arrays.toString(newInput[i]));
    }
    String ihatelife=numToString(newInput);
    cp5.addTextlabel("new number converted to text")
      .setText(ihatelife)
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(createFont("Georgia", 20))
      ;
    return ihatelife;
  }


  //a b c       m n o x             am
  //e f g       q r s y             bq
  //i j k       u v w z             cu


  String decrypt(String s, ControlP5 cp5) {
    float[][] input=stringToNum(s);
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<input.length; j++) {
        cp5.addTextlabel("user input translated to numbers")
          .setText(input[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    for (int i=0; i<inverseDefaultKey[0].length; i++) {
      for (int j=0; j<inverseDefaultKey.length; j++) {
        cp5.addTextlabel("key")
          .setText(inverseDefaultKey[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    float[][] newInput=new float[input.length][input[0].length];
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<inverseDefaultKey[0].length; j++) {
        int replace=0;
        for (int k=0; k<defaultKey.length; k++) {
          replace+=inverseDefaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
        cp5.addTextlabel("input after change")
          .setText(newInput[j][i]+"")
          .setPosition(100, 50)
          .setColorValue(0xffffff00)
          .setFont(createFont("Georgia", 20))
          ;
      }
    }
    String ihatelife=numToString(newInput);
    cp5.addTextlabel("new number converted to text")
      .setText(ihatelife)
      .setPosition(100, 50)
      .setColorValue(0xffffff00)
      .setFont(createFont("Georgia", 20))
      ;
    return ihatelife;
  }

  float[][] stringToNum(String s) {
    float[][] x=new float[defaultKey.length][ceil(float(s.length())/defaultKey.length)];
    //System.out.println(x[0].length);
    while (s.length()%defaultKey.length!=0) {
      s+=" ";
    }
    System.out.println(s);
    System.out.println(x.length+" "+x[0].length);
    for (int i=0; i<x[0].length; i++) {
      for (int j=0; j<x.length; j++) {
        int smt=0;
        smt=s.charAt(i*x.length+j);

        //System.out.println("smt b4: "+smt);

        //smt=smt%65;

        if (smt==32) {
          smt=alphabet.length-1;
        } else if (smt<58) {
          smt=smt%48+52;
        } else if (smt<91) {
          smt=smt%65+26;
        } else {
          smt=smt%97;
        }

        //System.out.println("smt after: "+smt);
        x[j][i]=smt;
      }
    }
    //System.out.println("final x[i]: "+Arrays.toString(x));
    System.out.println("x stn");
    for (int i=0; i<x.length; i++) {
      System.out.println(Arrays.toString(x[i]));
    }
    return x;
  }

  String numToString(float[][] x) {
    String s="";
    x=mod(x);
    //System.out.println(Arrays.toString(alphabet));
    //System.out.println("x nts");
    //System.out.println(Arrays.toString(x[0]));
    //System.out.println(Arrays.toString(x[1]));
    for (int i=0; i<x[0].length; i++) {
      for (int j=0; j<x.length; j++) {
        //System.out.println((int)(x[i]%alphabet.length));
        //System.out.println("x[i]: "+x[i]);
        float y=x[j][i];
        while (y<0) {
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
    for (int i=0; i<x.length; i++) {
      System.out.println(Arrays.toString(x[i]));
    }
    return s;
  }
  String toString() {
    return "Hill Cipher";
  }
}
