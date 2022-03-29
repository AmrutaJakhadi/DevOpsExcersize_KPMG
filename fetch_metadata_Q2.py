import requests
import json

metadata_base_url = 'http://169.254.169.254/latest/'

#function to parse URL to extract particular metadata-key and form URL in required format
def url_lookup(url, keys_arr):
    output = {}
    for string1 in keys_arr:
        new_url = url + string1
        r = requests.get(new_url)
        text = r.text
        if string1[-1] == "/":
            list_of_values = r.text.splitlines()
            output[string1[:-1]] = url_lookup(new_url, list_of_values)
        elif is_json(text):
            output[string1] = json.loads(text)
        else:
            output[string1] = text
    return output

#key function of the script   
def fetch_metadata():
    main_str = ["meta-data/"]
    result = url_lookup(metadata_base_url, main_str)
    return result

#function to form json out of received string output
def get_metadata_json():
    instance_metadata = fetch_metadata()
    metadata_json = json.dumps(instance_metadata, indent=8, sort_keys=True)
    return metadata_json

#throw error if unable to form json for given string output
def is_json(json_string):
    try:
        json.loads(json_string)
    except ValueError:
        return False
    return True

#function to get exact key
def extract_key(key, var):
    if hasattr(var, 'items'):
        for k, v in var.items():
            if k == key:
                yield v
            if isinstance(v, dict):
                for result in extract_key(key, v):
                    yield result
            elif isinstance(v, list):
                for d in v:
                    for result in extract_key(key, d):
                        yield result


def search_key(key):
    metadata = fetch_metadata()
    return list(extract_key(key, metadata))


if __name__ == '__main__':
    key = input("Enter the metadata key name to search for?\n")
    print(search_key(key))


#Uncomment below section if want to fetch complete metadata 
#if __name__ == '__main__':
#    print(get_metadata_json())
