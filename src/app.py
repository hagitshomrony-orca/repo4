def get_user(user_id):
    # This is a comment 
    conn = sqlite3.connect("app.db")
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")
    return cursor.fetchone()

def run_command(cmd):
    subprocess.run(cmd, shell=True)
