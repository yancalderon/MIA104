import pandas as pd

# Ruta del archivo Excel
file_path = 'C:/DATA/scm/github/mia/MIA104/FINAL_PROJECT/data/0_ip_departamentos.xlsx'  # Reemplaza 'your_file.xlsx' con el nombre real del archivo

# Cargar la hoja1 del archivo Excel
df = pd.read_excel(file_path, sheet_name='Hoja1')  # Asegúrate de que la hoja se llama 'Hoja1'

# Usar melt para transformar los datos
df_melted = df.melt(id_vars=["Unnamed: 0"], var_name="ano", value_name="ip")

# Renombrar las columnas para que coincidan con lo que necesitas
df_melted.columns = ['depto', 'ano', 'ip']

# Guardar el resultado en un nuevo archivo CSV
output_path = 'C:/DATA/scm/github/mia/MIA104/FINAL_PROJECT/data/1_ip_departamentos.csv'
df_melted.to_csv(output_path, index=False)

# Mostrar el resultado
df_melted.head()