# simulation.py

import tkinter as tk
from tkinter import ttk, messagebox
import yfinance as yf
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import numpy as np

def start_simulation():
    """Start the stock simulation application."""
    nepali_banks = {
        "Standard Chartered Bank Nepal Limited (SCB)": "SCB",
        "Himalayan Bank Limited (HBL)": "HBL",
        "Everest Bank Limited (EBL)": "EBL",
        "Prabhu Bank Limited (PRVU)": "PRVU",
        "Siddhartha Bank Limited (SBL)": "SBL",
    }

    def fetch_stock_data(ticker, start_date, end_date):
        """Fetch historical stock data using yfinance."""
        try:
            stock = yf.Ticker(ticker)
            data = stock.history(start=start_date, end=end_date)
            if data.empty:
                raise ValueError("No data found for this ticker in the given date range.")
            return data
        except Exception as e:
            messagebox.showerror("Error", f"Error fetching data: {e}")
            return None

    def calculate_investment_growth(data, investment_amount, inflation_rate=0.03):
        """Simulate investment growth adjusted for inflation."""
        prices = data['Close']
        normalized_prices = prices / prices.iloc[0]  # Normalize prices to start at 1
        growth = investment_amount * normalized_prices
        inflation_adjusted_growth = growth / ((1 + inflation_rate) ** np.arange(len(growth)))
        return prices.index, growth, inflation_adjusted_growth

    def plot_growth(canvas_frame, dates, growth, inflation_adjusted_growth):
        """Plot investment growth in the Tkinter GUI."""
        # Clear the frame for new content
        for widget in canvas_frame.winfo_children():
            widget.destroy()

        # Create the matplotlib figure
        fig, ax = plt.subplots(figsize=(8, 5))
        ax.plot(dates, growth, label='Nominal Growth', color='blue')
        ax.plot(dates, inflation_adjusted_growth, label='Inflation-Adjusted Growth', color='red')
        ax.set_title('Investment Growth Over Time')
        ax.set_xlabel('Date')
        ax.set_ylabel('Investment Value (NPR)')
        ax.legend()
        ax.grid()

        # Embed the figure into the Tkinter frame
        canvas = FigureCanvasTkAgg(fig, master=canvas_frame)
        canvas.draw()
        canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

    def on_select_bank():
        """Handle bank selection and display the ticker."""
        selected_bank = bank_combo.get()
        if not selected_bank:
            messagebox.showerror("Error", "Please select a bank from the list.")
            return

        # Get the stock ticker for the selected bank
        stock_ticker = nepali_banks[selected_bank]
        ticker_entry.delete(0, tk.END)  # Clear the previous ticker entry
        ticker_entry.insert(0, stock_ticker)  # Set the ticker in the entry box

    def run_simulation():
        """Handle user input and display the results."""
        ticker = ticker_entry.get().upper()
        start_date = start_date_entry.get()
        end_date = end_date_entry.get()
        try:
            investment_amount = float(investment_entry.get())
            inflation_rate = float(inflation_entry.get())
        except ValueError:
            messagebox.showerror("Input Error", "Please enter valid numbers for investment and inflation rate.")
            return

        # Fetch stock data
        stock_data = fetch_stock_data(ticker, start_date, end_date)
        if stock_data is None:
            return

        # Calculate investment growth
        dates, growth, inflation_adjusted_growth = calculate_investment_growth(
            stock_data, investment_amount, inflation_rate
        )

        # Plot the graph
        plot_growth(canvas_frame, dates, growth, inflation_adjusted_growth)

    # Create the Tkinter GUI
    root = tk.Tk()
    root.title("Stock Simulator with Nepali Bank Selector")
    root.geometry("800x600")  # Set window size

    # Add a label for bank selection
    frame = ttk.Frame(root, padding="10")
    frame.pack(fill=tk.BOTH, expand=False)

    ttk.Label(frame, text="Select a Bank for Stock Analysis:", font=("Arial", 12)).grid(row=0, column=0, padx=5, pady=5, sticky=tk.W)

    # Create a dropdown (combo box) for selecting banks
    bank_combo = ttk.Combobox(frame, values=list(nepali_banks.keys()), width=40, state="readonly")
    bank_combo.grid(row=0, column=1, padx=5, pady=5)
    bank_combo.bind("<<ComboboxSelected>>", lambda event: on_select_bank())  # Bind the bank selection

    # Create the input fields for stock simulator
    ttk.Label(frame, text="Stock Ticker:").grid(row=1, column=0, padx=5, pady=5, sticky=tk.W)
    ticker_entry = ttk.Entry(frame, width=20)
    ticker_entry.grid(row=1, column=1, padx=5, pady=5)

    ttk.Label(frame, text="Start Date (YYYY-MM-DD):").grid(row=2, column=0, padx=5, pady=5, sticky=tk.W)
    start_date_entry = ttk.Entry(frame, width=20)
    start_date_entry.grid(row=2, column=1, padx=5, pady=5)

    ttk.Label(frame, text="End Date (YYYY-MM-DD):").grid(row=3, column=0, padx=5, pady=5, sticky=tk.W)
    end_date_entry = ttk.Entry(frame, width=20)
    end_date_entry.grid(row=3, column=1, padx=5, pady=5)

    ttk.Label(frame, text="Investment Amount (NPR):").grid(row=4, column=0, padx=5, pady=5, sticky=tk.W)
    investment_entry = ttk.Entry(frame, width=20)
    investment_entry.grid(row=4, column=1, padx=5, pady=5)

    ttk.Label(frame, text="Inflation Rate (e.g., 0.03 for 3%):").grid(row=5, column=0, padx=5, pady=5, sticky=tk.W)
    inflation_entry = ttk.Entry(frame, width=20)
    inflation_entry.grid(row=5, column=1, padx=5, pady=5)

    # Create the canvas for displaying the graph
    canvas_frame = ttk.Frame(root, padding="10", relief="ridge")
    canvas_frame.pack(fill=tk.BOTH, expand=True)

    # Add a button to run the simulation
    simulate_button = ttk.Button(frame, text="Simulate", command=run_simulation)
    simulate_button.grid(row=6, column=0, columnspan=2, pady=10)

    # Start the Tkinter event loop
    root.mainloop()
