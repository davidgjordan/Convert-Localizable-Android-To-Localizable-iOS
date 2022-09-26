# Convert-Localizable-Android-To-Localizable-iOS

Convert Localizable Android files(XML) to Localizable iOS files(string).
### Steps:
1. Clone the project
```sh
$ git clone https://github.com/davidgjordan/Convert-Localizable-Android-To-Localizable-iOS.git
```
2. Replace the content of string-android.xml file by your content.
3. Open a terminal and run the command.
```sh
$ ./convert.sh
```
4. Check the output in `string-ios.txt` file.

##### You are done!


Note: If any value contains `"`, it will be replaced by `“` to avoid compilation problems.


#### Example Input:

```sh
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="event_on_call_updated">¡En Llamada Actualizado!</string>
    <string name="syncing_data">Sincronizando datos…</string>
    <string name="sync_complete">Sincronizacion de datos completos!</string>
    <string name="sync_failed">Error en sincronizacion de datos. Por favor revise su conexion.</string>
    <string name="sync_status_not_synced">Sin sincronizar</string>
    <string name="sync_status_will_sync">Se va a sincronizar</string>
    <string name="sync_status_processing">Sincronizando…</string>
    <string name="sync_status_failed">Fallo la sincronizacion</string>
    <string name="sync_status_conflict">Conflicto</string>
    <string name="login_api_key_hint">Clave de API</string>
    <plurals name="login_toast_dev_mode">
        <item quantity="one">¡Esta a %1$d toque de desbloquear el modo de Desarrollador de MYAPP!</item>
        <item quantity="other">¡Esta a %1$d toques de desbloquear el modo de Desarrollador de MYAPP!</item>
    </plurals>

    <string-array name="environment_array">
        <item>Produccion</item>
        <item>Entorno Aislado</item>
    </string-array>

    <!-- Time Labels -->
    <plurals name="minute_display">
        <item quantity="one">%1$d minuto</item>
        <item quantity="other">%1$d minutos</item>
    </plurals>

    <plurals name="hour_display">
        <item quantity="one">%1$d hora</item>
        <item quantity="other">%1$d horas</item>
    </plurals>

    <string name="app_terms_conditions">
        <![CDATA[<html>
        <body>
        <b>MYAPP \"MOBILE APPLICATION\" END USER “LICENSE“ AGREEMENT</b>\n
        </body>
        </html>]]>
        </string>

    <string name="row_last_synced">Ultima sincronizacion</string>


</resources>
```


#### Example Output:
```sh
"event_on_call_updated" = "¡En Llamada Actualizado!"
"syncing_data" = "Sincronizando datos…"
"sync_complete" = "Sincronizacion de datos completos!"
"sync_failed" = "Error en sincronizacion de datos. Por favor revise su conexion."
"sync_status_not_synced" = "Sin sincronizar"
"sync_status_will_sync" = "Se va a sincronizar"
"sync_status_processing" = "Sincronizando…"
"sync_status_failed" = "Fallo la sincronizacion"
"sync_status_conflict" = "Conflicto"
"login_api_key_hint" = "Clave de API"
"login_toast_dev_mode" = " <item quantity=“one“>¡Esta a %1$d toque de desbloquear el modo de Desarrollador de MYAPP!</item> <item quantity=“other“>¡Esta a %1$d toques de desbloquear el modo de Desarrollador de MYAPP!</item>"
"environment_array" = " <item>Produccion</item> <item>Entorno Aislado</item>"



// <!-- Time Labels -->
"minute_display" = " <item quantity=“one“>%1$d minuto</item> <item quantity=“other“>%1$d minutos</item>"
"hour_display" = " <item quantity=“one“>%1$d hora</item> <item quantity=“other“>%1$d horas</item>"
"app_terms_conditions" = " <![CDATA[<html> <body> <b>MYAPP “MOBILE APPLICATION“ END USER “LICENSE“ AGREEMENT</b>n </body> </html>]]>"
"row_last_synced" = "Ultima sincronizacion"

```