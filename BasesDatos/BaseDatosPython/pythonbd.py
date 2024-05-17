import mysql.connector
import json

# Función para conectar a la base de datos MySQL
# def conectar_bd():
#     conexion = mysql.connector.connect(
#         host="tu_host",
#         user="tu_usuario",
#         password="tu_contraseña",
#         database="tu_base_de_datos"
#     )
#     return conexion

# Función para cargar la configuración desde el archivo JSON
def cargar_configuracion():
    with open('config.json') as archivo_config:
        configuracion = json.load(archivo_config)
    return configuracion

# Función para conectar a la base de datos MySQL
def conectar_bd(configuracion):
    conexion = mysql.connector.connect(
        host=configuracion['host'],
        user=configuracion['usuario'],
        password=configuracion['contraseña'],
        database=configuracion['base_de_datos']
    )
    return conexion

# Función para seleccionar registros
def seleccionar_registros(configuracion):
    conexion = conectar_bd(configuracion)
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM ordenes")
    registros = cursor.fetchall()
    for registro in registros:
        print(registro)
    conexion.close()

# Función para insertar un nuevo registro
def insertar_registro(configuracion):
    cliente = input("Ingrese el nombre del cliente: ")
    monto = float(input("Ingrese el monto de la orden: "))
    conexion = conectar_bd(configuracion)
    cursor = conexion.cursor()
    consulta = "INSERT INTO ordenes (cliente, monto) VALUES (%s, %s)"
    datos = (cliente, monto)
    cursor.execute(consulta, datos)
    conexion.commit()
    print("Registro insertado correctamente")
    conexion.close()

# Función para actualizar un registro existente
def actualizar_registro(configuracion):
    id_orden = int(input("Ingrese el ID del registro a actualizar: "))
    nuevo_monto = float(input("Ingrese el nuevo monto: "))
    conexion = conectar_bd(configuracion)
    cursor = conexion.cursor()
    consulta = "UPDATE ordenes SET monto = %s WHERE id = %s"
    datos = (nuevo_monto, id_orden)
    cursor.execute(consulta, datos)
    conexion.commit()
    print("Registro actualizado correctamente")
    conexion.close()

# Función para borrar un registro
def borrar_registro(configuracion):
    id_orden = int(input("Ingrese el ID del registro a borrar: "))
    conexion = conectar_bd(configuracion)
    cursor = conexion.cursor()
    consulta = "DELETE FROM ordenes WHERE id = %s"
    datos = (id_orden,)
    cursor.execute(consulta, datos)
    conexion.commit()
    print("Registro borrado correctamente")
    conexion.close()

# Menú principal
def menu(configuracion):
    while True:
        print("\n--- Menú ---")
        print("1. Seleccionar registros")
        print("2. Insertar registro")
        print("3. Actualizar registro")
        print("4. Borrar registro")
        print("5. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            print("\nRegistros actuales:")
            seleccionar_registros(configuracion)
        elif opcion == "2":
            insertar_registro(configuracion)
        elif opcion == "3":
            actualizar_registro(configuracion)
        elif opcion == "4":
            borrar_registro(configuracion)
        elif opcion == "5":
            print("Saliendo del programa...")
            break
        else:
            print("Opción no válida. Por favor, seleccione una opción válida.")

# Ejecutar el menú
if __name__ == "__main__":
    configuracion = cargar_configuracion()
    menu(configuracion)
