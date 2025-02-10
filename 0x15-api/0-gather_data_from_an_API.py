#!/usr/bin/python3
"""
Module to fetch and display an employee's TODO list progress using a REST API.
"""
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


def display_todo_progress(employee_name, todos):
    """
    Displays the employee's TODO list progress.

    Args:
        employee_name (str): The name of the employee.
        todos (list): A list of tasks for the employee.
    """
    completed_tasks = [task for task in todos if task['completed']]
    total_tasks = len(todos)
    print(f"Employee {employee_name} is done with tasks({len(completed_tasks)}/{total_tasks}):")
    for task in completed_tasks:
        print(f"\t {task['title']}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    user_data, todos_data = fetch_employee_data(employee_id)
    display_todo_progress(user_data['name'], todos_data)
