def check_answers(my_answers,answers):
    """
    Checks the five answers provided to a multiple choice quiz and returns the results.
    """
    count_correct = 0
    count_incorrect = 0
    results= []
    for i in range(len(my_answers)):
        if my_answers[i] == answers[i]:
            results.append(1)
            count_correct += 1
            
        else:
            results.append(0)
            count_incorrect += 1
    if count_correct/len(results) > 0.7:
        return "Congratulations, you passed the test!" 
    elif count_incorrect/len(results) >= 0.3:
        return "Unfortunately, you did not pass."

print(check_answers(["as","as","as","as","as","as","as"],["as","as","as","as","as","as","as"]))
