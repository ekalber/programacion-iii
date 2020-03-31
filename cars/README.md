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


# Iteración 2

# Si estás bajando el proyecto por primera vez, es probable que tengas que ejecutar los siguientes comandos:

bundle
yarn install --check-files
rake db:migrate

# Creamos un recurso para administrar las marcas

rails g scaffold Brand name:string fundation:date

# Eliminamos el campo marca (un texto) del vehículo

rails g migration RemoveBrandFromCars brand:string

# Agregamos nuevos campos a vehículo: puertas y color

rails g migration AddDoorsAndColorToCars doors:integer color:string

# Ejecutamos las migraciones para efectuar los cambios en la base de datos

rake db:migrate

# Instalamos dos gemas, populator y faker (ver configuración en Gemfile). Agregamos código en seeds para generar datos aleatorios y luego ejecutamos la tarea:

rake db:seeds

# Relacionamos el vehículo con la marca. En la migración el campo brand_id permitimos que sea nulo

rails g migration AddBrandIdToCars brand:references

# Creamos un recurso para administrar accesorios

rails g scaffold Accessory name:string

# Ejecutamos el generador de modelo para la tabla de relación entre accesorio y vehículo y no dió error pero advertimos que quedo mal...

rails g model AccessoriesCar car:references accessory:reference

# Para volver atrás usamos el generador de tipo "destroy" que nos borra todos los archivos para poder volver a generar correctamente:

rails d model AccessoriesCar car:references accessory:reference

# Ahora sí, modelo y migración para la tabla de relación:

rails g model AccessoryCar car:references accessory:references

# Ejecutamos las migraciones pendientes

rake db:migrate

# Luego agregamos un combo de selección de marca en el formulario de vehículos. También agregamos el nuevo campo en el controlador de vehículos. 

# Agregamos los helpers de asociación entre modelos en cada uno de los modelos (belongs_to, has_many, etc.)

# Agregamos validaciones.