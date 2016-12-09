function result = map_a_lbp_image(lbp_image,mapping,mode)
result=zeros(size(lbp_image));
if isstruct(mapping)
    bins = mapping.num;
    for i = 1:size(lbp_image,1)
        for j = 1:size(lbp_image,2)
            result(i,j) = mapping.table(lbp_image(i,j)+1);
        end
    end
end

if (strcmp(mode,'h') || strcmp(mode,'hist') || strcmp(mode,'nh'))
    % Return with LBP histogram if mode equals 'hist'.
    result=hist(result(:),0:(bins-1));
    if (strcmp(mode,'nh'))
        result=result/sum(result);
    end
else
    %Otherwise return a matrix of unsigned integers
    if ((bins-1)<=intmax('uint8'))
        result=uint8(result);
    elseif ((bins-1)<=intmax('uint16'))
        result=uint16(result);
    else
        result=uint32(result);
    end
end