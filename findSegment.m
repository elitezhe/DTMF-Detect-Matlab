function soundSegment=findSegment(express)
if express(1)==0
    voicedIndex=find(express);                    
else
    voicedIndex=express;
end

soundSegment = [];
k = 1;
soundSegment(k).begin = voicedIndex(1);           
for i=1:length(voicedIndex)-1,
	if voicedIndex(i+1)-voicedIndex(i)>1,         
		soundSegment(k).end = voicedIndex(i);      
		soundSegment(k+1).begin = voicedIndex(i+1);
		k = k+1;
	end
end
soundSegment(k).end = voicedIndex(end);            

for i=1 :k
    soundSegment(i).duration=soundSegment(i).end-soundSegment(i).begin+1;
end
