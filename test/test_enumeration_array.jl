module TestEnumerationArray

using FactCheck
using DataCubes

facts("EnumerationArray tests") do
  @fact EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"])).elems --> Int[1 0 2 2;0 2 1 3]
  @fact EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"]).elems --> Int[2 0 3 3;0 3 2 1]
  @fact EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]))[2,2].value --> "b"
  @fact EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"])[2,2].value --> "b"
  @fact dcube.wrap_array(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]))[1:3]) --> dcube.wrap_array(EnumerationArray(@nalift(["a",NA,NA])))
  @fact dcube.wrap_array(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"])[1:3]) --> dcube.wrap_array(EnumerationArray(@nalift(["a",NA,NA]), ["c","a","b"]))
  @fact size(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"])) --> (2, 4)
  @fact dcube.wrap_array(reshape(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"]), 4, 2)) --> dcube.wrap_array(transpose(EnumerationArray(@nalift(["a" NA  NA "b";"b" "a" "b" "c"]), ["c","a","b"])))
  @fact dcube.wrap_array(transpose(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"]))) --> dcube.wrap_array(EnumerationArray(@nalift(["a" NA;NA "b";"b" "a";"b" "c"])))
  @fact dcube.wrap_array(transpose(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"]))) --> dcube.wrap_array(permutedims(EnumerationArray(@nalift(["a" NA "b" "b";NA "b" "a" "c"]), ["c","a","b"]), (2,1)))
  @fact dcube.wrap_array(reverse(enumeration(["hello", "hello", "hi"]))) --> dcube.wrap_array(enumeration(["hi", "hello", "hello"]))
end

end
