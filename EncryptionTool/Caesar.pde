import java.util.Arrays;
import controlP5.*;

public class Caesar implements Cipher {
  
  Character[] alphabet={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' '};
  int rot;
  
  public Textlabel inputContent;
  public Textlabel inputLabel;
  public Textlabel outputContent;
  public Textlabel outputLabel;
  public Textlabel keyContent;
  public Textlabel keyLabel;
  public Textlabel[] textlabels={keyLabel, keyContent, inputLabel, inputContent, outputLabel, outputContent};
  public ControlP5 cp5;
  
  public Caesar(ControlP5 cp5){
    rot=13;
    this.cp5=cp5;
    keyLabel =  cp5.addTextlabel("keyLabel");
    textlabels[0]=keyLabel;
    keyContent =  cp5.addTextlabel("keyContent");
    textlabels[1]=keyContent;
    inputLabel=cp5.addTextlabel("inputLabel");
    textlabels[2]=inputLabel;
    outputLabel=cp5.addTextlabel("outputLabel");
    textlabels[3]=outputLabel;
    inputContent=cp5.addTextlabel("inputContent");
    textlabels[4]=inputContent;
    outputContent=cp5.addTextlabel("outputContent");
    textlabels[5]=outputContent;
  }
  
  public Caesar(int x, ControlP5 cp5){
    rot=x;
    this.cp5=cp5;
    keyLabel =  cp5.addTextlabel("keyLabel");
    textlabels[0]=keyLabel;
    keyContent =  cp5.addTextlabel("keyContent");
    textlabels[1]=keyContent;
    inputLabel=cp5.addTextlabel("inputLabel");
    textlabels[2]=inputLabel;
    outputLabel=cp5.addTextlabel("outputLabel");
    textlabels[3]=outputLabel;
    inputContent=cp5.addTextlabel("inputContent");
    textlabels[4]=inputContent;
    outputContent=cp5.addTextlabel("outputContent");
    textlabels[5]=outputContent;
  }
  
  public void showTextlabels(){
    keyLabel =  cp5.addTextlabel("keyLabel")
      //.setValue("KEY")
      //.setPosition(width/2-700, height/2-100-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    keyContent =  cp5.addTextlabel("keyContent")
      //.setValue(arrayToString(defaultKey,6))
      //.setPosition(width/2-700, height/2-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 30))
      ;
    inputLabel=cp5.addTextlabel("inputLabel")
      //.setValue("INPUT")
      //.setPosition(width/2-49+15, 15)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    outputLabel=cp5.addTextlabel("outputLabel")
      //.setValue("OUTPUT")
      //.setPosition(width/2-700+500+400, height/2-100-100+20)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    inputContent=cp5.addTextlabel("inputContent")
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
    outputContent=cp5.addTextlabel("OutputContent")
      .setColor(#FFFFFF)
      .setFont(createFont("Georgia", 20));
  }
  
  public String encrypt(String s, ControlP5 cp5){
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      System.out.println("b4: "+x[i]);
      if(x[i]!=alphabet.length-1){
        x[i]+=rot;
        if(x[i]>=alphabet.length-1){
          x[i]+=1;
          x[i]=x[i]%alphabet.length;
        }
      }
      System.out.println("after: "+x[i]);
      answer+=alphabet[x[i]];
    }
    return answer;
  }
  
  public String decrypt(String s, ControlP5 cp5){
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      System.out.println("b4: "+x[i]);
      if(x[i]!=alphabet.length-1){
        x[i]-=rot;
        if(x[i]<0){
          x[i]=alphabet.length+x[i]-1;
        }
      }
      System.out.println("after: "+x[i]);
      answer+=alphabet[x[i]];
    }
    return answer;
  }
  
  int[] stringToNum(String s) {
    int[] x=new int[s.length()];
    for (int i=0; i<x.length; i++) {
      int smt=s.charAt(i);
      if(smt<97||smt>122){
        smt=alphabet.length-1;
      }else{
        smt-=97;
      }
      x[i]=smt;
    }
    return x;
  }

  String numToString(int[] x) {
    String s="";
    for (int i=0; i<x.length; i++) {
      s+=alphabet[x[i]];
    }
    return s;
  }
  
  public String toString() {
    return "Caesar (rot"+" "+rot+")";
  }
  
  public void emptyTextlabels(){
    if(textlabels.length>0){
      for(int i=0;i<textlabels.length;i++){
        textlabels[i].setValue("");
      }
    }
  }
  
  public String textlabelsToString(){
    return Arrays.toString(textlabels);
  }
  
}
