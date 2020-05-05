# 1) Implement fact(n) using recursion
function fact(n)
  res :: BigInt = 1
  return fact_helper(n, res)  
end

function fact_helper(n, temp)
  if (n == 0)
    return temp
  else
    temp = temp * n
    return fact_helper(n-1, temp)
  end
end

# 2) Improve efficiency by using memoization
function memorize(f)
  res_dict = Dict()
  function memo(n)
    if (n in keys(res_dict))
      return res_dict[n]
    else
      temp = f(n)
      res_dict[n] = temp
      return temp
    end
  end
  return memo
end  
fact_improved = memorize(fact)

# 3) Applying @time 
println("Running time using recursion:")
println("1st call: $(@time fact(50))")
println("2nd call: $(@time fact(50))")
println("3rd call: $(@time fact(50))")

println("Running time using memoization:")
println("1st call: $(@time fact_improved(50))")
println("2nd call: $(@time fact_improved(50))")
println("3rd call: $(@time fact_improved(50))")

#=
Time differences between two ways of implementation
> For both functions, the first call takes a longer time than the subsequent calls because Julia takes some time to parse the raw source code and convert into a form that is suitable for evaluation, and the result is an abstract syntax tree.
> Compared to fact(n) using recursion, memoization takes more time in the first call because it takes time to parse the memorization function and fact(n) function (as parameters) and it also takes some time to store all the calculated values into the dictionary.
> After the first call, both fact(n) using recursion and memoization takes almost constant time for the same number to be called (i.e., 50). 
> After the first call, the time complexity of fact(n) using recursion is still O(n). Memoization takes much less time than fact(n) since 50! has been calculated and stored in the dictionary and its time complexity is O(1).  
=#