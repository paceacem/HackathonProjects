import pandas as pd
def load_login_data(file_name='login_data.xlsx'):
    try:
        df = pd.read_excel(file_name, engine='openpyxl')
    except FileNotFoundError:
        df = pd.DataFrame(columns=["Username", "Password"])
    return df

def save_login_data(username, password, file_name='login_data.xlsx'):
    df = load_login_data(file_name)
    
    username = username.strip()
    password = password.strip()
    
    new_user = pd.DataFrame({"Username": [username], "Password": [password]})
    df = pd.concat([df, new_user], ignore_index=True)
    
    df.to_excel(file_name, index=False, engine='openpyxl')

def verify_login(username, password, file_name='login_data.xlsx'):
    df = load_login_data(file_name)
    
    username = username.strip()
    password = password.strip()
    
    if username in df['Username'].values:
        stored_password = df[df['Username'] == username]['Password'].values[0]
        if stored_password == password:
            return True
        else:
            return False

def check_username(username,password,file_name='login_data.xlsx'):
    df = load_login_data(file_name)
    username = username.strip()
    if username in df['Username'].values:
        return False
    else:
        save_login_data(username,password)
        return True

    
