# Instrucciones de Uso - Intérprete Chi (V 1.0 - 31/3/2026)

La idea de este ejecutable es que puedan programar en chi usando sintaxis concreta y ver los resultados de sus programas.

## Cómo ejecutar el intérprete

Para probar un archivo con código fuente `.chi`, utiliza el ejecutable `chi.exe` desde la terminal:

```powershell
.\chi.exe <ruta_al_archivo.chi>
```

Por ejemplo:
```powershell
.\chi.exe ejemplos\test1.chi
```

## Reglas de Sintaxis Importantes

### Identificadores y constructores
- ** Bug identificado:** Todos los identificadores (nombres de variables, parámetros de lambdas, etc.) **deben empezar estrictamente con una letra**. Esto no es un requisito de chi, sino de librerías externas que nos facilitan el trabajo.
- Pueden contener letras, números, guiones bajos (`_`) o comillas simples (`'`) después del primer carácter. 

## Estructura de Archivos
- `chi.exe`: Ejecutable final que conecta todo.
- `tests/`: Carpeta con ejemplos de prueba.
