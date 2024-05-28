// これは、支払いパターンを出力するためのコードになっています。
let tripmember: [String] =  ["sato", "nagata", "sinozaki", "inui"]

var tripmemberCount: Int = tripmember.count
var shiharaiwariate: Int = tripmemberCount * (tripmemberCount-1)
print(tripmemberCount)
print(shiharaiwariate)


for value in tripmember {
  for n in (0..<tripmemberCount){
    if value == tripmember[n]{
      continue
    }
     print("\(value)→\(tripmember[n])")
  }
}