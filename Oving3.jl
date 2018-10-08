

function bisect_right(A, p, r, v)
    i=p
    if p<r
        q=floor(Int, (p+r)/2)
        if v< A[q]
            i=bisect_right(A,p,q,v)
        else
            i=bisect_right(A,q+1,r,v)
        end
    end
    return i
end

function bisect_left(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
       if v <= A[q]
           i = bisect_left(A, p, q, v)
       else
           i = bisect_left(A, q+1, r, v)
       end
    end
    return i
end




A=[0,1,2,4,4,5]
println(A)
println(bisect_right(A,1,length(A)+1,4))

function partition(A,p,r)
    x=A[r]
    i=p-1
    for j = p:(r-1)
        if A[j]<=x
            i=i+1
            temp=A[i]
            A[i]=A[j]
            A[j]=temp
        end
    end
    temp=A[i+1]
    A[i+1]=A[r]
    A[r]=temp
    return i+1
end

function quick_sort!(A,p,r)
    if p<r
        q=partition(A,p,r)
        quick_sort!(A,p,q-1)
        quick_sort!(A,q+1,r)
    end
end

function algdat_sort!(A)
    quick_sort!(A,1,length(A))
end

function find_median(A, lower, upper)
    low=bisect_left(A,1,length(A)+1,lower)
    up=bisect_right(A,1,length(A)+1,upper)
    med_ind=(low+up)/2
    if med_ind%1==0
        med_ind=Int(med_ind)
        median=(A[med_ind]+A[med_ind-1])/2
    else
        median=(A[floor(Int,med_ind)])
    end
    return median
end
