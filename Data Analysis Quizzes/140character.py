headlines = ["Local Bear Eaten by Man",
             "Legislature Announces New Laws",
             "Peasant Discovers Violence Inherent in System",
             "Cat Rescues Fireman Stuck in Tree",
             "Brave Knight Runs Away",
             "Papperbok Review: Totally Triffic"]
#print(headlines[0][1])             
x = 0
news_ticker = ""
for i in range(len(headlines)):
    # print ("this is i {}".format(i))
    for j in range(len(headlines[i])):
        x += j
        if len(news_ticker + headlines[i][j]) > 140:
            break
        if x >= 1:
            if j == 0:
                news_ticker += " "
        news_ticker += headlines[i][j]
print (news_ticker)
print (len(news_ticker))