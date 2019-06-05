p "alias x='ruby 20190605_Wednesday/20190605.rb'" 

# Chess triangle.

# Consider a bishop, a knight and a rook on an n × m chessboard. 
# They are said to form a triangle if each piece attacks exactly 
# one other piece and is attacked by exactly one piece.
# Calculate the number of ways to choose positions of the pieces to 
# form a triangle.

# For n = 2 and m = 3, the output should be
# chessTriangle(n, m) = 8.

# https://medium.com/@tchryssos/array-combinations-and-permutations-f9599ac5d403




def type 
     [
    {t:'k', delta: [ [1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]},
    {t:'b', delta:[[1,1],[1,-1],[-1,-1],[-1,1]]},
    {t:'r', delta:[[0,1],[1,0],[0,-1],[-1,0]]}
]
end

def check_validnes hash
    a = hash[:p1]
    b = hash[:p2]
    c = hash[:p3]
    delta = ->y{ type.select{|x| x[:t] == y}[0][:delta] }
    values = ->(x,delta){ delta.map{|dx,dy| [x[0]+dx,x[1]+dy]}}
    delta_a = delta[hash[:t][0]]
    delta_b = delta[hash[:t][1]]
    delta_c = delta[hash[:t][2]]
    a1 = values[a,delta_a].any?{|x| x == b} 
    b1 = values[b,delta_b].any?{|x| x == c}
    c1 = values[c,delta_c].any?{|x| x == a}
    a1 && b1 && c1
end


def chessTriangle(n,m)
    
    variants = []
    v = ->a{ a[0].between?(0,m-1) && a[1].between?(0,n-1)}
    m.times do |x|
        n.times do |y|
            type.permutation(3) do |a,b,c|
                # Selected sells that beat by first point [[x,y], [x1,y1]]
                point12 = a[:delta].map{|dx,dy| {p1: [x,y],p2:[x+dx,y+dy],t: a[:t]+b[:t]}}.select{|arr| v[arr[:p2]]}
                point123 = point12.map do |p12| 
                    b[:delta].map{|dx,dy| {p1: p12[:p1],p2:p12[:p2], p3: [p12[:p2][0]+dx,p12[:p2][1]+dy], t: a[:t]+b[:t]+c[:t]}}
                    .select{|p123| v[p123[:p3]]}
                    .select{|p123| c[:delta].any?{|dx,dy| p123[:p1]==[p123[:p3][0]+dx,p123[:p3][1]+dy]}}
                end.flatten.uniq
                variants = variants + point123
                
            end
        end
    end
    valid = variants.all?{|x| check_validnes(x)}
    p "varians #{variants.size}, variantes.uniq #{variants.uniq.size}, valid #{valid}"

end

chessTriangle(2,3)