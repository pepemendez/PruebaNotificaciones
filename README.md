# PruebaNotificaciones
Prueba de notificaciones en background

Aplicación de prueba para probar notificaciones en background y ejecutar una serie de recordatorios via notificación local periodicos en un intervalo dado. Para la aplicación de ejemplo al recibir una notificación se emiten 5 notificaciones en un intervalo de 5 segundos entre cada notificación.

Al iniciar la aplicación en background y recibir una notificación push con la bandera content-avaliable la aplicación es capaz de ejecutar código durante 30 segundos hasta que el tiempo de background llegue a 0. Cuando el tiempo ha expirado la aplicación vuelve a despertar en modo background por 30 segundos más.

Para el funcionamiento se realizaron pruebas con la aplicación Easy APNs Provider como se muestra en la siguiente imagen y la depuración en consola, como se muestra en la siguiente imágen:

<!--
    Esta es otra manera de añadir una imagen, utilizamos html para centrar la imagen en el contenedor
  ![Screenshot](imagenes/Captura_de_Pantalla_2019-07-26.png)
-->

<p align="center">
  <img src="imagenes/Captura_de_Pantalla_2019-07-26.png" alt="Your image title"/>
</p>

De mismo modo, en la siguiente imágen se ejemplifica el funcionamiento de la notificación inicial y las siguientes notificaciones programadas:

<p align="center">
  <img src="imagenes/IMG_0592.png" alt="Your image title" width="250"/>
</p>

Con respecto a la aplicación es necesario añadir las capabilities de background modes: Background fetch y Remote notifications, como se muestra en la siguiente imagen:

<p align="center">
  <img src="imagenes/enabling background modes.png" alt="Your image title"/>
</p>
