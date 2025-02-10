#!/usr/bin/python3
"""
Script to export employee's TODO list progress to a JSON file.
"""

import json
import requests
import sys


if __name__ == "__main__":
    # Validate input
    if len(sys.argv) < 2:
        sys.exit("Usage: ./2-export_to_JSON.py <USER_ID>")

    try:
        user_id = int(sys.argv[1])
    except ValueError:
        sys.exit("Error: USER_ID must be an integer.")

    # API URLs
    user_url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={user_id}"

    # Fetch user data
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        sys.exit("Error: User not found.")

    user_data = user_response.json()
    username = user_data.get("username")

    # Fetch tasks
    todos_response = requests.get(todos_url)
    todos_data = todos_response.json()

    # Process tasks into required JSON format
    tasks_list = []
    for task in todos_data:
        tasks_list.append({
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": username
        })

    # Create JSON structure
    json_data = {str(user_id): tasks_list}

    # Save to file
    filename = f"{user_id}.json"
    with open(filename, "w", encoding="utf-8") as json_file:
        json.dump(json_data, json_file, indent=4)

    print(f"Data exported successfully to {filename}")
