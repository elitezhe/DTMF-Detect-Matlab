function keydig=fk2dig(keyH,keyL)

if keyL==1&&keyH==5 
	keydig='1';
end
if keyL==1&&keyH==6 
	keydig='2';
end
if keyL==1&&keyH==7 
	keydig='3';
end  
if keyL==1&&keyH==8 
	keydig='A';
end
if keyL==2&&keyH==5 
	keydig='4';
end
if keyL==2&&keyH==6 
	keydig='5';
end
if keyL==2&&keyH==7 
	keydig='6';
end  
if keyL==2&&keyH==8 
	keydig='B';
end
if keyL==3&&keyH==5 
	keydig='7';
end
if keyL==3&&keyH==6 
	keydig='8';
end
if keyL==3&&keyH==7 
	keydig='9';
end  
if keyL==3&&keyH==8 
	keydig='C';
end
if keyL==4&&keyH==5 
	keydig='*';
end
if keyL==4&&keyH==6 
	keydig='0';
end
if keyL==4&&keyH==7 
	keydig='#';
end  
if keyL==4&&keyH==8 
	keydig='D';
end

end