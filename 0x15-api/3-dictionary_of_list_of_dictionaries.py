#!/usr/bin/python3
"""Fetches TODO lists for all employees and saves to a JSON file."""
import json
import requests

if __name__ == "__main__":
    # Fetch users and tasks
    users = requests.get("https://jsonplaceholder.typicode.com/users").json()
    todos = requests.get("https://jsonplaceholder.typicode.com/todos").json()

    # Dictionary to store tasks by user ID
    tasks_by_user = {
        str(user["id"]): [
            {
                "username": user["username"],
                "task": task["title"],
                "completed": task["completed"]
            }
            for task in todos if task["userId"] == user["id"]
        ]
        for user in users
    }

    # Save to JSON file
    with open("todo_all_employees.json", "w") as file:
        json.dump(tasks_by_user, file, indent=4)

