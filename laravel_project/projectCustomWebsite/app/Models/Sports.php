<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sports extends Model
{
    use HasFactory;

    protected $table = 'sports';  // Ensure this matches your database table
    protected $fillable = [
        'sports_name',
        'competition_type',
        'description',
        'sports_type',
    ];
}
