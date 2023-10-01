

include("interprete_aritmetico-funciones.jl")



"Lee la expresión dada por el usuario."
function entrada()
  print("Este es un intérprete aritmético. Ingresa un expresión que únicamente contenga números en su expresión decimal, sumas '+', multiplicaciones '*' y paréntesis con un órden adecuado. \n Puedes escribir varias líneas, el programa dejará de leer cuando ingrese un nuevo renglón dejando el anterior vacío. \n Escribe una expresión válida:  ")
  
  #Creamos la cadena vacía.
  cadena = ""



  #Leemos la primera linea
  linea = readline()

  # Mientras la primera linea NO este vacía, la función la concatena
   while length(linea) > 0
     cadena = cadena * linea
  

      linea = readline()
    end
  return cadena
end

cadena = entrada()

resultado = interpreteAritmetico(cadena)

print(resultado)

  