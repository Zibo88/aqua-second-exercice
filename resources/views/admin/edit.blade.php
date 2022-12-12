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

                    @if ($logged->role === 'admin')
                        <form action="{{route('admin.tasks.update' , ['task' => $task_to_edit->id])}}" method="post" class="row g-3 needs-validation" novalidate>
                        @csrf
                        @method('PUT')
                        <div class="col-md-6">
                          <label for="title" class="form-label">Titolo</label>
                          <input type="text" class="form-control" id="title" name="title" value="{{old ('title', $task_to_edit->title )}}" >
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="description" class="form-label">Note</label> <br>
                            <textarea name="description" id="description" cols="65" rows="10">{{old ('description', $task_to_edit->description )}}</textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="delivery_time" class="form-label">Data di consegna</label> <br>
                            <input type="date" class="form-control" id="delivery_time" name="delivery_time" value="{{old ('delivery_time', $task_to_edit->delivery_time )}}" >
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="status" class="form-label">Status</label> <br>
                            <select name="status" id="status">
                                <option value="0" {{old('status')}}>Non completata</option>
                                <option value="1" {{old('status')}}>Completata</option>
                            </select>
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="user_id">Dipendente</label> <br>
                            <select name="user_id" id="user_id">
                                <option value="">Nessuno</option> 
                                @foreach ($users as $user)
                                    <option value="{{$user->id}}"  {{old("user_id",  $task_to_edit->user ?  $task_to_edit->user->id : "") == $user->id ? 'selected' : '' }}> {{ucfirst($user->name)}} {{ucfirst($user->lastname)}} </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">Submit form</button>
                        </div>
                      </form>
                    @endif

                    @if($logged->role === "dipendente")
                    
                    <form action="{{route('admin.tasks.update' , ['task' => $task_to_edit->id])}}" method="post" class="row g-3     needs-validation" novalidate>
                        @csrf
                        @method('PUT')
                        <div class="col-md-6 mb-4">
                          <label for="title" class="form-label">Titolo</label>
                          <input type="text" class="form-control" id="title" name="title" value="{{old ('title', $task_to_edit->title)}}" disabled="disabled">
                        </div>
    
                        <div class="col-md-12 my-4">
                            <label for="description" class="form-label">Notes</label> <br>
                            <textarea name="description" id="description" cols="65" rows="10">{{old ('description', $task_to_edit->description )}}</textarea>
                        </div>
    
                        <div class="col-md-6 my-4">
                            <label for="delivery_time" class="form-label">Data di consegna</label>
                            <input type="date" class="form-control" id="delivery_time" name="delivery_time" value="{{old ('delivery_time', $task_to_edit->delivery_time )}}" disabled>
                        </div>

                        <div class="col-md-12 my-4">
                            <label for="status" class="form-label">Status</label> <br>
                            <select name="status" id="status">
                                <option value="0">Non completata</option>
                                <option value="1">Completata</option>
                            </select>
                        </div>

                        {{-- <div class="col-md-12">
                            <label for="">ciao</label>
                            <select name="" id="">
                                <option value="0">a</option>
                                <option value="1">b</option>
                            </select>
                        </div> --}}
    
                        <div class="col-md-12 my-4">
                            <label for="user_id">Dipendente</label>
                            <select name="user_id" id="user_id">
                                <option value="">Nessuno</option>
                                @foreach ($users as $user)
                                    <option value="{{$user->id}}"  {{old("user_id",  $task_to_edit->user ?  $task_to_edit->user->id : "") == $user->id ? 'selected' : '' }} disabled> {{ucfirst($user->name)}} {{ucfirst($user->lastname)}}</option>
                                @endforeach
                            </select>
                        </div>
    
                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">Submit form</button>
                        </div>
                      </form>
                    @endif
                </div>

            </div>
        </div>
    </section>
@endsection