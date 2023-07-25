=begin
Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

input: int, int, int
output: string

rules:
- input values will all be from 0 to 100

data structure:
- integers as inputs
- string as output

algorithm:
get_grade
=========
- given input ints 'score_1', 'score_2', and 'score_3'
- create a new float 'scores_sum' with the value 0.0
- add all of the scores to scores_sum, then divide scores_sum by 3 and assign
  that value to 'score'
- if 0 <= score < 60, return 'F'
- if 60 <= score < 70, return 'D'
- if 70 <= score < 80, return 'C'
- if 80 <= score < 90, return 'B'
- if 90 <= score <= 100, return 'A'
=end

def get_grade(score_1, score_2, score_3)
  scores_sum = 0.0 + score_1 + score_2 + score_3
  score = scores_sum / 3
  case
  when score >= 90 then 'A'
  when score >= 80 then 'B'
  when score >= 70 then 'C'
  when score >= 60 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
