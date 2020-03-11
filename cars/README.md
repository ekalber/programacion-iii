# Iteración 1

# Muestra las versiones de ruby instaladas

ekalber@vm03-isi:~$ rvm list

# Muestra los gemset creados. Un gemset es un conjunto de gemas y sus versiones, las cuales son utilizadas en un proyecto. Podemos tener diferentes gemset con diferentes versiones de gemas para aplicar a diferentes proyectos.

ekalber@vm03-isi:~$ rvm gemset list

# Crea un nuevo gemset

ekalber@vm03-isi:~$ rvm gemset create car_sales

# Seleccionar el gemset a utilizar
ekalber@vm03-isi:~$ rvm gemset use car_sales

# Permite instalar un gema específica por ejemplo, gem install rails instala la última versión de rails.

ekalber@vm03-isi:~$ gem install rails


# Crea un nuevo proyecto rails. Crea una nueva carpeta con el nombre del proyecto y dentro de la carpeta toda la estructura de carpetas y archivos del proyecto.

ekalber@vm03-isi:~$ rails new cars


# Creamos el archivo ".ruby-gemset" dentro de la carpeta del proyecto con el nombre "car_sales" para que al entrar a la carpeta se seleccione automaticamente el gemset que corresponde

# Muy importante! Entramos a la carpeta del proyecto. Se debería haber seleccionado el gemset correspondiente

ekalber@vm03-isi:~$ cd cars


# Crea el recurso Car, (Modelo, Controlador, Vista, Migracion, Rutas) con los atributos de brand y model tipo string y year de tipo integer.

ekalber@vm03-isi:~$ rails g scaffold Car brand:string model:string year:integer

# Ejecuta las migraciones generadas para actualizar los cambios en la base de datos.

ekalber@vm03-isi:~$ rake db:migrate

# Levanta el servicio de la aplicación localmente en el puerto 3000. Se accede desde el navegador locoahost:3000

ekalber@vm03-isi:~$ rails s

# Entrar al recurso de administración de vehículos: http://localhost:3000/cars