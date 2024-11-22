import tkinter as tk
from tkinter import filedialog
from PIL import Image, ImageTk
import os


class SmartDustbin:
    def __init__(self, master):
        self.master = master
        self.master.title("Smart Dustbin")
        self.master.geometry("380x480")
        self.master.resizable(width=False, height=False)
        self.master.columnconfigure(0, weight=1)
        self.master.rowconfigure(0, weight=1)

        self.frame = tk.Frame(self.master, padx=5, pady=5)
        self.frame.grid(row=0, column=0, sticky="nsew", padx=5, pady=5)
        self.frame.columnconfigure(0, weight=1)
        self.frame.rowconfigure(2, weight=1)

        self.upload_button = tk.Button(self.frame, text="Upload Image", command=self.upload_image)
        self.upload_button.grid(row=0, column=0, sticky="ew", padx=5, pady=5)

        self.image_label = tk.Label(self.frame, text="No Image Uploaded", width=30, height=15, relief="solid", anchor="center")
        self.image_label.grid(row=1, column=0, sticky="nsew", padx=5, pady=5)

        self.result_label = tk.Label(self.frame, text="", font=("Arial", 14), fg="blue", anchor="center")
        self.result_label.grid(row=2, column=0, sticky="nsew", padx=5, pady=5)

    def upload_image(self):
        file_path = filedialog.askopenfilename(
            filetypes=[("Image Files", "*.jpg;*.jpeg;*.png;*.bmp;*.gif")]
        )
        if file_path:
            try:
                image = Image.open(file_path)
                img_cpy = image.copy()
                img_cpy.thumbnail((300, 150))

                # Create a blank canvas with the label's dimensions
                canvas = Image.new("RGB", (300, 150), "white")
                # Paste the thumbnail onto the canvas (centered)
                x_offset = (300 - img_cpy.width) // 2
                y_offset = (150 - img_cpy.height) // 2
                canvas.paste(img_cpy, (x_offset, y_offset))

                img_display = ImageTk.PhotoImage(canvas)
                self.image_label.config(image=img_display)
                self.image_label.image = img_display  # Keep a reference to avoid garbage collection

                save_folder = "test/"
                if not os.path.exists(save_folder):
                    os.makedirs(save_folder)
                save_path = os.path.join(save_folder, os.path.basename(file_path))
                image.save(save_path)

            except Exception as e:
                print(f"Error loading image: {e}")

    def passed(self):
        self.result_label.config(text="Non-Biodegradable", fg="red")
        self.delete_images()

    def failed(self):
        self.result_label.config(text="Biodegradable", fg="green")
        self.delete_images()

    def delete_images(self):
        folder_path = "test/"
        for filename in os.listdir(folder_path):
            if filename.endswith(".jpg"):
                os.remove(os.path.join(folder_path, filename))
                print(f"Deleted: {filename}")


def main():
    root = tk.Tk()
    app = SmartDustbin(root)
    root.mainloop()


if __name__ == "__main__":
    main()
