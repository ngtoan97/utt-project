<?php

namespace App\Http\Controllers;

use App\Imports\StudentsImport;
use App\Imports\TeachersImport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

class ImportController extends Controller
{

    public function index()
    {
        return view('import.import');
    }

    public function importStudent(Request $request)
    {
        $file   = $request->all()['file_excel'];
        $import = Excel::import(new StudentsImport, $file);

        return redirect()->route('students.index')->with('message', 'Create Student successfully');
    }

    public function teacher()
    {
        return view('import.teacherImport');
    }

    public function importTeacher(Request $request)
    {
        $file   = $request->all()['file_excel'];
        $import = Excel::import(new TeachersImport, $file);

        return redirect()->route('teachers.index')->with('message', 'Create Teacher successfully');
    }

}
