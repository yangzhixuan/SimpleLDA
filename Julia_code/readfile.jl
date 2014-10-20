module readfile

    function readFile(filename="../data/ap.dat")
        # read the data file
        result = (Int64, Dict)[]
        open(filename, "r") do f
            for line in eachline(f)
                comp = split(line, " ")
                numWords = int(comp[1])
                bagOfWords = comp[2:size(comp)[1]]
                wordInfo = Dict()
                for word in bagOfWords
                    temp = split(word, ":")
                    if length(temp) != 2
                        continue
                    end
                    # temp[1] is the word id
                    # temp[2] is the number of times that this word appears in document
                    wordInfo[temp[1]] = int(temp[2])
                end
                tuple = (numWords, wordInfo)
                push!(result, tuple)
            end
        end
        return result
    end

    function readVoc(filename="../data/vocab.txt")
        # read the list of vocabulary
        result = ASCIIString[]
        open(filename, "r") do f
            for line in eachline(f)
                vocab = split(line, "\n")[1]
                push!(result, vocab)
            end
        end
        return result
    end

end