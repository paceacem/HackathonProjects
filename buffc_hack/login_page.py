import tkinter as tk
from tkinter import messagebox,ttk
from login_db import check_username,verify_login
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from test import start_simulation
# Main window
def open_simulation():
    start_simulation()
def login():
    welcome = tk.Tk()
    welcome.title("FinStarter")
    welcome.geometry("700x500")

# Welcome screen
    def welcome_screen():
        for widget in welcome.winfo_children():
            widget.destroy()
        tk.Label(welcome, text="FinStarter", font=("Bosko", 36)).pack(pady=20)

    def login_page():
        for widget in welcome.winfo_children():
            widget.destroy()
        
        # Username
        tk.Label(welcome, text="FinStarter", font=("Bosko", 36)).pack(pady=20)
        tk.Label(welcome, text="Please login to continue.", font=("Arial", 18)).pack(pady=20)    
        tk.Label(welcome, text="Username:").pack(pady=5)
        
        username_entry = tk.Entry(welcome)
        username_entry.pack()

        # Password
        tk.Label(welcome, text="Password:").pack(pady=5)  
        password_entry = tk.Entry(welcome, show="*")
        password_entry.pack()

        # Login button with command
        login_button = tk.Button(welcome, text="Login", command=lambda:validate_login(username_entry.get(), password_entry.get()))
        login_button.pack(pady=10)

        #registration button
        registration_button = tk.Button(welcome, text="Registration", command=lambda: register_page())
        registration_button.pack(pady=10)

    def validate_login(username, password):
        if verify_login(username,password):
            messagebox.showinfo("Login Success", "You have successfully logged in!")
            page_1()
        else:
            messagebox.showwarning("Login Failed", "Incorrect username or password. Please try again.")
            login_page()

    def register_page():
        for widget in welcome.winfo_children():
            widget.destroy()
        
        tk.Label(welcome, text="Register", font=("Bosko", 36)).pack(pady=20)
        tk.Label(welcome, text="Please enter your details to register.", font=("Arial", 18)).pack(pady=20)    
        tk.Label(welcome, text="Username:").pack(pady=5)
        
        register_username_entry = tk.Entry(welcome)
        register_username_entry.pack()

        tk.Label(welcome, text="Password:").pack(pady=5)  
        register_password_entry = tk.Entry(welcome, show="*")
        register_password_entry.pack()

        register_button = tk.Button(welcome, text="Register", command=lambda: complete_registration(register_username_entry.get(), register_password_entry.get()))
        register_button.pack(pady=10)

    def complete_registration(username, password):
        # Here you would typically save the new user data to a database or file
        if check_username(username,password):
            messagebox.showinfo("Registration Successful", "You have successfully registered!")
            login_page()
        else:
             messagebox.showinfo("Registration unsuccessful","Username already taken.Please use another name")
             register_page()
    
    def page_1():
        def modules():    
            for widget in welcome.winfo_children():
                widget.destroy()  # Clear the screen
            tk.Label(welcome, text="Choose a topic and start learning", font=("Arial", 16, "bold"), bg="#f0f0f0").pack(pady=20)
            tk.Button(welcome, text="Basics of Saving", command=show_saving_module, font=("Arial", 12)).pack(pady=10)
            tk.Button(welcome, text="Stocks 101", command=show_stocks_module, font=("Arial", 12)).pack(pady=10)
            tk.Button(welcome, text="Compound Interest", command=show_compound_module, font=("Arial", 12)).pack(pady=10)

    # Placeholder functions for modules
        def show_saving_module():
            def calculate_savings():
                    try:
                        salary = float(salary_entry.get())
                        expenses = float(expenses_entry.get())
                        if salary <= 0 or expenses < 0 or expenses > salary:
                            raise ValueError
                        savings = salary - expenses
                        percentage = (savings / salary) * 100
                        result_label.config(text=f"You saved {percentage:.2f}% of your salary.\nTotal Savings: Rs{savings:.2f}")
                        show_pie_chart(savings, expenses)  # Display the pie chart
                    except ValueError:
                        messagebox.showerror("Invalid Input", "Please enter valid positive numbers.\nExpenses cannot exceed salary.")

            def show_pie_chart(savings, expenses):
                    chart_window = tk.Toplevel(welcome)
                    chart_window.title("Savings vs Expenses")
                    chart_window.geometry("500x500")

                    # Data for the pie chart
                    labels = ["Savings", "Expenses"]
                    values = [savings, expenses]
                    colors = ["#4CAF50", "#FF5722"]

                    # Create the figure
                    fig = Figure(figsize=(5, 4), dpi=100)
                    ax = fig.add_subplot(111)
                    ax.pie(values, labels=labels, autopct="%1.1f%%", colors=colors, startangle=90)
                    ax.set_title("Savings vs Expenses")

                    canvas = FigureCanvasTkAgg(fig, master=chart_window)
                    canvas.draw()
                    canvas.get_tk_widget().pack()

                    # Close button
                    tk.Button(chart_window, text="Close", command=chart_window.destroy, bg="#dc3545", fg="white").pack(pady=10)

                # Clear the screen
            for widget in welcome.winfo_children():
                    widget.destroy()

                # Introduction to Saving
            tk.Label(welcome, text="Basics of Saving", font=("Arial", 16, "bold")).pack(pady=10)
            tk.Label(welcome, text="Saving is the process of setting aside money from your income or earnings to use in the future.It is one of the most fundamental steps in managing your finances and builing wealth over time. Savings act as a financial cushion, helping you achieve goals.\n"
                                    "It's important to set aside a portion of your income for future needs and emergencies.",
                        wraplength=600, justify="center").pack(pady=10)

                # Savings Calculator Section
            tk.Label(welcome, text="Savings Calculator", font=("Arial", 14, "bold")).pack(pady=10)
            tk.Label(welcome, text="Enter your total monthly salary:").pack()
            salary_entry = tk.Entry(welcome, width=20)
            salary_entry.pack(pady=5)

            tk.Label(welcome, text="Enter your total monthly expenses:").pack()
            expenses_entry = tk.Entry(welcome, width=20)
            expenses_entry.pack(pady=5)

            tk.Button(welcome, text="Calculate Savings Percentage", command=calculate_savings, bg="#007bff", fg="white").pack(pady=10)
            result_label = tk.Label(welcome, text="", font=("Arial", 12), fg="green")
            result_label.pack(pady=5)

                # Back Button
            tk.Button(welcome, text="Back to Modules", command=modules, font=("Arial", 10), bg="pink", fg="white").pack(pady=10)



        def show_stocks_module():
            def show_home():
                """Display the home page with basic stock information."""

                header_label = tk.Label(root, text="Welcome to Stocks 101", font=('Arial', 18, 'bold'), fg="black", bg="white")
                header_label.pack(pady=20)

                info_text = (
                    "What are Stocks?\n\n"
                    "Stocks represent ownership in a company. When you buy a stock, "
                    "you purchase a share of that company's profits and assets.\n\n"
                    "Why Invest in Stocks?\n\n"
                    "- Potential for high returns over the long term.\n"
                    "- Diversify your investment portfolio.\n"
                    "- Participate in a company's growth.\n\n"
                    "Take this quiz to test your knowledge of stocks!"
                )
                info_label = tk.Label(root, text=info_text, font=('Arial', 12), fg="black", bg="white", justify="left", wraplength=450)
                info_label.pack(pady=20)
                button_frame = tk.Frame(root)
                button_frame.pack(expand=True) 

                start_button_stock = ttk.Button(button_frame, text="Simulate stock price", command=open_simulation)
                start_button_stock.pack(pady=(1, 10))  

            root = tk.Tk()
            root.title("Stocks 101")
            root.geometry("500x600")
            root.config(bg="white")

            show_home()

            root.mainloop()


        def show_compound_module():
            print("Compound Interest Module")
            root = tk.Tk()
            root.title("Compound Interest Calculator")
            root.geometry("450x380")  

            style = ttk.Style(root)
            style.configure("Custom.TButton",
                            font=("Arial", 12),
                            background="blue", 
                            foreground="black")  
            style.map("Custom.TButton",
                    background=[("active", "lightblue"), ("!disabled", "blue")],
                    foreground=[("!disabled", "white")])

            def go_home():
                for widget in root.winfo_children():
                    widget.destroy()

                tk.Label(root, text="Calculate Your Compound Interest Here!", font=("Arial", 16)).pack(pady=20)

                button_frame = tk.Frame(root)
                button_frame.pack(expand=True) 

                start_button = ttk.Button(button_frame, text="Start Calculator", command=start_calculator)
                start_button.pack(pady=(1, 10))  

            
            def start_calculator():
                for widget in root.winfo_children():
                    widget.destroy()

                tk.Label(root, text="Principal Amount:").grid(row=0, column=0, padx=10, pady=10)
                principal_entry = tk.Entry(root)
                principal_entry.grid(row=0, column=1, padx=10, pady=10)

                tk.Label(root, text="Rate of Interest (%):").grid(row=1, column=0, padx=10, pady=10)
                rate_entry = tk.Entry(root)
                rate_entry.grid(row=1, column=1, padx=10, pady=10)

                tk.Label(root, text="Time (years):").grid(row=2, column=0, padx=10, pady=10)
                time_entry = tk.Entry(root)
                time_entry.grid(row=2, column=1, padx=10, pady=10)

                result_label = tk.Label(root, text="", font=("Arial", 12))
                result_label.grid(row=5, column=0, columnspan=2, pady=20)

                compounding_label = tk.Label(root, text="Select Compounding Frequency:")
                compounding_label.grid(row=3, column=0, padx=10, pady=10)

                compounding_frequency = ttk.Combobox(root, values=["Annually", "Semi-Annually", "Quarterly"])
                compounding_frequency.grid(row=3, column=1, padx=10, pady=10)
                compounding_frequency.set("Annually")  

                def calculate_compound(event=None):  
                    try:
                        principal = float(principal_entry.get()) 
                        rate = float(rate_entry.get())  
                        time = float(time_entry.get())  
                        frequency = compounding_frequency.get()  

                        if principal <= 0 or rate <= 0 or time <= 0:
                            result_label.config(text="Please enter positive values.") 
                            return
                        
                        if frequency == "Annually":
                            n = 1
                        elif frequency == "Semi-Annually":
                            n = 2
                        elif frequency == "Quarterly":
                            n = 4

                        amount = principal * (1 + rate / (100 * n)) ** (n * time) 
                        interest = amount - principal  

                        principal_formatted = "{:,.2f}".format(principal)  
                        interest_formatted = "{:,.2f}".format(interest)  
                        amount_formatted = "{:,.2f}".format(amount)  
                        result_text = f"Compound Interest: Rs.{interest_formatted}\nTotal Amount: Rs.{amount_formatted}"
                        result_label.config(text=result_text)
                    except ValueError:  
                        result_label.config(text="Please enter valid numbers.")  

                root.bind('<Return>', calculate_compound)  

                calculate_button = ttk.Button(root, text="Calculate", command=calculate_compound)
                calculate_button.grid(row=4, column=0, columnspan=2, pady=10)  

                
            go_home()

            root.mainloop()
        modules()

    login_page()
    welcome.mainloop()

   