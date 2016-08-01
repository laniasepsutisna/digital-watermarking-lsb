function bitword=dewatermark_k(varargin)

    if length(varargin)==0                          
        return
    elseif length(varargin)==2                      
        rand('seed',varargin{2});                   
    end

    img_w=varargin{1};                             

    i=1;                                            
    flag=0;                                        
    im=img_w(:);                                    
    bitword=[''];                                  

    if length(varargin)==2                         
        k=randperm(length(im));                    
    end

while (i<=length(im))&&(flag==0),              
    bitchar=uint8(0);                           
    for j=1:8                                  
        if length(varargin)==2                 
            index=k((i-1) + j);                 
        else
            index=(i-1) + j;                    
        end
        b=bitget(im(index),1);                 
        if(b==1)                                
            bitchar=bitset(bitchar,j);          
        end
    end
    if(bitchar==255)                            
        flag=1;                                
    else
        b_index=(i-1)/8 +1;                     
        bitword(b_index)=char(bitchar);         
        i=i+8;                                  
    end

end

end