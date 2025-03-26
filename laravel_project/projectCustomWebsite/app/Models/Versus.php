<?php
namespace app\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Make sure to create the listing first before making model especially OOP connecting teach other for purposes, just
// like server.
// The state inbetween competitions
class Versus extends Model  {
    use HasFactory;
    protected $table = 'versus'; // Explicitly define the table name
    protected $fillable = ['VSCode', 'StateA', 'StateB', 'AllStates', 'PListID']; // Update with actual columns
    // This VSCode represents versus IDCode where the states inbetween would be fight against on record in any sports
    // There is an foreign key for states but would be notified as StateA and StateB in which ALLStates are null.
    // However, if all states are involved in rounds, then AllStates would involved which StateA and StateB would be
    // null.
    // PlaylistID is a foreignkey as well where those information contains all players and stuff involved.

    // A Versus belongs to a Playlist
    public function playlist() {
        return $this->belongsTo(Playlist::class, 'PListID');
    }

    // A Versus has two states competing
    public function stateA() {
        return $this->belongsTo(State::class, 'StateA');
    }

    public function stateB() {
        return $this->belongsTo(State::class, 'StateB');
    }
}
