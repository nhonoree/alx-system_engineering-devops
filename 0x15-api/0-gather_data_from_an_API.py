#!/usr/bin/python3
"""Fetch and display an employee's TODO list progress using a REST API."""

import requests
import sys


def fetch_employee_data(employee_id):
    """Fetch employee data and their TODO list from the API.

    Args:
        employee_id (int): The ID of the employee.

    Returns:
        tuple: A tuple containing the employee's name and their TODO list.
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

    return user_data["name"], todos_data


def display_todo_progress(employee_name, todos):
    """Display the employee's TODO list progress."""
    completed_tasks = [task["title"] for task in todos if task["completed"]]

    print(f"Employee {employee_name} is done with tasks "
          f"({len(completed_tasks)}/{len(todos)}):")
    for task in completed_tasks:
        print(f"\t {task}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 script.py <employee_id>")
        sys.exit(1)

    employee_id = sys.argv[1]
    if not employee_id.isdigit():
        print("Error: Employee ID must be a number.")
        sys.exit(1)

    employee_name, todos = fetch_employee_data(int(employee_id))
    display_todo_progress(employee_name, todos)
