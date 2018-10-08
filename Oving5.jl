struct Node
    children::Dict{Char,Node}
    posi::Array{Int}
end

function parse_string(sentence)
  sentence = string(sentence)
  counter_bokstav = 1
  counter_Array = 1
  A = Tuple{String, Int}[]
  temp = ""
  for i in sentence
    if i == ' '
      push!(A,(temp, counter_Array))
      counter_Array = counter_bokstav + 1
      temp = ""
    else
      temp = string(temp, i)
    end
    counter_bokstav = counter_bokstav + 1
  end
  push!(A,(temp, counter_Array))
  build(A)
  return A
end

function build(list_of_words)
  master = Node
  Node.children[]
  for i in list_of_words


  end
end
