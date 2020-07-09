@extends('teacher.home')

@section('content-dashboard')
    <div class="card-header">{{ trans('message.info') }}</div>
    <div class="card-body">
        @if(session('message'))
            <div class="text-center alert alert-success" role="alert">
                {{session('message')}}
            </div>
        @endif
        <form class="row" action="{{ route('information.update') }}" enctype="multipart/form-data" method="POST">
            <div class="col-xl-8">
            @csrf
            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.full_name') }}">{{ trans('message.full_name') }} </label>
                <input type="text" name="name" class="form-control" value="{{ $information->name }}">
                @if($errors->has('name'))
                    <p class="text-danger">
                        {{ $errors->first('name') }}
                    </p>
                @endif
            </div>

            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.email') }}">{{ trans('message.email') }} </label>
                <input type="text" name="email" class="form-control" value="{{ $information->email }}">
                @if($errors->has('email'))
                    <p class="text-danger">
                        {{ $errors->first('email') }}
                    </p>
                @endif
            </div>
            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.phone_number') }}">{{ trans('message.phone_number') }} </label>
                <input type="text" name="phone_number" class="form-control" value="{{ $information->phone_number }}">
                @if($errors->has('phone_number'))
                    <p class="text-danger">
                        {{ $errors->first('phone_number') }}
                    </p>
                @endif
            </div>
            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.speciality') }}">{{ trans('message.speciality') }} </label>
                <input type="text" name="speciality" class="form-control" value="{{ $information->speciality }}">
                @if($errors->has('speciality'))
                    <p class="text-danger">
                        {{ $errors->first('speciality') }}
                    </p>
                @endif
            </div>

            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.gender') }}">{{ trans('message.gender') }} </label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender1" value="female" {{ $information->gender==='female'?'checked':'' }}>
                    <label class="form-check-label" for="inlineRadio1">{{ trans('message.female') }}</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender" value="male" {{ $information->gender==='male'?'checked':'' }}>
                    <label class="form-check-label" for="inlineRadio2">{{ trans('message.male') }}</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender" value="other" {{ $information->gender==='other'?'checked':'' }}>
                    <label class="form-check-label" for="inlineRadio2">{{ trans('message.other') }}</label>
                </div>
                @if($errors->has('gender'))
                    <p class="text-danger">
                        {{ $errors->first('gender') }}
                    </p>
                @endif
            </div>


            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.birth_day') }}">{{ trans('message.birth_day') }} </label>
                <input type="date" name="birth_day" min="1000-01-01" max="3000-12-31" class="form-control" value="{{ $information->birth_day }}">
                @if($errors->has('birth_day'))
                    <p class="text-danger">
                        {{ $errors->first('birth_day') }}
                    </p>
                @endif
            </div>
            <div class="form-group">
                <label class="font-weight-bolder" for="{{ trans('message.full_name') }}">{{ trans('message.password') }} </label>
                <input type="password" name="password" class="form-control" value="" placeholder="Classes of characters: Lower Case, Upper Case, Digits.">
                @if($errors->has('password'))
                    <p class="text-danger">
                        {{ $errors->first('password') }}
                    </p>
                @endif
            </div>
            </div>
            <div class="col-xl-4">
                <p><label class="font-weight-bolder" for="{{ trans('message.birth_day') }}">Avatar</label></p>
                <img src="{{$information->avatar?  url('uploads/'.$information->avatar) :url('uploads/images/default.png')}}" alt="Avatar" class="img-thumbnail" style="width: 200px ;height: 200px">
                <input type="file" name="avatar">
            </div>
            <button class="btn btn-success btn-lg btn-block" type="submit">Update Information</button>
        </form>
    </div>
@endsection
