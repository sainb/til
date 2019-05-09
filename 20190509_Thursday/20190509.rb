p "alias x='ruby 20190509_Thursday/20190509.rb'" 

# Ruby contoursShifting problem solution.

# https://gist.github.com/lbvf50mobile/2da768bfd2f0900719c37f1b4ecf06c0
require "minitest/autorun"
def get_zero_contour matrix
    top = matrix[0]
    bottom = matrix[-1].reverse
    matrix1 = matrix[1..-2].transpose
    left = matrix1[0].reverse
    right = matrix1[-1]
    {initial: matrix, contour: top+right+bottom+left, center: matrix[1..-2].map{|x| x[1..-2]}}
end

Matrix = [[1,2,3,4], 
[5,6,7,8], 
[9,10,11,12], 
[13,14,15,16], 
[17,18,19,20]];


describe "contoursShifting" do
    it "should get the 0 countrus" do
        assert_kind_of Hash, get_zero_contour(Matrix)
    end
    it "shoud correctly get the 0 countur" do
        contour = [1,2,3,4,8,12,16,20,19,18,17,13,9,5]
        center = [[6,7],[10,11],[14,15]]
        initial = Matrix
        answer = {initial: initial, contour: contour, center: center}
        ret = get_zero_contour(Matrix)
        assert_equal answer, ret
    end
end
