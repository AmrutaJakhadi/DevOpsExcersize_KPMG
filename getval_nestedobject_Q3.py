dict1 = {'x':{'y':{'z':'a'}}}  ##define dictionary as an object received

def printvalue(dict1):
    for k, v in dict1.items():
        if isinstance(v, dict):  ##check if the v type is dictionary
            printvalue(v)
        else:
            #print("{0} : {1}".format(k, v))  ##print key-value pair
            print(v) ##print only value

printvalue(dict1)
            
            
            
            