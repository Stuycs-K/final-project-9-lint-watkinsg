import java.util.Arrays;
import controlP5.*;

public class HillCipher implements Cipher {

  public float[][] encryptKey0={{1, 2}, {3, 4}};
  public float[][] encryptKey1={{2, 3}, {2, 2}};
  public float[][] encryptKey2={{1, 2}, {3, 4}};
  public float[][] encryptKey3={{4, 3}, {3, 2}};
  public float[][] encryptKey4={{7, 5, 6}, {3, 8, 2}, {6, 6, 5}};
  public float[][] encryptKey5={{1, 0, 5}, {2, 1, 6}, {3, 4, 0}};

  public float[][] defaultKey=encryptKey5;
  public float[][] inverseDefaultKey;
  public String alpha=" !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
  public char[] alphabet=alpha.toCharArray();
  
  public ControlP5 cp5;

  public HillCipher(ControlP5 cp5) {
    makeDecryptKey();
    this.cp5 = cp5;
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("HCkeyLabel"));
    elements.add(cp5.addTextlabel("HCkeyContent"));
    elements.add(cp5.addTextlabel("HCinputLabel"));
    elements.add(cp5.addTextlabel("HCoutputLabel"));
    elements.add(cp5.addTextlabel("HCinputContent"));
    elements.add(cp5.addTextlabel("HCoutputContent"));
  }
  
  public HillCipher(float[][] newKey, ControlP5 cp5){
    defaultKey=newKey;
    makeDecryptKey();
    this.cp5=cp5;
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("HCkeyLabel"));
    elements.add(cp5.addTextlabel("HCkeyContent"));
    elements.add(cp5.addTextlabel("HCinputLabel"));
    elements.add(cp5.addTextlabel("HCoutputLabel"));
    elements.add(cp5.addTextlabel("HCinputContent"));
    elements.add(cp5.addTextlabel("HCoutputContent"));
  }
  
  public void showElements(){
    for(int i=0;i<elements.size();i++){
      elements.get(i).setValue("");
    }
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("HCkeyLabel"));
    elements.add(cp5.addTextlabel("HCkeyContent"));
    elements.add(cp5.addTextlabel("HCinputLabel"));
    elements.add(cp5.addTextlabel("HCoutputLabel"));
    elements.add(cp5.addTextlabel("HCinputContent"));
    elements.add(cp5.addTextlabel("HCoutputContent"));
    elements.get(0)
      .setValue("KEY")
      .setPosition(width/2-700, height/2-100-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    elements.get(1)
      .setValue(arrayToString(defaultKey,6))
      .setPosition(width/2-700, height/2-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 30))
      ;
    elements.get(2)
      .setValue("INPUT")
      .setPosition(width/2-49+15, 15)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    elements.get(3)
      .setValue("OUTPUT")
      .setPosition(width/2-700+500+400, height/2-100-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    elements.get(4)
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
    elements.get(5)
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
  }
  
  String arrayToString(float[][] x, int space){
    String name="";
    for(int i=0;i<x.length;i++){
      for(int j=0;j<x[i].length;j++){
        int huh=space;
        if(x[i][j]<10){
          huh++;
          huh++;
        }
        name+=(int)x[i][j]+spaces(huh);
      }
      name+="\n\n";
    }
    return name;
  }
  
  String spaces(int x){
    String space="";
    for(int i=0;i<x;i++){
      space+=" ";
    }
    return space;
  }

  float[][] randomKey() {
    float[][] x=new float[2][2];
    boolean b=true;
    while (b) {
      x[0][0]=round(random(100));
      x[0][1]=round(random(100));
      x[1][0]=round(random(100));
      x[1][1]=round(random(100));
      float huh=x[0][0]*x[1][1]-x[0][1]*x[1][0];
      if (huh==0)
        break;
      boolean doomedEssay=true;
      int keepCount=1;
      if (huh<0) {
        huh*=-1;
      }
      while (huh*keepCount%alphabet.length!=1) {
        keepCount++;
        if (keepCount>100) {
          doomedEssay=false;
          break;
        }
      }
      if (doomedEssay) {
        b=false;
      }
    }
    return x;
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
    return x%alphabet.length;
  }

  void makeDecryptKey() {
    float d = determinent(defaultKey);
    boolean b=false;
    if (d<0) {
      d*=-1;
      b=true;
    }
    int igiveup=0;
    while ((d*igiveup)%alphabet.length!=1) {
      igiveup++;
      if (igiveup<5)
      if (igiveup>100) {
        break;
      }
    }
    if (b) {
      igiveup*=-1;
    }
    d=igiveup;
    inverseDefaultKey=transpose(cofactor(defaultKey));
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
    
    float[][] input=stringToNum(s);
    
    elements.get(1)
      .setValue(arrayToString(defaultKey,6));
      
    int position=width/2-(int)(7.55*(arrayToString(input,2).length()/(defaultKey.length+(defaultKey.length-1)*2)));

    elements.get(4)
      .setValue(arrayToString(input,2))
      .setPosition(position+20, 15+80)
      ;

    float[][] newInput=new float[input.length][input[0].length];
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<defaultKey[0].length; j++) {
        int replace=0;
        for (int k=0; k<defaultKey.length; k++) {
          replace+=defaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
      }
    }
    newInput=mod(newInput);
 
    elements.get(5)
      .setValue(arrayToString(newInput,2))
      .setPosition(width/2-700+500+400, height/2-100+20)
      ;
      
    String ihatelife=numToString(newInput);
    return ihatelife;
  }


  //a b c       m n o x             am
  //e f g       q r s y             bq
  //i j k       u v w z             cu


  String decrypt(String s, ControlP5 cp5) {
    float[][] input=stringToNum(s);
    
    elements.get(1)
      .setValue(arrayToString(inverseDefaultKey,6));
    
    int position=width/2-(int)(7.55*(arrayToString(input,2).length()/(defaultKey.length+(defaultKey.length-1)*2)));

    elements.get(4)
      .setValue(arrayToString(input,2))
      .setPosition(position+25, 15+80);
        
    float[][] newInput=new float[input.length][input[0].length];
    for (int i=0; i<input[0].length; i++) {
      for (int j=0; j<inverseDefaultKey[0].length; j++) {
        int replace=0;
        for (int k=0; k<defaultKey.length; k++) {
          replace+=inverseDefaultKey[j][k]*input[k][i];
        }
        newInput[j][i]=replace;
      }
    }
    newInput=mod(newInput);
    
    elements.get(5)
      .setValue(arrayToString(newInput,2))
      .setPosition(width/2-700+500+400, height/2-100+20);
      
    String ihatelife=numToString(newInput);
    return ihatelife;
  }

  float[][] stringToNum(String s) {
    float[][] x=new float[defaultKey.length][ceil(float(s.length())/defaultKey.length)];
    while (s.length()%defaultKey.length!=0) {
      s+=" ";
    }
    for (int i=0; i<x[0].length; i++) {
      for (int j=0; j<x.length; j++) {
        int smt=s.charAt(i*x.length+j);

        smt-=32;

        x[j][i]=smt;
      }
    }
    return x;
  }

  String numToString(float[][] x) {
    String s="";
    x=mod(x);
    for (int i=0; i<x[0].length; i++) {
      for (int j=0; j<x.length; j++) {
        float y=x[j][i];
        while (y<0) {
          y+=alphabet.length;
        }
        s+=alphabet[(int)(y%alphabet.length)];
      }
    }
    return s;
  }
  String toString() {
    return "Hill Cipher";
  }
  
  public String extraToString() {
    return "Hill Cipher";
  }
  
}
