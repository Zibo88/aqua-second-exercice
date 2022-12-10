@extends('layouts.app')

@section('content')
    <section>
            <div class="container">
            @if ($errors->any())
	            <div class="alert alert-danger">
		        <ul>
		        @foreach ($errors->all() as $error)
			        <li>{{ $error }}</li>
		        @endforeach
		        </ul>
	        </div>
            @endif
            <div class="row">
                <div class="col">

                    <form action="{{route('admin.tasks.store')}}" method="post" class="row g-3 needs-validation" novalidate>
                        @csrf
                        @method('POST')
                        <div class="col-md-6 my-4">
                          <label for="title" class="form-label">Titolo</label>
                          <input type="text" class="form-control" id="title" name="title" value="{{old('title')}}" >
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="description" class="form-label">Notes</label> <br>
                            <textarea name="description" id="description" cols="65" rows="10">{{old('description')}}</textarea>
                        </div>

                        <div class="col-md-6 my-4">
                            <label for="delivery_time" class="form-label">Data di consegna</label>
                            <input type="date" class="form-control" id="delivery_time" name="delivery_time" value="{{old('delivery_time')}}" >
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="user_id">Dipendente</label>
                            <select name="user_id" id="user_id" value="">
                                <option value="">Nessuno</option>
                                @foreach ($employees as $employee)
                                    <option value="{{$employee->id}}" {{old('user_id') == $employee->id ? 'selected' : ''}}>{{ucfirst($employee->name)}} {{ucfirst($employee->lastname)}} </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">Submit form</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection