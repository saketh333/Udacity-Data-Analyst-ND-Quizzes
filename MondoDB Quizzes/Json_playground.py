# -*- coding: utf-8 -*-
"""
Created on Wed Dec 06 09:36:01 2017

@author: Saketh
"""

"""
To experiment with this code freely you will have to run this code locally.
Take a look at the main() function for an example of how to use the code. We
have provided example json output in the other code editor tabs for you to look
at, but you will not be able to run any queries through our UI.
"""
import json
import requests

BASE_URL = "http://musicbrainz.org/ws/2/"
ARTIST_URL = BASE_URL + "artist/"


# query parameters are given to the requests.get function as a dictionary; this
# variable contains some starter parameters.
query_type = {  "simple": {},
                "atr": {"inc": "aliases+tags+ratings"},
                "aliases": {"inc": "aliases"},
                "releases": {"inc": "releases"}}


def query_site(url, params, uid="", fmt="json"):
    """
    This is the main function for making queries to the musicbrainz API. The
    query should return a json document.
    """
    params["fmt"] = fmt
    r = requests.get(url + uid, params=params)
    print "requesting", r.url

    if r.status_code == requests.codes.ok:
        return r.json()
    else:
        r.raise_for_status()


def query_by_name(url, params, name):
    """
    This adds an artist name to the query parameters before making an API call
    to the function above.
    """
    params["query"] = "artist:" + name
    return query_site(url, params)


def pretty_print(data, indent=4):
    """
    After we get our output, we can use this function to format it to be more
    readable.
    """
    if type(data) == dict:
        print json.dumps(data, indent=indent, sort_keys=True)
    else:
        print data


def main():
    """
    Below is an example investigation to help you get started in your
    exploration. Modify the function calls and indexing below to answer the
    questions on the next quiz.

    HINT: Note how the output we get from the site is a multi-level JSON
    document, so try making print statements to step through the structure one
    level at a time or copy the output to a separate output file. Experimenting
    and iteration will be key to understand the structure of the data!
    """

    # Query for information in the database about bands named Nirvana
    results = query_by_name(ARTIST_URL, query_type["simple"], "Nirvana")
    pretty_print(results)
    
    # Isolate information from the 4th band returned (index 3)
    #print "\nARTIST:"
    #pretty_print(results["artists"][3])

    # Query for releases from that band using the artist_id
    #artist_id = results["artists"][3]["id"]
    #artist_data = query_site(ARTIST_URL, query_type["releases"], artist_id)
    #releases = artist_data["releases"]

    # Print information about releases from the selected band
    #print "\nONE RELEASE:"
    #pretty_print(releases[0], indent=2)

    #release_titles = [r["title"] for r in releases]
    #print "\nALL TITLES:"
    #for t in release_titles:
    #    print t
    
    # Question 1: How many bands named "First Aid Kit"?
    results = query_by_name(ARTIST_URL, query_type["simple"], "First Aid Kit")
    x = 0

    for artist in results["artists"]:

        if artist["name"] == "First Aid Kit":

            x += 1

    print "Bands Names First Aid Kit : {}".format(x)

    # Question 2: Begin_area name for Queen?

    results = query_by_name(ARTIST_URL, query_type["simple"], "Queen")
    Queen = results["artists"][0]
    print "\nThe begin-area name for Queen is {}".format(Queen)
    
    # Question 3: Spanish alias for The Beatles?

    results = query_by_name(ARTIST_URL, query_type["simple"], "The Beatles")
    
    for alias in results["artists"][0]["aliases"]:
        if alias["locale"] == "es":
            print "\nQ3: The Spanish alias for The Beatles is " + alias["name"]
    
    # Question 4: Nirvana disambiguation?

    query_results = query_by_name(ARTIST_URL, query_type["simple"], "Nirvana")

    # pretty_print(query_results)

    print "\nQ4: The disambiguation for Nirvana is " + query_results["artists"][0]["disambiguation"]



    # Question 5: Where was One Direction formed?

    query_results = query_by_name(ARTIST_URL, query_type["simple"], "One Direction")

    # pretty_print(query_results)

    print "\nQ5:One Direction was formed in " + query_results["artists"][0]["life-span"]["begin"]



if __name__ == '__main__':

    main()


print main()