#!/usr/bin/python3
"""
Queries the Reddit API and returns a list of all hot post titles recursively.
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """Returns a list of all hot article titles for a subreddit."""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "MyRedditBot/1.0"}
    params = {"limit": 100, "after": after}

    response = requests.get(url, headers=headers, params=params, allow_redirects=False)

    if response.status_code != 200:
        return None

    data = response.json()
    posts = data.get("data", {}).get("children", [])

    for post in posts:
        hot_list.append(post.get("data", {}).get("title"))

    after = data.get("data", {}).get("after")

    if after:
        return recurse(subreddit, hot_list, after)

    return hot_list
