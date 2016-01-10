public with sharing class FlamesCalculator{
public string firstName{get;set;}
public string secondName{get;set;}
public string flameValue{get;set;}
public boolean display{get;set;}

public void details(){
firstName = firstName.toLowerCase();
secondName = secondName.toLowerCase();
firstName = firstName.trim();
secondName = secondName.trim();
list<string> l1 = firstName.split('');
list<string> l2 = secondName.split('');
for(integer i=1;i<l1.size();i++){
    for(integer j=1;j<l2.size();j++)
    {
        if(l2[j]==l1[i]){
            l2.remove(j);
            l1.remove(i);
            i=0;
            break;         
        }  
    }
}
/*F=FRIENDS
L=LOVE
A=ADORE
M=MARRIAGE
E=ENEMIES
S=SISTER

*/
integer n = l1.size()+l2.size();
if(n>=2)n=n-2;
List<String> f = new List<string>{'FRIENDS','LOVE','ADORE','MARRIAGE','ENEMIES','SISTER'};
integer val=n;
integer i=0;
integer k=0;
integer m=6;
while(k<5 && n!=0){
       if(val>6){
        n=math.mod(val,m);
        
    }
    if(f.size() <= val || val >=6)
    {
    n=math.mod(val,m);
    if(n==0)n=f.size();
      
    }
    
   
    f.remove(n-1);
    List<string> f1 = new List<string>();
    for(i=n-1;i<f.size();i++)
    {
        system.debug('adding elemne>>> '+f[i]);
        f1.add(f[i]);  
    }
    for(i=0;i<n-1;i++){
       
        f1.add(f[i]);
        
    }
    f=f1;
   
    m=m-1;
    k++;
}

flameValue = f[0];
display=true;

}
}