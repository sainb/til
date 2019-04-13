p "alias x='ruby 20190413_Saturday/20190413.rb'" 

# Ruby combs task solution explanation. 

def combs(c1, c2)
    conv = ->(x){ x.chars.map{|y| ?* == y ? 1 : 0} }
    c1 = conv.(c1)
    c2 = conv.(c2)
    size = c1.size + c2.size
    a,b = c1,c2
    a,b = c2,c1 if c2.size < c1.size
    (0..size).reduce([]) do |memo,i|
        left = a.size - i > 0 ? a.size - i : 0
        right =  i - b.size > 0 ? i - b.size : 0
        s = left + b.size + right
        s1 = [0]*i + a + [0]*(a.size + b.size - i)
        s2 = [0]*a.size + b + [0]*a.size
        memo.push(s) if s1.zip(s2).map{|x,y| x+y}.all?{ |x| x < 2}
        memo
    end.min
end

p combs("*..*","*.*")

p "Now visualisztion"

a = "aaaa"
b = "bbbbb"

size = a.size + b.size
p "The size of a+b #{size}"

b = "-"*a.size + b + "-"*a.size 

(0..size).each do |i|
    tmpa = ("-"*i + a).ljust(b.size,'-')
    puts "i=#{i}"
    puts b
    puts tmpa
    
end
