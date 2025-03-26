<?php
namespace app\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Make sure to create the listing first before making model especially OOP connecting teach other for purposes, just
// like server.
// This class shows every members record in sports activity
class Member extends Model    {
    use HasFactory;
    protected $table = 'members'; // Explicitly define the table name
    protected $primaryKey = 'PID'; // Assuming PID is primary key
    protected $fillable = ['PID', 'name', 'age', 'religion', 'language', 'email', 'PListID', 'StateCode',
    'performance', 'date_joined', 'date_created']; // Update with actual columns
    // PID represents the player name and its information with the record from sports_type
    // PlaylistID, StateCode are all foreign key

    // A Member belongs to a Playlist
    public function playlist() {
        return $this->belongsTo(Playlist::class, 'PListID', 'PListID');
    }

    // A Member belongs to a State
    public function state() {
        return $this->belongsTo(State::class, 'StateCode');
    }
}
