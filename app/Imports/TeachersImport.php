<?php

namespace App\Imports;

use App\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;

class TeachersImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        if ($row[0] !=='Name'){
            return new User([
                'name'         => $row[0],
                'email'        => $row[1],
                'phone_number' => $row[2],
                'speciality'   => $row[3],
                'gender'       => $row[4],
                'birth_day'    => $row[5],
                'is_active'    => 1,
                'type'         => 'Teacher',
                'password'     => Hash::make('123456'),

            ]);
        }
    }
}
