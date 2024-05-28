import pandas as pd
import mysql.connector

# Path ke file Excel
file_path = r"E:\KucingKu Web\dataset\Dataset KucingKu Web.xlsx"

# Baca data dari file Excel
df = pd.read_excel(file_path)

# Koneksikan ke database MySQL
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',
    database='kucingku'
)

# Buat cursor
cursor = conn.cursor()

# Nama tabel tempat Anda ingin memasukkan data
table_name = 'cats'  # Ganti dengan nama tabel yang sesuai

# Dapatkan kolom dari dataframe
columns = df.columns.tolist()

# Iterasi melalui baris-baris dataframe dan masukkan ke tabel MySQL
for i, row in df.iterrows():
    # Buat query INSERT INTO
    sql = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(['%s'] * len(columns))})"
    # Jalankan query
    cursor.execute(sql, tuple(row))

# Commit perubahan
conn.commit()

# Tutup koneksi
cursor.close()
conn.close()
