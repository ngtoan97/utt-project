<?php

namespace App\Http\Requests;

use App\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class InfomationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if (Auth::user()->type ==='Teacher')
        {
            return [
                'name' =>['required','min:3','max:30'],
                'email'        => [
                    'required',
                    'email',
                    'min:4',
                    'max:60',
                    'unique:users,email,' . Auth::user()->id
                ],
                $this->all()['password']===null?'':'password'     => [
                    'min:8',
                    'max:60',
                    'regex:/^(?=.*[a-zA-Z])(?=.*\d).+$/'
                ],
                'speciality' =>['required'],
                'phone_number' => [
                    'required',
                    'regex:/(0)[0-9]/',
                    'not_regex:/[a-z]/',
                    'min:9',
                    'max:12',
                    'unique:users,phone_number,' . Auth::user()->id
                ]
            ];

        }
        return [
            'name' =>['required','min:3','max:30'],
            'email'        => [
                'required',
                'min:4',
                'max:60',
                'unique:users,email,' . Auth::user()->id
            ],
            $this->all()['password']===null?'':'password'     => [
                'min:8',
                'max:60',
                'regex:/^(?=.*[a-zA-Z])(?=.*\d).+$/'
            ],
            'student_code' =>[
                'required',
                'unique:users,student_code,' . Auth::user()->id
            ],
            'class_code' =>['required'],
            'phone_number' => [
                'required',
                'regex:/(0)[0-9]/',
                'not_regex:/[a-z]/',
                'min:9',
                'max:12',
                'unique:users,phone_number,' . Auth::user()->id
            ]
        ];

    }
}
