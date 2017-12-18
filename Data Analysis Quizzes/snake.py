how_many_snakes = 1
snake_string = """
Welcome to Python3!

             ____
            / . .\\
            \  ---<
             \  /
   __________/ /
-=:___________/

<3, Philip and Charlie
"""


print(snake_string * how_many_snakes)

def scores_to_rating(s1, s2, s3, s4, s5):
    score1 = float(s1)
    score2 = float(s2)
    score3 = float(s3)
    score4 = float(s4)
    score5 = float(s5)
    
    def sum_middle_score(score1, score2, score3, score4, score5):
        max_s = max(score1, score2, score3, score4, score5)
        min_s = min(score1, score2, score3, score4, score5)
        sum = (score1+score2+score3+score4+score5) - max_s - min_s
        return sum
    average_score = sum_middle_score(score1, score2, score3, score4, score5)/3
    
    def score_to_rating_string(av_score): 
        """
        Convert the average score, which should be between 0 and 5, 
        into a rating.
        """
        if av_score < 1:
            return "Terrible"
        elif av_score < 2:
            return "Bad"
        elif av_score < 3:
            return "OK"
        elif av_score < 4:
            return "Good"
        else:
            return "Excellent"
        
    return score_to_rating_string(average_score)  
print (scores_to_rating(1,2,3,4,5))
