# Actualización 

Se implementó el target Push Notification Service Extension, por lo cual ahora podemos mostrar las alertas aún si el app ha sido victima de un force-quit desde el Springboard. Para ello es necesario utilizar la bandera ``mutable-content``en el cuerpo del aps de la notificación push.

``` swift
{
  "aps" : {
       "alert": "Notification",
       "mutable-content" : 1
   },
   "times" : 1, //Variable necesaria en este proyecto de prueba, No. de notificaciones locales queremos mostrar
   "timer" : 5  //Variable necesaria en este proyecto de prueba, intervalo en segundos entre notificaciones
}
```

En la siguiente imagen se muestra el efecto del ``mutable-content:0`` (notificación inferior), ``mutable-content:1`` (notificación de enmedio), y la notificación superior es la notificación local que dispara el servicio extendido de notificaciones.

<p align="center">
  <img src="imagenes/IMG_0607.png" alt="Your image title" width="250"/>
</p>

# Prueba Notificaciones
Prueba de notificaciones en background

Aplicación de prueba para probar notificaciones en background y ejecutar una serie de recordatorios periodicos, en un intervalo dado, vía notificación local. Para la aplicación de ejemplo al recibir una notificación se emiten 5 notificaciones en un intervalo de 5 segundos entre cada notificación.

Al iniciar la aplicación en background y recibir una notificación push con la bandera ``content-avaliable`` la aplicación es capaz de ejecutar código durante 30 segundos hasta que el tiempo de ejecución en background llegue a 0. Cuando el tiempo ha expirado y se recibe una nueva notificación la aplicación vuelve a despertar en modo background por 30 segundos más.

Para el funcionamiento se realizaron pruebas con la aplicación [Easy APNs Provider](https://apps.apple.com/us/app/easy-apns-provider-push-notification-service-testing-tool/id989622350?mt=12), para realizar la implementación en el servidor se recomienda ver la documentación de apple sobre el cuerpo de los mensajes de notificación a enviar [(ver documentación de apple)](https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app). En la siguiente imagen se muestran los parámetros de la notificación en la aplicación Easy APNs Provider y los resultados en consola de la depuración de la aplicación:

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

En el dispositivo es necesario verificar que la actualización en 2o. plano está activada para la aplicación, como se muestra en las siguientes imagenes:

<p align="center">
  <img src="imagenes/IMG_0593.png" alt="Your image title" width="250"/>
  <img src="imagenes/Captura_de_Pantalla_2019-07-26_1.34.58.png" width="250">
</p>

# Consideraciones especiales

Desde la versión 11 de iOS las notificaciones tienen caracterísitcas importantes [(ver documentación apple)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623013-application) y por tanto la aplicación sólo recibe notificaciones en background si la aplicación no ha sido cerrada forzosamente por el usuario (desde el springboard), es decir, las notificaciones sólo llegarán si el usuario abrió la aplicación y no ha realizado force-quit en la aplicación o si el dispositivo ha sido reiniciado.

Se anexa un ejemplo de la mitigación realizada por otras aplicaciones manteniendo la implementación de notificacion estándar.

<p align="center">
  <img src="imagenes/weird-ios-11-bug-blocks-whatsapp-notifications-on-the-iphone-518486-2.jpg"  width="250"/>
</p>
