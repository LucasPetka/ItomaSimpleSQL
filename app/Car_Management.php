<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use App\Car;
use App\Segment;

class Car_Management extends Model
{
    protected $table = 'car_management';

    public $timestamps = false;

    function car() {
        return $this->belongsTo('App\Car', 'cars_id', 'id');
    }

    function segment() {
        return $this->belongsTo('App\Segment', 'segments_id', 'id');
    }

    function user() {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
}
