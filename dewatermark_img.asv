function varargout=dewatermark_img(varargin)

if length(varargin)==0                          
    return
elseif length(varargin)==2                      
    rand('seed',varargin{2});                   
    p=randperm(32);                             
end

im_w=varargin{1}(:);                            

dim_l=0;                                        
dim3_b=0;                                       


for j=1:2                                       
    for i=1:15                                  
        index=(j-1)*15 +i;                      
        if length(varargin)==2                  
          dim_b(i)=bitget(im_w(p(index)),1);    
        else
        dim_b(i)=bitget(im_w(index),1);         
        end
    end
    dim_l(j)=bin2dec(num2str(dim_b));           
    
    
    if length(varargin)==2                      
        dim3_b(j)=bitget(im_w(p(30+j)),1);      
    else
    dim3_b(j)=bitget(im_w(30+j),1);             
    end
end

dim_l(3)=bin2dec(num2str(dim3_b));              

len=prod(dim_l)+4;                              
im_log(prod(dim_l))=0;                          
k=4;                                            
if length(varargin)==2                          
   p=randperm(prod(dim_l)*8)+32;                
end

while k<len,                                    
    k=k+1;                                      
    for j=1:8                                   
       index=(k-1)*8 + j;                       
       if length(varargin)==2                   
          b=bitget(im_w(p(index-32)),1);        
       else
       b=bitget(im_w(index),1);                 
       end
       
       if b==1                                  
        im_log(k-4)=bitset(im_log(k-4),j);      
       end
    end
end

im_log=uint8(im_log);                           

varargout{1}=reshape(im_log,dim_l(1),dim_l(2),dim_l(3));    

end