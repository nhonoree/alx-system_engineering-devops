#!/usr/bin/python3
"""
Module to export employee TODO list progress to JSON using a REST API.
"""
import json
import requests
import sys


def fetch_employee_data(employee_id):
    """
    Fetches employee data and their TODO list from the API.

    Args:
        employee_id (int): The ID of the employee.

    Returns:
        tuple: A tuple containing the employee's data and their TODO list.
    """
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{base_url}/users/{employee_id}"
    todos_url = f"{base_url}/users/{employee_id}/todos"

    user_response = requests.get(user_url)
    todos_response = requests.get(todos_url)

    if user_response.status_code != 200 or todos_response.status_code != 200:
        print("Failed to fetch data from the API.")
        sys.exit(1)

    user_data = user_response.json()
    todos_data = todos_response.json()

    return user_data, todos_data


def export_to_json(employee_id, username, todos):
    """
    Exports the employee's TODO list to a JSON file.

    Args:
        employee_id (int): The ID of the employee.
        username (str): The username of the employee.
        todos (list): A list of tasks for the employee.
    """
    filename = f"{employee_id}.json"
    tasks = [{
        "task": task['title'],
        "completed": task['completed'],
        "username": username
    } for task in todos]

    data = {str(employee_id): tasks}

    with open(filename, mode='w') as file:
        json.dump(data, file)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./2-export_to_JSON.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    user_data, todos_data = fetch_employee_data(employee_id)
    export_to_json(employee_id, user_data['username'], todos_data)
