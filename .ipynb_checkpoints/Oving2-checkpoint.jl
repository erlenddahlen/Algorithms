function traversemax(record)
    max=record.value
    while(record.next != nothing)
        record=record.next
        if(record.value>max)
            max = record.value
        end
    end
    return max
end
