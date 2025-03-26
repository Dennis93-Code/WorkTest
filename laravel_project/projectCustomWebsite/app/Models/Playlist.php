<?php
namespace app\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Make sure to create the listing first before making model especially OOP connecting teach other for purposes, just
// like server.
// This class shows all members involved in sports activity
class Playlist extends Model    {
    use HasFactory;
    protected $table = 'playlists'; // Explicitly define the table name
    protected $primaryKey = 'PListID'; // Define primary key
    public $incrementing = false; // If not auto-incrementing
    protected $keyType = 'string'; // Change based on datatype
    protected $fillable = ['PListID', 'PID', 'StateCode', 'OPerfID', 'date_involved', 'date_created', 'time_start',
    'time_end', 'score_type', 'score']; // Update with actual columns
    // PListID represents the current event occur for all staff and members.
    // StateCode, OPerfID which is overall performance are all foreignkey.

    // A Member belongs to a Playlist
    public function members() {
        return $this->hasMany(Member::class, 'PListID', 'PListID');
    }
}
