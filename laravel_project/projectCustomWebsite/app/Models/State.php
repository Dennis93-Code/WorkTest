<?php
namespace app\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Make sure to create the listing first before making model especially OOP connecting teach other for purposes, just
// like server.
// Represents the States
class State extends Model   {
    use HasFactory;
    protected $table = 'states'; // Explicitly define the table name
    protected $fillable = ['StateCode', 'IDCode', 'VSCode']; // Update with actual columns
    // The StateCode is the state itself while this IDCode is foreignkey from the class score.
    // The VSCode is basically the record between state to fight against.

    // A State belongs to a Score
    public function score() {
        return $this->belongsTo(Score::class, 'IDCode');
    }

    // A State has many Versus records
    public function versus() {
        return $this->hasMany(Versus::class, 'VSCode');
    }
}
