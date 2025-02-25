#!/usr/bin/python3
"""
Queries the Reddit API and returns the number of subscribers
for a given subreddit.
"""

import requests  # Import the requests module to handle API requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given
