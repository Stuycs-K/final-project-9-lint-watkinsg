import java.util.Arrays;
import controlP5.*;

public class Caesar implements Cipher {
  
  Character[] alphabet={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
  Character[] alphabetROT={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
  int rot;
  
  public ControlP5 cp5;
  
  public Caesar(ControlP5 cp5){
    rot=13;
    this.cp5=cp5;
    elements=new ArrayList<Textlabel>();
    for(int i=0;i<rot;i++){
      rot();
    }
  }
  
  public Caesar(int x, ControlP5 cp5){
    rot=x;
    this.cp5=cp5;
    elements=new ArrayList<Textlabel>();
    for(int i=0;i<rot;i++){
      rot();
    }
  }
  
  public void showElements(){
    for(int i=0;i<elements.size();i++){
      elements.get(i).setValue("");
    }
    elements=new ArrayList<Textlabel>();
    elements.add(cp5.addTextlabel("ROT: "+rot));
    elements.get(0)
      .setValue("ROT: "+rot)
      .setPosition(width/2-50, 30)
      .setColor(#FFFFFF)
      .setFont(createFont("arial", 30))
      ;
    for(int i=0;i<alphabet.length;i++){
      float xposition=130;
      float yposition=140;
      yposition+=i/13*150;
      xposition+=i%13*110;
      elements.add(cp5.addTextlabel("b4 rot: "+alphabet[i]));
      elements.get(i+1)
        .setValue(alphabet[i]+"")
        .setPosition(xposition,yposition)
        .setColor(#FFFFFF)
        .setFont(createFont("Georgia", 30))
        ;
    }
    for(int i=0;i<alphabetROT.length;i++){
      float xposition=130;
      float yposition=220;
      yposition+=i/13*150;
      xposition+=i%13*110;
      elements.add(cp5.addTextlabel("after rot: "+alphabetROT[i]));
      elements.get(elements.size()-1)
        .setValue(alphabetROT[i]+"")
        .setPosition(xposition,yposition)
        .setColor(#03FF76)
        .setFont(createFont("arial", 30))
        ;
    }
  }
  
  void rot(){
    char first=alphabetROT[0];
    for(int i=0;i<alphabetROT.length-1;i++){
      alphabetROT[i]=alphabetROT[i+1];
    }
    alphabetROT[alphabetROT.length-1]=first;
  }
    
  
  public String encrypt(String s, ControlP5 cp5){
    for(int i=1;i<=26;i++){
      elements.get(i)
        .setColor(#ffffff)
        .setFont(createFont("Georgia", 30))
        ;
    }
    for(int i=27;i<53;i++){
      elements.get(i)
        .setColor(#03FF76)
        .setFont(createFont("arial", 30))
        ;
    }
    for(int i=53;i<elements.size();i++){
      elements.get(i).setValue("");
      elements.remove(i);
      i--;
    }
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      String str=" ";
      if(x[i]!=-1){
        elements.get(x[i]+1).setColor(#F6FF03);
        elements.get(x[i]+27)
          .setColor(0)
          .setFont(createFont("arial", 40));
      }
      if(x[i]!=-1){
        x[i]+=rot;
        x[i]=x[i]%alphabet.length;
        str=alphabet[x[i]]+"";
      }
      answer+=str;
      elements.add(cp5.addTextlabel("Caesar input"+i));
      elements.get(elements.size()-1)
        .setValue(str)
        .setPosition(100+(i+1)*50,522)
        .setColor(0)
        .setFont(createFont("arial",20))
        ;
    }
    return answer;
  }
  
  public String decrypt(String s, ControlP5 cp5){
    for(int i=1;i<=26;i++){
      elements.get(i)
        .setColor(#ffffff)
        .setFont(createFont("Georgia", 30))
        ;
    }
    for(int i=27;i<53;i++){
      elements.get(i)
        .setColor(#03FF76)
        .setFont(createFont("arial", 30))
        ;
    }
    for(int i=53;i<elements.size();i++){
      elements.get(i).setValue("");
      elements.remove(i);
      i--;
    }
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      String str=" ";
      if(x[i]!=-1){
        elements.get(x[i]+1).setColor(#F6FF03);
        elements.get(x[i]+27)
          .setColor(0)
          .setFont(createFont("arial", 40));
      }
      if(x[i]!=-1){
        x[i]-=rot;
        if(x[i]<0){
          x[i]+=26;
        }
        x[i]=x[i]%alphabet.length;
        str=alphabet[x[i]]+"";
      }
      answer+=str;
      elements.add(cp5.addTextlabel("Caesar input"+i));
      elements.get(elements.size()-1)
        .setValue(str)
        .setPosition(100+(i+1)*50,522)
        .setColor(0)
        .setFont(createFont("arial",20))
        ;
    }
    return answer;
  }
  
  int[] stringToNum(String s) {
    int[] x=new int[s.length()];
    for (int i=0; i<x.length; i++) {
      int smt=s.charAt(i);
      if(smt<97||smt>122){
        smt=-1;
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
      if(alphabet[x[i]]!=-1){
        s+=" ";
      } else {
        s+=alphabet[x[i]];
      }
    }
    return s;
  }
  
  public String toString() {
    return "Caesar (rot"+" "+rot+")";
  }
  
}
