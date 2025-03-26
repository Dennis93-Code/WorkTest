<?php
namespace app\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Make sure to create the listing first before making model especially OOP connecting teach other for purposes, just
// like server.
// This class score is based on the record from the sports in timeline based.
class Score extends Model   {
    use HasFactory;
    protected $table = 'scores'; // Explicitly define the table name
    protected $fillable = ['IDCode', 'PListID', 'sports_type', 'state', 'win_score', 'lose_score', 'date_involved',
    'date_created', 'time_start', 'time_end']; // Update with actual columns
    // IDCode represents the state playing any type of sports within that timeline for score record

    // A Score belongs to a Playlist
    public function playlist() {
        return $this->belongsTo(Playlist::class, 'PListID');
    }
}
