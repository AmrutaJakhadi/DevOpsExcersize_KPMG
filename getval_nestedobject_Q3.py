dict1 = {'a':{'b':{'c':'d'}}}  ##define dictionary as an object received
key1 = 'b'  ##key to be passed 

dict2 = {'x':{'y':{'z':'a'}}}
key2 = 'y'

def printvalue(dict_current,key_current):
    for k, v in dict_current.items():
        if isinstance(v, dict):  ##check if the v type is dictionary
            printvalue(v,key_current)
        else:
            #print("{0} : {1}".format(k, v))  ##print key-value pair
            print("Key is %s and Value is %s " %(key_current,v)) ##print  value

printvalue(dict1,key1)
printvalue(dict2,key2)

            
            
            
            
