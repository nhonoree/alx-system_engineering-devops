#!/usr/bin/python3
"""Fetches TODO lists for all employees and saves to a JSON file."""
import json
import requests

if __name__ == "__main__":
    # Fetch users and tasks
    users_url = "https://jsonplaceholder.typicode.com/users"
    todos_url = "https://jsonplaceholder.typicode.com/todos"

    users = requests.get(users_url).json()
    todos = requests.get(todos_url).json()

    # Debugging: Check if users and todos are retrieved
    print(f"Total Users: {len(users)}")  # Should be 10
    print(f"Total TODOs: {len(todos)}")  # Should be 200

    # Dictionary to store tasks by user ID
    tasks_by_user = {}

    for user in users:
        user_id = str(user["id"])  # Convert ID to string
        username = user["username"]

        # Get user's tasks
        user_tasks = [
            {
                "username": username,
                "task": task["title"],
                "completed": task["completed"]
            }
            for task in todos if task["userId"] == user["id"]
        ]

        # Store in dictionary
        tasks_by_user[user_id] = user_tasks

    # Debugging: Check if dictionary is filled
    print(f"User IDs Processed: {list(tasks_by_user.keys())}")

    # Save to JSON file
    with open("todo_all_employees.json", "w") as file:
        json.dump(tasks_by_user, file, indent=4)

    print("JSON file created successfully.")
