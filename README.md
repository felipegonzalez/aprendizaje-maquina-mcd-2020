# Aprendizaje de Máquina (ITAM, Otoño 2020)

Notas y material para el curso de Aprendizaje de Máquina

- [Notas](https://lucid-torvalds-517e78.netlify.app). Estas notas son producidas
en un contenedor de [Docker](https://www.docker.com/products/docker-desktop) (con imagen base de [rocker *verse*](https://www.rocker-project.org), y unos
8G de memoria) construido con el Dockerfile del repositorio. 

```
# Crear un directorio de trabajo para almacenar el dockerfile
mkdir Dockerfile
cd Dockerfile

# Crear o guardar el archivo dockerfile
nano dockerfile

docker build -t ml-rstudio:1.0.0 .

# Verificar la creación de la imagen 
docker images

# En caso de no crearse el nombre de la imagen no se podrá ejecutar contenedor de docker y se observará REPOSITORY: <none> TAG: <none>
# En este caso se deberá asignar el nombre mediante el hash (IMEGE ID) de la imagen recién creada
docker tag 3cf59a832507 ml-rstudio:1.0.0

docker run --rm -d -p 8787:8787 -e PASSWORD=my_password -v /path/a/carpeta/local:/home/rstudio/machine_learning --name ml-rstudio ml-rstudio:1.0.0
```

### Contribuciones

En años anteriores han contribuido a este repositorio:

- Cinco o más commits: [AlejandraLLI](https://github.com/AlejandraLLI), [mkokotchikova](https://github.com/mkokotchikova), [Cesar Zamora Martinez](https://github.com/czammar)
- Menos de cinco commits: [FedericoGarza](https://github.com/FedericoGarza), [juanber91](https://github.com/juanber91), [MrFranciscoPaz](https://github.com/MrFranciscoPaz)

