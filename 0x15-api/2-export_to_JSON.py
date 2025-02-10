#!/usr/bin/python3
"""Fetches and exports a user's TODO list to a JSON file."""
import json
import requests
import sys

if __name__ == "__main__":
    # Check if the user provided an argument (user ID)
    if len(sys.argv) < 2:
        print("Usage: ./2-export_to_JSON.py <user_id>")
        sys.exit(1)

    user_id = sys.argv[1]

    # API Endpoints
    user_url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={user_id}"

    # Fetch user data
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print(f"Error: User ID {user_id} not found.")
        sys.exit(1)

    user_data = user_response.json()
    username = user_data.get("username")

    # Fetch user's TODOs
    todos_response = requests.get(todos_url)
    todos = todos_response.json()

    # Prepare the data format
    tasks = []
    for task in todos:
        tasks.append({
            "task": task["title"],
            "completed": task["completed"],
            "username": username
        })

    # Save to JSON file
    user_tasks = {str(user_id): tasks}
    filename = f"{user_id}.json"

    with open(filename, "w") as file:
        json.dump(user_tasks, file, indent=4)

    print(f"Data exported successfully to {filename}")
