#!/usr/bin/python3
import json
import requests

def fetch_all_employees_data():
    base_url = "https://jsonplaceholder.typicode.com"
    users_url = f"{base_url}/users"
    todos_url = f"{base_url}/todos"

    users_response = requests.get(users_url)
    todos_response = requests.get(todos_url)

    if users_response.status_code != 200 or todos_response.status_code != 200:
        print("Failed to fetch data from the API.")
        sys.exit(1)

    users_data = users_response.json()
    todos_data = todos_response.json()

    return users_data, todos_data

def export_all_to_json(users, todos):
    filename = "todo_all_employees.json"
    data = {}

    for user in users:
        user_id = user['id']
        username = user['username']
        user_tasks = [task for task in todos if task['userId'] == user_id]
        tasks = [{"username": username, "task": task['title'], "completed": task['completed']} for task in user_tasks]
        data[str(user_id)] = tasks

    with open(filename, mode='w') as file:
        json.dump(data, file, indent=4)

if __name__ == "__main__":
    users_data, todos_data = fetch_all_employees_data()
    export_all_to_json(users_data, todos_data)
