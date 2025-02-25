#!/usr/bin/python3
"""
Queries the Reddit API and counts keyword occurrences in hot article titles.
"""

import requests


def count_words(subreddit, word_list, after=None, word_count={}):
    """Recursively counts occurrences of keywords in hot article titles."""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "MyRedditBot/1.0"}
    params = {"limit": 100, "after": after}

    response = requests.get(url, headers=headers, params=params, allow_redirects=False)

    if response.status_code != 200:
        return

    data = response.json()
    posts = data.get("data", {}).get("children", [])

    for post in posts:
        title = post.get("data", {}).get("title", "").lower().split()
        for word in word_list:
            count = title.count(word.lower())
            if count > 0:
                word_count[word.lower()] = word_count.get(word.lower(), 0) + count

    after = data.get("data", {}).get("after")

    if after:
        return count_words(subreddit, word_list, after, word_count)

    sorted_words = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))

    for word, count in sorted_words:
        print(f"{word}: {count}")
