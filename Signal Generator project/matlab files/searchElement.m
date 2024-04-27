function search = searchElement(matrix, element)
    for i=1:length(matrix)
        if element==matrix(i)
            search=1;
            break
        else
            search=0;
        end
    end
end
