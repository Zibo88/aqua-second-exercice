<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
   <h2>Ciao {{$new_task->user->name}} {{$new_task->user->lastname}}, ti è stata assegnata una nuova task: {{$new_task->title}}</h2>
   <p>Nel caso avessi problemi scrivi pure nelle note</p>
</body>
</html>