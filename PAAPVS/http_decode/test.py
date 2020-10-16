import json

with open('./http.json','r') as f:
    httpjson = json.load(f)
    for it in httpjson:
        for it2 in it['_source']['layers'].items():
            for it3 in it2[1]:
                print(it3,end='')
            print()