import tkinter as tk
import re

def check_strength():
    password = entry.get()
    strength = evaluate_password(password)
    result_label.config(text=f"Password Strength: {strength}")

def evaluate_password(password):
    # Criteria for strength
    length_error = len(password) < 8
    digit_error = re.search(r"\d", password) is None
    uppercase_error = re.search(r"[A-Z]", password) is None
    lowercase_error = re.search(r"[a-z]", password) is None
    symbol_error = re.search(r"[!@#$%^&*(),.?\":{}|<>]", password) is None

    # Scoring
    score = 5 - sum([length_error, digit_error, uppercase_error, lowercase_error, symbol_error])

    if score == 5:
        return "Very Strong "
    elif score == 4:
        return "Strong "
    elif score == 3:
        return "Medium "
    elif score == 2:
        return "Weak "
    else:
        return "Very Weak "

# Tkinter GUI setup
root = tk.Tk()
root.title("Password Strength Checker")
root.geometry("400x200")

# Widgets
tk.Label(root, text="Enter Password:", font=("Arial", 12)).pack(pady=10)
entry = tk.Entry(root, show="*", width=30, font=("Arial", 12))
entry.pack(pady=5)

check_button = tk.Button(root, text="Check Strength", command=check_strength, font=("Arial", 12))
check_button.pack(pady=10)

result_label = tk.Label(root, text="", font=("Arial", 12, "bold"))
result_label.pack(pady=10)

root.mainloop()
