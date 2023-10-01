"Dada una cadena y la posición del error, concatena una nueva cadena donde se señale."
function marcaError(cadena, caracterEnLinea)
  nuevaCadena = ""

  #Con esta variable iteramos en la cadena
  i = 1
  #Agrega a la nueva cadena los caracteres previos al error
  while i < caracterEnLinea
    nuevaCadena = nuevaCadena * cadena[i]
    i = i+1
  end

  #Agrega el caracter con el error entre "<" y ">"
  nuevaCadena = nuevaCadena * "  <" * cadena[caracterEnLinea] * ">  "

  i = caracterEnLinea + 1

  #Agrega los caracteres posteriores al error
  while i <= length(cadena)
    nuevaCadena = nuevaCadena * cadena[i]
    i = i + 1
  end

  return nuevaCadena
end



















"En esta función eliminamos los caractéres que no afectan la validez de la cadena ni afectan el valor de la expresión."
function eliminarCaracteresIgnorados(cadena)
  #Estos son los caractéres que no son validos de acuerdo a las instrucciones
  caracteresIgnorados = [' ', '\t', '\n']
  #Dejamos el salto de línea para poder identificar la posición de los errores.
  #Eliminamos todos estos caracteres de la cadena
  #Aquí vamos a guardar la posición de los ignorados para que podamos borrarlos al terminar la función

  #Aquí voy a guardar la cadena sin los caracteres ignorados
  nuevaCadena = ""

  #Recorro todos los caracteres de la cadena
  for a in cadena

    #Esta variable va a guardar 1 si el caracter actual no coincide con ninguno de los ignorados, de lo contrario se remplazará con un 0
    noIgnorado = 1
    
    for b in caracteresIgnorados
      if a == b 
        #Si el caracter actual coincide con alguno de los ignorados, guardo 0 en la variable
        noIgnorado = 0
      end
    end

    #Si el caracter actual no coincidió con ninguno de los ignorados, lo guardo en la nueva cadena
    if noIgnorado == 1
      nuevaCadena = nuevaCadena * string(a)
    end
  end
  
  return nuevaCadena
end 
















"Esta función se encarga de verificar si el uso de paréntesis en la cadena dada es adecuado. Esto implica que no se cierren paréntesis antes de abrirse y que al final de la expresión se hayan abierto exactamente la misma cantidad que cerrado."
function parentesisValidos(cadena)
#c representa la cantidad de paréntesis abiertos y cerrados. La cual tiene que ser igual para que sea válida. Si lo es, la función te devuelve un 1. Si no, te devuelve un 0
  c = 0


  #Este contador guarda el caracter que estás revisando actualmente para poder identificar dónde está el error.
  caracterEnLinea = 1
  
  
 for a in cadena 
    if a == '('
      c = c + 1
  #Sumas 1 porque estás abriendo un paréntesis
    elseif a == ')'
  #Restas 1 porque estas cerrando un paréntesis
      c = c-1
    end
  
    if c < 0
  #c nunca puede ser negativo porque significaría que cerraste un paréntesis antes de abrirlo
      errorMarcado = marcaError(cadena, caracterEnLinea)
      throw("Los paréntesis no son válidos. A continuación el error se muestra entre '<' y '>':" * errorMarcado)
    end
    caracteracterEnLinea = caracterEnLinea + 1
  end
#c regresa 1 si la resta de la cantidad de paréntesis abiertos menos la cantidad de paréntesis cerrados es igual a 0 
  if c ==  0
  else 
    throw("Los paréntesis no son válidos, pues no se cierran todos los abiertos.")
  end
end


  









"En esta función verificamos que la cadena no contenca ningún caracter que el intérprete aritmético no acepte."
function caracteresValidos(cadena)
  #tomando en cuenta que ya descartamos los caracteres ignorados
  #Estos son los caractéres que acepta la función de intérprete aritmético para realizar las operaciones. si identifica algún otro, lanza un error
  
  caracteres = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '(', ')', '*', '+']

  #Este contador guarda el caracter que se está revisando actualmente para poder identificar dónde está el error.
  caracterEnLinea = 1

  for caracter in cadena

    if caracter =='0'
    elseif caracter =='1'
    elseif caracter =='2'
    elseif caracter =='3'
    elseif caracter =='4'
    elseif caracter =='5'
    elseif caracter =='6'
    elseif caracter =='7'
    elseif caracter =='8'
    elseif caracter =='9'
    elseif caracter =='.'
    elseif caracter =='('
    elseif caracter ==')'
    elseif caracter =='*'
    elseif caracter =='+'
    else 
      errorMarcado = marcaError(cadena, caracterEnLinea)
      throw("Hay un caracter inválido. A continuación el error se muestra entre '<' y '>':" * errorMarcado)
    end 

    caracterEnLinea = caracterEnLinea + 1
  end
end 















"Verifica si una cadena es únicamente un número. Para ello debe estar conformada por dígitos y a lo más un punto decimal."
function numero(num, inicioNum, cadena)
  #El parámetro inicioNum sirve para relacionar la posición en el candidato a número con la posición en la cadena completa. Por ejemplo, la posición del caracter 1 en el número corresponde al guardado en inicioNum en la cadena original. Por lo tanto, la posición i en número corresponde a la i + inicioNum - 1 en la cadena completa.

  
  #cuenta el total de puntos decimales
  puntos = 0
  #guarda el tamaño del candidato a número
  tam = length(num)
  #Creo una lista con todos los dígitos posibles
  digitos = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.']

  #con esta variable iteramos sobre los caracteres del número
  i = 1
  while i <= tam
    if num[i] == '.'
      puntos = puntos + 1
      if puntos > 1
      #no puede haber más de un punto decimal

        errorMarcado = marcaError(cadena, (i + inicioNum - 1))
        throw("Un número no puede contener más de un punto decimal. A continuación el error se muestra entre '<' y '>': " * errorMarcado)
      end 
    else

      #vamos a comparar el caracter actual con cada uno de los dígitos (y el punto)
      #Con esta variable iteramos sobre los dígitos y el punto
      j = 1
      while j <= length(digitos)
        if digitos[j] == num[i]
          j = length(digitos) + 1
        end

        #Si llegamos al 11, significa que no coincidió con ninguno de los caracteres de la lista, por lo tanto no es propio de un número
        if j == 11 && num[i] != digitos[j]
          errorMarcado = marcaError(cadena, (i + inicioNum - 1))
          throw("Las subexpresiones base son números, por ello no pueden contener caracteres que no sean dígitos ni punto decimal. Entre paréntesis y operadores es solamente donde encontramos los números. Entre '<' y '>' hay un caracter que no es válido en la expresión: " * errorMarcado)
        
        end

         j = j + 1
      end 

     
    end 

    i = i + 1
  end
  
  if tam == 1 && puntos == 1
    errorMarcado = marcaError(cadena, (1 + inicioNum -1))
    throw("Expresión no válida. El número de una subexpresión no contiene ningún dígito. A continuación el error se muestra entre '<' y '>': " * errorMarcado)
  end 
end 











"Las expresiones base deben contener exactamente un número. Antes del número pueden haber paréntesis abiertos y después, paréntesis cerrados."
function subexpresionBase(subexpresion1, inicioSubexpresion, cadena)
  #En esta subexpresión debe haber un número, antes de él pueden haber algunos paréntesis que abren y después, paréntesis que cierra.
  #Busco los índices que marcan el comienzo y el final del número
  inicioNumero = 0

  if length(subexpresion1) == 0
    errorMarcado = marcaError(cadena, (inicioSubexpresion - 1))
    throw("Esta subexpresión está vacía, pues no contiene ningún número y aún así se está intentando operar. A continuación el error se muestra entre '<' y '>': " * errorMarcado )
  end
    


  #El parámetro "inicioSubexpresión, nos permite conocer la posición del caracter que estamos revisando con respecto la cadena completa. Por ejemplo, la posición 1 en la subexpresión corresponde al guardado en inicioSubexpresión en la cadena original. Por lo tanto, la posición i en la subexpresión corresponde a la i + inicioSubexpresión - 1 en la cadena completa
  
  #con esta variable iteramos sobre la subexpresión
   i = 1
   while i <= length(subexpresion1)
     if subexpresion1[i] == '('
  
        if i == length(subexpresion1)

         errorMarcado = marcaError(cadena, (i+ inicioSubexpresion - 1))
         throw("Esta subexpresión está vacía, pues no contiene ningún número. A continuación el error se muestra entre '<' y '>': " * errorMarcado )
           #La expresión solamente abre paréntesis y no contiene ningun dígito. Por lo tanto, no es válida.
        end
                
      elseif subexpresion1[i] == ')'
      
      #No puedo cerrar un paréntesis antes de escribir un número porque tendrías una subexpresión de la forma '()' o ')' sin nada a la izquierda
       errorMarcado = marcaError(cadena, (i+ inicioSubexpresion - 1))
        throw("Esta subexpresión está vacía, pues no contiene ningún número. A continuación el error se muestra entre '<' y '>': " * errorMarcado )
      
      else
      #Después de los paréntesis que abren debe seguir solamente un número (luego de este ya podrían venir paréntesis que cierran)
        
        inicioNumero = i
       break
        
      end

      i = i + 1
    end



  

    finNumero = inicioNumero
            
    while finNumero < length(subexpresion1)
      if subexpresion1[finNumero + 1] != ')'
        #Si el caracter actual no es el último y el siguiente caracter no es un paréntesis que cierra, el número debería tener cifras en el siguiente caracter.
                 
        finNumero = finNumero + 1
     
      else
        #Si el siguiente caracter es un paréntesis que cierra o nos encontramos en la última posición de la subexpresión, ya no hay otro caracter que forme parte del número, así que detenemos el ciclo.
        break
      end
    end
              
        
    
    
    
  
  #Queda verificar que los caracteres después de lo que debería el número sean solamente paréntesis que cierran

    if finNumero < length(subexpresion1)

      #con esta variable voy a iterar sobre el resto de la subexpresión
      i = finNumero  + 1
      while i <=  length(subexpresion1)
        if subexpresion1[i] != ')'

        #No puede haber nada distinto a paréntesis que cierran después del número
          posicionError = i + inicioSubexpresion - 1
          errorMarcado = marcaError(cadena, posicionError)
          throw("Expresión no valida, ya que entre un número y el siguente operador solo pueden haber caracteres '('. A continuación el error se muestra entre '<' y '>': " * errorMarcado)
                
        end

      i = i + 1
      end
    end


  
      
      
  #Ahora tenemos que revisar que lo que debería ser un número que sí cumpla con las carácterísticas para ello
  
  candidatoNumero = subexpresion1[inicioNumero:finNumero]
  numero(candidatoNumero, (inicioNumero + inicioSubexpresion  - 1), cadena)
            
  #Nota que  i + inicioNúmero - 1 es la posición del inicio del número con respecto a la cadena completa
              
end













      
"Esta función nos dice que por cada '+' o '*', vas a 'partir' la expresión y guardar lo anterior. Esto no significa que guardes el '+' o '*' sino que guardas los números antes o despues de. Por ello, buscas un número entre los signos. Donde antes de, solo puede haber paréntesis abiertos y, despues de, solo puede haber paréntesis cerrados."
function subexpresionesNoVacias(cadena)
  #La variable "tam" significa tamaño
  tam = length(cadena)
  posicion = 1

  #Creamos las variables "subexpresión1" para dividir la cadena en dos partes para usar recursión
  subexpresion1 = ""

  
  inicioNuevaSubexpresion = 1
  while posicion <= tam

    #El signo '+' "parte la expresión
    if cadena[posicion] == '+'
        if posicion == 1 || posicion == tam

        #La expresión no puede comenzar ni terminar con '+'
        errorMarcado = marcaError(cadena, posicion)
        throw("La expresión no es valida, pues no puede iniciar ni terminar con el caracter '+'. A continuación el error se muestra entre '<' y '>':" * errorMarcado)
        else

        #Entre cada par de operadores debe haver una subexpresión base, verifico que sea así
        subexpresion1 = cadena[inicioNuevaSubexpresion: posicion - 1]
        subexpresionBase(subexpresion1, inicioNuevaSubexpresion, cadena)
              
      
       end
      #La siguiente subexpresión comienza un caracter después del último operador que la "partió"
      inicioNuevaSubexpresion = posicion + 1

    #El signo '*' parte la subexpresión
    elseif   cadena[posicion] == '*'

        #La expresión no puede comenzar ni terminar con '*'
        if posicion == 1 || posicion == tam
          throw("La expresión no es valida.")
        
        else
          #Entre cada par de operadores debe haver una subexpresión base, verifico que sea así
          subexpresion1 = cadena[inicioNuevaSubexpresion: posicion - 1]
          subexpresionBase(subexpresion1, inicioNuevaSubexpresion, cadena)
        
        end
        #La siguiente subexpresión comienza un caracter después del último operador que la "partió"
        inicioNuevaSubexpresion = posicion + 1
      
    elseif posicion == tam #se llega al final de la cadena cuando ya no hay más operadores que la partan

      #La última subexpresión base que tenemos que verificar es la que va desde el último operador, hasta el final de la cadena
      subexpresion1 = cadena[inicioNuevaSubexpresion: tam]

      subexpresionBase(subexpresion1, inicioNuevaSubexpresion, cadena)
              
      inicioNuevaSubexpresion = posicion + 1
    end

    #Avanzo a la siguiente posición
    posicion = posicion + 1
  end
end











        
"Interpreta a los valores de la cadena como expresiones matemáticas si cumplen los requisitos de la función."
function interpreteAritmetico(cadena)

  #limpiamos la cadena de los caracteres que no afectan el resultado
  cadena =  eliminarCaracteresIgnorados(cadena)

  #Verificamos el orden de los paréntesis y que todo abierto se cierre
  parentesisValidos(cadena)

  #Verificamos uno a uno que los caracteres sean válidos
  caracteresValidos(cadena)

  # "Partimos" la expresión con cada operador y verificamos que cada subexpresión obtenida contenga un número y sea de la forma adecuada
  subexpresionesNoVacias(cadena)

  #Si ninguna de las funciones anteriores marcó error, entonces la expresión es válida, así que la podemos transformar a un float
  resultado = float(eval(Meta.parse(cadena)))
  return resultado
  
end
