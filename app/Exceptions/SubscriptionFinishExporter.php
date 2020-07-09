<?php

Namespace App\Admin\Extensions;

use App\SubscriptionFinish;
use App\User;
use Encore\Admin\Grid\Exporters\AbstractExporter;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Excel;

class SubscriptionFinishExporter extends ExcelExporter implements WithMapping
{
    protected $fileName = 'Finish list.xlsx';


    protected $columns = [
        'id'          => 'ID',
        'teacher_id'  => 'Teacher Name',
        'student_id'  => 'Student Name',
        'Student Code',
        'project_id'  => 'Project Name',
        'description' => 'Description',
        'created_at'  => 'Created At',
    ];

    public function map($row): array
    {
        return [
            $row->id,
            $row->teacher_name,
            $row->student_name,
            $row->student->student_code,
            $row->project_name,
            $row->description,
            $row->created_at
        ];
    }
}
