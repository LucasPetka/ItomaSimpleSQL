<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Itoma</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    </head>
    <body>

    <div class="container">
        <h3 class="mt-4"><i class="fas fa-map-marked-alt"></i> Cars</h3>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Number</th>
                <th scope="col">Year Made</th>
                <th scope="col">Model</th>
                <th scope="col">Owner</th>
                <th scope="col">Car Status</th>
                <th scope="col">Previous owner</th>
              </tr>
            </thead>
            <tbody>

              @if(count($cars) > 0)
                @foreach ($cars as $key => $car)
                <tr>
                    <th scope="row">{{ ++$key }}</th>
                    <td>{{ $car->number }}</td>
                    <td> {{ $car->year_made }}</td>
                    <td> {{ $car->model }}</td>
                    <td> {{ $car->owner }}</td>
                    <td> {{ $car->car_status }}</td>
                    <td> 
                    
                        @if(isset($car->previous_owner))
                            {{  $car->previous_owner }}
                        @else
                            No previous owner
                        @endif
                
                    </td>
                </tr>
                @endforeach
              @endif

            </tbody>
          </table>
        </div>

        
    </div>
        






    </body>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
