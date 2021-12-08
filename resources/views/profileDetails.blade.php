<x-app-layout>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

<script type="text/javascript"
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
</script>

<script>
  $(window).on('load', function() {
    var id = '{{ $usr->id }}';

    $.ajax({
          method:'POST',
          url:'{{ route("matchCheck")}}',
          dataType: 'json',
          data : {
              '_token':'{{ csrf_token()}}',
                  id: id,
          },
          success: function(res){

            if(res>0){
              alert("Congratulations! it's a match");
            }
         
          }
      });
});

</script>

<script type="text/javascript">

    function initialize() {

    var lat = document.getElementById('txtlat').value;
    var lon = document.getElementById('txtlon').value;
    var myLatlng = new google.maps.LatLng(lat, lon) // This is used to center the map to show our markers
    var mapOptions = {
    center: myLatlng,
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    marker: true
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    var marker = new google.maps.Marker({
    position: myLatlng
    });
    marker.setMap(map);
    }

</script>
<script type="text/javascript">

    function resp() {


      var id = '{{ $usr->id }}';

      $.ajax({
            method:'POST',
            url:'{{ route("match")}}',
            dataType: 'json',
            data : {
                '_token':'{{ csrf_token()}}',
                    id: id,
            },
            success: function(res){

              alert(res);
           
            }
        });
    }

</script>


<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica,
    Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

.main-container {
  padding: 60px;
}

/* HEADING */

.heading {
  text-align: center;
}

.heading__title {
  font-weight: 600;
}

.heading__credits {
  margin: 10px 0px;
  color: #888888;
  font-size: 25px;
  transition: all 0.5s;
}

.heading__link {
  text-decoration: none;
}

.heading__credits .heading__link {
  color: inherit;
}
hr {
border-top: 1px solid #007bff;
width:70%;
}

a {color: #000;}


.card{
    background-color: #FFFFFF;
    padding:0;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius:4px;
    box-shadow: 0 4px 5px 0 rgba(0,0,0,0.14), 0 1px 10px 0 rgba(0,0,0,0.12), 0 2px 4px -1px rgba(0,0,0,0.3);
}


.card:hover{
    box-shadow: 0 16px 24px 2px rgba(0,0,0,0.14), 0 6px 30px 5px rgba(0,0,0,0.12), 0 8px 10px -5px rgba(0,0,0,0.3);
    color:black;
}

address{
  margin-bottom: 0px;
}

#map_canvas { height: 100% }


#author a{
  color: #fff;
  text-decoration: none;
    
}

</style>

  <x-slot name="header">
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
          {{ __('Dashboard') }}
      </h2>
  </x-slot>

  <div class="main-container">
    <div class="container-fluid">
      <div class="row">
        
        <div style="margin: auto;" class="col-md-4 mt-5">
          <div class="card text-center">
            <img class="card-img-top"  src="{{ $usr->profile_photo_url }}" alt="Card image cap">
            <div class="card-body">
              <h3 class="card-title">{{$usr->name}}</h3>
              <h5 class="card-title">{{$usr->gender}}</h5>
              <h5 class="card-title">
                <?php
                  $age = \Carbon\Carbon::parse($usr->dob)->diff(\Carbon\Carbon::now())->format('%y years');
                  echo $age;
                 ?>
              </h5>
              <hr>
              <p>
                <a onclick="javascript:initialize()" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map"></i> See Location
                </a>
              </p>
              <div class="collapse" id="collapseExample">
                <input type="hidden" id="txtlat" value="{{ $usr->latitude}}" />
                <input type="hidden" id="txtlon" value="{{ $usr->longitude}}" />
                <div id="map_canvas" style="width: 100%; height: 250px"></div>
              </div>
            </div>
            <div class="card-footer text-muted">
              <div class="row">
                <div class="col">
                  <a href="{{route('user.disliked',$usr->id)}}"><i class="far fa-thumbs-down"></i></a>
                </div>
                <div class="col">
                  <a href="{{url('/chatify',$usr->id)}}"><i class="far fa-comments"></i></a>
                </div>
                <div class="col">
                  <a href="" onclick="javascript:resp()"><i class="far fa-thumbs-up"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
  
      </div>
    </div>
    
  </div>
        
</x-app-layout>
