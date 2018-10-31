struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end

Node(id) = Node(id, [], nothing, nothing, nothing)
function makenodelist(adjacencylist)
    nodes = Node[];
    for i = 1:length(adjacencylist)
        push!(nodes,Node(i));
    end
    for i = 1:length(adjacencylist)
        for neighbour in adjacencylist[i]
            push!(nodes[i].neighbours, nodes[neighbour]);
        end
    end
    return nodes;
end

function bfs!(nodes,start)
    for v in nodes
        v.color = "white"
        v.predecessor = nothing
        v.distance = typemax(Int)
    end
    start.color = "gray"
    start.distance = 0
    start.predecessor = nothing
    Q = Queue{Node}()
    enqueue!(Q,start)
    while length)(Q)
        u = dequeue!(Q)
        for v in u.neighbours
            if v.color == "white"
                v.color = "gray"
                v.distance = u.distance + 1
                v.predecessor = u
                enqueue!(Q,v)
            end
        end
        u.color = "black"
        if isgoalnode(u)
            return u
        end
    end
    return nothing
end
