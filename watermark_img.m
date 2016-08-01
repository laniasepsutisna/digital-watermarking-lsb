function varargout=watermark_img(varargin)

if length(varargin)<2                                   
    return
elseif length(varargin)==3                              
    rand('seed',varargin{3});                           
    p=randperm(32);                                     
end

img=varargin{1};                                        
img_logo=varargin{2};                                   

dim=size(img_logo);                                     


if prod(size(img)) >= (prod(dim)*8+32)                  
        len=prod(dim)+4;                                
        im_w=img_logo(:);                               
        im=img(:);                                      
        im=bitand(im,uint8(ones(length(im),1)*254));    
        dim3=dec2bin(dim(3),2);                         
        for j=1:2                                       
            bin=dec2bin(dim(j),15);                     
            for i=1:15                                  
                index=(j-1)*15 +i;                      
                if(bin(i)=='1')                         
                    if length(varargin)==3              
                        im(p(index))=bitset(im(p(index)),1);    
                    else
                    im(index)=bitset(im(index),1);      
                    end
                end
            end
            
            if dim3(j)=='1'                             
                if length(varargin)==3                  
                    im(p(30+j))=bitset(im(p(30+j)),1);  
                else
                im(30+j)=bitset(im(30+j),1);            
                end
            end
        end
        
        k=4;                                            
        if length(varargin)==3                          
            p=randperm(length(im_w)*8)+32;              
        end
        
        while k<len,                                                    
            k=k+1;                                      
            for j=1:8                                  
               index=(k-1)*8 + j;                      
               b=bitget(im_w(k-4),j);                   
               if(b==1)                                 
                   if length(varargin)==3              
                       im(p(index-32))=bitset(im(p(index-32)),1);   
                   else
                   im(index)=bitset(im(index),1);       
                   end
               end
            end
        end
        
        [x,y,z]=size(img);                              
        varargout{1}=reshape(im,x,y,z);                 
        varargout{2}='WATERMARK BERHASIL!';             
        
else    
        varargout{2}='Gambar Terwatermark!'; 
end

end