<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Car;
use App\User;
use App\Segment;
use App\Status;
use App\Car_Status;
use App\Car_Management;


class PagesController extends Controller
{
    
    //Index page to load up
    public function index()
    {
        //$cars = Car_Management::all();

        $cars = DB::select("SELECT 
                            number, /* car number */
                            year_made, /* car year made */
                            model, /* car model */
                            CONCAT(segments.name,' | ',users.name) AS owner, /* car current owner */
                            statuses.name AS car_status,    /* car status */

                            (SELECT CONCAT(segments.name,' | ',users.name)
                            FROM
                                    (
                                        SELECT  A.user_id,
                                                A.segments_id,
                                                A.cars_id,
                                                (
                                                    SELECT 	COUNT(*)
                                                    FROM 	car_management c
                                                    WHERE 	c.cars_id = a.cars_id AND
                                                            c.date_to >= a.date_to AND 
                                                            c.date_from < CURRENT_DATE) AS RowNumber

                                        FROM 	car_management a
                                    ) x
                                INNER JOIN users ON user_id = users.id
                                INNER JOIN segments ON segments_id = segments.id
                            WHERE   RowNumber = 2 AND cars_id = cars.id) AS previous_owner    /* car previous owner */
                            
                            FROM cars

                            INNER JOIN car_management ON car_management.cars_id = cars.id
                            INNER JOIN segments ON car_management.segments_id = segments.id
                            INNER JOIN users ON car_management.user_id = users.id
                            INNER JOIN car_status ON car_status.cars_id = cars.id
                            INNER JOIN statuses ON statuses.id = car_status.status_id
                            
                            WHERE car_management.date_from <= CURRENT_DATE AND car_management.date_to >= CURRENT_DATE");


        return view('welcome')->with(compact('cars'));
    }

}
