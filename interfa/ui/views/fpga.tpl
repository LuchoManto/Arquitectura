% rebase('base.tpl')

<!--Main div to insert in base-->
<div id="main_div_module" class="container main_container">
    <!-- Send specific serial div-->
    <div id="specific_serial" class="container padding_top30">
        <div class="col-xs-2">
          <label class="control-label">Enviar por serial: </label>
        </div>
        <div class="col-xs-6">
          <input id="send_serial_input" class="form-control" type="text" placeholder="data to send">
        </div>
        <div class="col-xs-2">
            <button id="send_serial_button" class="btn btn-primary">Send</button>
        </div>
    </div>
    <!-- Paso -->
    <div id="engine_value" class="container padding_top20">
        <div class="col-xs-2">
            <label class="control-label">Ejecucion: </label>
        </div>
        <div class="col-xs-2">
            <button type="button" class="btn btn-primary send_serial" value="P">PASO</button>
        </div>
        <div class="col-xs-2">
            <button type="button" class="btn btn-success send_serial" value="C">CONTINUO</button>
        </div>
        <div class="col-xs-2">
            <button type="button" class="btn btn-warning send_serial" value="R">RESET</button>
        </div>
    </div>
    <!-- COM SELECT -->
    <div id="com_select" class="container padding_top20">
        <div class="col-xs-2">
            <label class="control-label">COM disponibles: </label>
        </div>
        <div class="col-xs-2">
            <div class="btn-group">
                <select id="com_dropdown" class="form-control" name="com_dropdown">
                        <!--<option selected="" disabled="" hidden="" value=""></option>-->
                </select>
            </div>
        </div>
        <div class="col-xs-2">
            <button id='conectar_uart' type="button" class="btn btn-success">Conectar</button>
        </div>
        <div class="col-xs-2">
            <button id="actualizar_coms" type="button" class="btn btn-primary">Actualizar</button>
        </div>
        <div class="col-xs-2">
            <button id="desconectar_com" type="button" class="btn btn-danger">Desconectar</button>
        </div>
    </div>
    <div class="container">
        <h2>Bordered Table</h2>
        <p>The .table-bordered class adds borders to a table:</p>
        <table class="table table-bordered">
        <thead>
          <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
          </tr>
          <tr>
            <td>Mary</td>
            <td>Moe</td>
            <td>mary@example.com</td>
          </tr>
          <tr>
            <td>July</td>
            <td>Dooley</td>
            <td>july@example.com</td>
          </tr>
        </tbody>
        </table>
    </div>

</div>

<!--actualizar la lista de coms-->
<script>
$("#actualizar_coms").click(function(e){
    e.preventDefault();
    $('#com_dropdown').empty();
    //Post with the button
    $.getJSON('/getcoms',
        function(data)
        {
            for (key in data){
            $('#com_dropdown').append('<option value="'+ data[key] +'">'+ data[key] +'</option>');
            }

            //$('#com_dropdown').append('<li><a value="' + data[key] + '" href="#">' + data[key] + '</a></li>');
            //$('#renglon_2').html(data['renglon2'])
        }
        )
        .fail(function(){
                console.log("Error actualizando la pantalla del gps");
              }
    );
});
</script>


<!--Conectar al COM-->
<script>
$("#conectar_uart").click(function(e){
    e.preventDefault();
    //Post with the button
    $.ajax({
        url: '/conectar_serial/' + $("#com_dropdown").val(),
        cache:false, type: 'POST'
    });
});
</script>


<!--Desconectar el COM-->
<script>
$("#desconectar_com").click(function(e){
    e.preventDefault();
    //Post with the button
    $.ajax({
        url: '/desconectar_com',
        cache:false, type: 'POST'
    });
});
</script>


<!--Script when send a specific value-->
<script>
$("#send_serial_button").click(function(e){
    e.preventDefault();
    //Post with the button
    $.ajax({
        url: '/send_serial/' + $("#send_serial_input").val(),
        cache:false, type: 'POST'
    });
});
</script>

<!--Script to send value of button by serial-->
<script>
$(".send_serial").click(function(e){
    e.preventDefault();
    //Post to connect
    $.ajax({
        url: '/send_serial/' + $(this).attr("value"),
        cache:false, type: 'POST'
    });
});
</script>
