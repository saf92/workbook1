
#Workbook2

#Q1

function print_LList(L::Nullable{LList})
     if isnull(L)
     return
     else
        println(get(L).data)
     return print_LList(get(L).next)
     end
end


function search(list::Nullable{LList},k::Int64)
    if isnull(list)
        return Nullable{KVPair}
    elseif ((get(list).data).key==k)
        return get(list).data
    else
        return search(get(list).next,k)
    end
end

#Q2

function intervalmembership(list::Nullable{LList}, x::Float64)
    if isnull(get(list).next)
        return Nullable{KVPair}
    elseif 0 <= x < get(list).data.value
        return get(list).data
    elseif get(list).data.value <= x < get(get(list).next).data.value
        return get(get(list).next).data
    else
        return intervalmembership(get(list).next,x)
    end
end



function intervalmembershipT(FT::Nullable{FTree}, x::Float64)
    if isnull(get(FT).left) & isnull(get(FT).right)
        return get(FT).data
    elseif x>=get(FT).data.value
        #print("too big")
        return Nullable{KVPair}
    elseif x<get(get(FT).left).data.value
        return intervalmembershipT(get(FT).left,x)
    else
        return intervalmembershipT(get(FT).right,x-get(get(FT).left).data.value)
    end
end



