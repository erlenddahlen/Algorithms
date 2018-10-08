weights =
[3 6 8 6 3 ;
7 6 5 7 3;
4 10 4 1 6;
10 4 3 1 2;
6 1 7 3 9]

test =
[85 0 52 21 57 24;
32 69 27 26 80 53;
82 32 101 86 29 121;
103 87 58 60 34 41;
163 128 124 45 79 118;
176 170 106 82 50 164;
187 180 158 126 85 109;
198 258 193 162 179 93;
217 202 262 162 178 104]

function cumulative(weights)
    rows, cols = size(weights)
    A = Array{Int64,2}(undef,rows,cols)
    for i = 1:rows
        for j = 1:cols
            if i == 1
                A[i,j]=weights[i,j]
            elseif j == 1
                A[i,j] = weights[i,j] + min(weights[i-1,j], weights[i-1,j+1])
                weights[i,j] = A[i,j]
            elseif j == cols
                A[i,j] = weights[i,j] + min(weights[i-1,j], weights[i-1,j-1])
                weights[i,j] = A[i,j]
            else
                A[i,j] = weights[i,j] + min(weights[i-1,j], weights[i-1,j-1], weights[i-1,j+1])
                weights[i,j] = A[i,j]
            end

        end
    end
    return A
end
#path=[]
#a=(3, 7)
#typeof(a)
#push!(pat, a)

function back_track(path_weights)
    path = Array{Tuple{Int64,Int64}}(undef,0)
    rows, cols = size(path_weights)
    temp = path_weights[rows,1]
    indeks = (rows, 1)
    for j = 1:cols
        if path_weights[rows,j] < temp
            indeks = (rows,j)
            temp = path_weights[rows,j]
        end
    end
    push!(path, indeks)
    for i = rows-1:-1:1
        pos = path[length(path)][2]
        if pos==1
            indeks = (i,1)
            if path_weights[i,1]>path_weights[i,2]
                indeks = (i,2)
            end
        elseif pos==cols
            indeks = (i,cols-1)
            if path_weights[i,cols-1]>path_weights[i,cols]
                indeks = (i,cols)
            end
        else
            indeks = (i, pos-1)
            #println("pos: ", pos, "length", length(path))
            if path_weights[i,pos-1]>min(path_weights[i,pos+1],path_weights[i,pos])
                if path_weights[i,pos+1]<path_weights[i,pos]
                    indeks = (i, pos+1)
                else
                    indeks = (i, pos)
                end
            end

        end
        push!(path, indeks)
    end
    return path
end
