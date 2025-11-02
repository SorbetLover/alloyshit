import funkin.backend.Conductor;
import funkin.menus.PauseSubState;
import funkin.game.PlayState;

function create(event) {
    switch(PlayState.SONG.meta.name){
        default:
            event.music = "gameOver";
        case "example":
            event.music = "breakfast";
    }
}

