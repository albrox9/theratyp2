# THERATYP

TheraTyp es una propuesta que tiene el objetivo de seguir creciento para hacer una app rapida y accesible.
Se orienta en los cuidados de salud. El objetivo es tener un buscador limitado a los typ del día que suban los creadores.

Siguiendo la linea del primer trimestre se han añadido:

* Sign in y sign up con Google.
* Cargar el perfil con los datos recogidos del registro de google, foto incluida.
* Conseguir editar el perfil y adjuntar una foto de la galeria propia del telefono y que aparezca.
* Recuperar la foto subida en la configuracion del perfil y mostrarla.
* Guardar las fotos subidas en Firebase Storage.
* Opción de recuperación de correo, mediante email al usuario a través de firebase.
* Conectar con la API REST de Youtube, para poder hacer busquedas.
* Reproducir los videos que arroja la busqueda clicando sobre ellos.

Los siguientes pasos sería realizar una coleccion con las busquedas y los favoritos de cada usuario.


## Uso/instrucciones

### Sign In VIEW

* Tenemos dos formas. Correo y contraseña / Google.
* Texto resaltado para resetear contraseña.
* Texto resaltado para ir al registro.

### Sign Up VIEW

La app dispone de 2 tipos de registro:

* Registro a través de correo y contraseña.
* Registro a través de cuenta de Google.


### HOME VIEW

* Acceso al menu del perfil a través de un icono. Podemos Visualizar nuestra foto y nombre.
* Tenemos la opción de salir.
* Las opciones de favoritos y busqueda se habilitarán en el futuro.


### REGISTRO.
Si es la primera vez que ingresa en la app:

* La app redirige a la pantalla de editar perfil directamente si no lo tiene.
* Desde ahí ya se puede ver la home y el menu de perfil donde aparecen foto y nombre.
* Puedes realizar una busqueda, aunque aparece una con tips de salud por defecto.
* Si se hace clic en cualquiera de las imagenes de los videos, se abre un reproductor para verlos.
* Puedes elegir la velocidad a la que quieres ver el video con el botón de la derecha.

Si no es la primera vez que ingresa en la app:

* Tus datos del pefil aparecen directamente, aún así puedes editarlos si quieres.
* Puedes hacer tus busquedas como en el paso anterior.
* Por economia se limita el numero de videos, ya que las llamadas a la API tienen limite.

### SPLASH VIEW.

* Comprobara si tienes pefil o no, y en funcion de eso te llevara a la edicion o a la home.

### DISTRIBUCION

* La app estara disponible para Android en Google Play. 
