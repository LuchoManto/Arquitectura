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
        <h2>Valores de senales</h2>
        <table class="table table-bordered" id="tablasenales">
            <thead>
              <tr>
                <th>PCF</th>
                <th>InstrD</th>
                <th>MemReadD</th>
                <th>RegWriteD</th>
                <th>MemtoRegD</th>
                <th>MemWriteD</th>
                <th>ALUControlID</th>
                <th>ALUSrcD</th>
                <th>RegDstD</th>
                <th>BranchD</th>
                <th>StallF</th>
                <th>StallD</th>
                <th>ForwardAD</th>
                <th>ForwardBD</th>
                <th>FlushE</th>
                <th>ForwardAE</th>
                <th>ForwardBE</th>
                <th>Mem80</th>
                <th>Mem81</th>
                <th>Mem82</th>
                <th>Mem83</th>
                <th>Reg0</th>
                <th>Reg1</th>
                <th>Reg2</th>
                <th>Reg3</th>
                <th>Reg4</th>
                <th>Reg5</th>
                <th>Reg6</th>
                <th>Reg7</th>
                <th>Reg8</th>
                <th>Reg9</th>
                <th>Reg10</th>
                <th>Reg11</th>
                <th>Reg12</th>
                <th>Reg13</th>
                <th>Reg14</th>
                <th>Reg15</th>
                <th>Reg16</th>
                <th>Reg17</th>
                <th>Reg18</th>
                <th>Reg19</th>
                <th>Reg20</th>
                <th>Reg21</th>
                <th>Reg22</th>
                <th>Reg23</th>
                <th>Reg24</th>
                <th>Reg25</th>
                <th>Reg26</th>
                <th>Reg27</th>
                <th>Reg28</th>
                <th>Reg29</th>
                <th>Reg30</th>
                <th>Reg31</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

</div>

<!--Actualizar la lista de coms-->
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
        }
        )
        .fail(function(){
                console.log("Error actualizando la pantalla del gps");
              }
    );
});
</script>

<!--Cuando presiono alguno de los botones prefijados para enviar un valor por serial-->
<script>
$(".send_serial").click(function(e){
    e.preventDefault();
    //Post to connect
    $.ajax({
        url: '/send_serial/' + $(this).attr("value"),
        cache:false, type: 'POST'
    });

    //Espero 2 segundos para pedir los datos
    setTimeout(newfila, 1000);
});
</script>

<!--Cuando preciono enviar en el input de serial-->
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

<!--Key listener-->
<script>
window.onkeyup = function(e) {
    var key = e.keyCode ? e.keyCode : e.which;
    if (key == 80) {
        e.preventDefault();
        //Post to connect
        $.ajax({
            url: '/send_serial/P',
            cache:false, type: 'POST'
        });
        setTimeout(newfila, 1000);
    }else if (key == 67) {
        e.preventDefault();
        //Post to connect
        $.ajax({
            url: '/send_serial/C',
            cache:false, type: 'POST'
        });
        setTimeout(newfila, 1000);
    }else if (key == 82) {
       e.preventDefault();
        //Post to connect
        $.ajax({
            url: '/send_serial/R',
            cache:false, type: 'POST'
        });
    }
}
</script>

<!--Funcion de nueva fila-->
<script>
function newfila()
{
    $.getJSON('/getdatos',
    function(dato)
    {
        var table = document.getElementById("tablasenales");
        var row = table.insertRow(-1);

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);
        var cell8 = row.insertCell(7);
        var cell9 = row.insertCell(8);
        var cell10 = row.insertCell(9);
        var cell11 = row.insertCell(10);
        var cell12 = row.insertCell(11);
        var cell13 = row.insertCell(12);
        var cell14 = row.insertCell(13);
        var cell15 = row.insertCell(14);
        var cell16 = row.insertCell(15);
        var cell17 = row.insertCell(16);
        var cell18 = row.insertCell(17);
        var cell19 = row.insertCell(18);
        var cell20 = row.insertCell(19);
        var cell21 = row.insertCell(20);
        var cell22 = row.insertCell(21);
        var cell23 = row.insertCell(22);
        var cell24 = row.insertCell(23);
        var cell25 = row.insertCell(24);
        var cell26 = row.insertCell(25);
        var cell27 = row.insertCell(26);
        var cell28 = row.insertCell(27);
        var cell29 = row.insertCell(28);
        var cell30 = row.insertCell(29);
        var cell31 = row.insertCell(30);
        var cell32 = row.insertCell(31);
        var cell33 = row.insertCell(32);
        var cell34 = row.insertCell(33);
        var cell35 = row.insertCell(34);
        var cell36 = row.insertCell(35);
        var cell37 = row.insertCell(36);
        var cell38 = row.insertCell(37);
        var cell39 = row.insertCell(38);
        var cell40 = row.insertCell(39);
        var cell41 = row.insertCell(40);
        var cell42 = row.insertCell(41);
        var cell43 = row.insertCell(42);
        var cell44 = row.insertCell(43);
        var cell45 = row.insertCell(44);
        var cell46 = row.insertCell(45);
        var cell47 = row.insertCell(46);
        var cell48 = row.insertCell(47);
        var cell49 = row.insertCell(48);
        var cell50 = row.insertCell(49);
        var cell51 = row.insertCell(50);
        var cell52 = row.insertCell(51);
        var cell53 = row.insertCell(52);

        cell1.innerHTML = dato['PCF'];
        cell2.innerHTML = dato['InstrD'];
        cell3.innerHTML = dato['MemReadD'];
        cell4.innerHTML = dato['RegWriteD'];
        cell5.innerHTML = dato['MemtoRegD'];
        cell6.innerHTML = dato['MemWriteD'];
        cell7.innerHTML = dato['ALUControlID'];
        cell8.innerHTML = dato['ALUSrcD'];
        cell9.innerHTML = dato['RegDstD'];
        cell10.innerHTML = dato['BranchD'];
        cell11.innerHTML = dato['StallF'];
        cell12.innerHTML = dato['StallD'];
        cell13.innerHTML = dato['ForwardAD'];
        cell14.innerHTML = dato['ForwardBD'];
        cell15.innerHTML = dato['FlushE'];
        cell16.innerHTML = dato['ForwardAE'];
        cell17.innerHTML = dato['ForwardBE'];
        cell18.innerHTML = dato['Mem1'];
        cell19.innerHTML = dato['Mem2'];
        cell20.innerHTML = dato['Mem3'];
        cell21.innerHTML = dato['Mem4'];
        cell22.innerHTML = dato['out0'];
        cell23.innerHTML = dato['out1'];
        cell24.innerHTML = dato['out2'];
        cell25.innerHTML = dato['out3'];
        cell26.innerHTML = dato['out4'];
        cell27.innerHTML = dato['out5'];
        cell28.innerHTML = dato['out6'];
        cell29.innerHTML = dato['out7'];
        cell30.innerHTML = dato['out8'];
        cell31.innerHTML = dato['out9'];
        cell32.innerHTML = dato['out10'];
        cell33.innerHTML = dato['out11'];
        cell34.innerHTML = dato['out12'];
        cell35.innerHTML = dato['out13'];
        cell36.innerHTML = dato['out14'];
        cell37.innerHTML = dato['out15'];
        cell38.innerHTML = dato['out16'];
        cell39.innerHTML = dato['out17'];
        cell40.innerHTML = dato['out18'];
        cell41.innerHTML = dato['out19'];
        cell42.innerHTML = dato['out20'];
        cell43.innerHTML = dato['out21'];
        cell44.innerHTML = dato['out22'];
        cell45.innerHTML = dato['out23'];
        cell46.innerHTML = dato['out24'];
        cell47.innerHTML = dato['out25'];
        cell48.innerHTML = dato['out26'];
        cell49.innerHTML = dato['out27'];
        cell50.innerHTML = dato['out28'];
        cell51.innerHTML = dato['out29'];
        cell52.innerHTML = dato['out30'];
        cell53.innerHTML = dato['out31'];

        for (i = 0; i < 53; i++) {
            if(table.rows[table.rows.length-1].cells[i].innerHTML != table.rows[table.rows.length-2].cells[i].innerHTML){
                table.rows[table.rows.length-1].cells[i].bgColor='#F98383';
            }
        }

        window.scrollBy(0, 10000);
    }
    )
    .fail(function(){
            console.log('Error actualizando la tabla de senales');
          }
    );
}
</script>