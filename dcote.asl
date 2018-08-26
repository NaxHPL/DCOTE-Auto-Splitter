state("CoCMainWin32") {
    int isLoading: "CoCMainWin32.exe", 0x39CCB4;
    int mapLoading: "CoCMainWin32.exe", 0x39A33C;
    int mapLoaded: "CoCMainWin32.exe", 0x39CE18;
    int inCutscene: "CoCMainWin32.exe", 0x3AB294;
    int onMainMenu: "CoCMainWin32.exe", 0x3A2648;
}

startup {
    vars.startingCutscenesPlayed = false;    // true if the first two cutscenes in map 2 have played
    vars.end1cutscenePlayed = false;        // true if the first cutscene in Air-Filled Tunnels 2 has played
    vars.end2cutscenePlayed = false;        // true if the second cutscene in Air-Filled Tunnels 2 has played

    // Any% settings
    settings.Add("any", true, "Any%");
    settings.SetToolTip("any", "Having Any% and 100% checked will default to Any%");

    settings.Add("any-ch0-1", true, "Prologue", "any");

    settings.Add("any-ch1", true, "A Visit to the Old Town", "any");
    settings.Add("any-ch1-1", true, "A Visit to the Old Town 1", "any-ch1");
    settings.Add("any-ch1-2", true, "A Visit to the Old Town 2", "any-ch1");
    settings.Add("any-ch1-3", true, "A Visit to the Old Town 3", "any-ch1");

    settings.Add("any-ch2", true, "Attack of the Fishmen", "any");
    settings.Add("any-ch2-1", true, "Attack of the Fishmen 1", "any-ch2");
    settings.Add("any-ch2-2", true, "Attack of the Fishmen 2", "any-ch2");
    settings.Add("any-ch2-3", true, "Attack of the Fishmen 3", "any-ch2");

    settings.Add("any-ch3-1", true, "Jailbreak", "any");

    settings.Add("any-ch4", true, "Escape from Innsmouth", "any");
    settings.Add("any-ch4-1", true, "Escape from Innsmouth 1", "any-ch4");
    settings.Add("any-ch4-2", true, "Escape from Innsmouth 2", "any-ch4");

    settings.Add("any-ch5", true, "The Marsh Refinery", "any");
    settings.Add("any-ch5-1", true, "The Marsh Refinery 1", "any-ch5");
    settings.Add("any-ch5-4", true, "The Marsh Refinery 4", "any-ch5");
    settings.Add("any-ch5-5", true, "The Marsh Refinery 5", "any-ch5");

    settings.Add("any-ch6", true, "Esoteric Order of Dagon", "any");
    settings.Add("any-ch6-1", true, "Esoteric Order of Dagon 1", "any-ch6");
    settings.Add("any-ch6-2", true, "Esoteric Order of Dagon 2", "any-ch6");

    settings.Add("any-ch7-1", true, "Dangerous Voyage", "any");

    settings.Add("any-ch8-1", true, "Devil's Reef", "any");
    
    settings.Add("any-ch9", true, "Air-Filled Tunnels", "any");
    settings.Add("any-ch9-1", true, "Air-Filled Tunnels 1", "any-ch9");
    settings.Add("any-ch9-2", true, "Air-Filled Tunnels 2", "any-ch9");

    // 100% settings
    settings.Add("100", false, "100%");
    settings.SetToolTip("100", "Having Any% and 100% checked will default to Any%");

    settings.Add("100-ch0-1", true, "Prologue", "100");

    settings.Add("100-ch1", true, "A Visit to the Old Town", "100");
    settings.Add("100-ch1-1", true, "A Visit to the Old Town 1", "100-ch1");
    settings.Add("100-ch1-2", true, "A Visit to the Old Town 2", "100-ch1");
    settings.Add("100-ch1-3", true, "A Visit to the Old Town 3", "100-ch1");

    settings.Add("100-ch2", true, "Attack of the Fishmen", "100");
    settings.Add("100-ch2-1", true, "Attack of the Fishmen 1", "100-ch2");
    settings.Add("100-ch2-2", true, "Attack of the Fishmen 2", "100-ch2");
    settings.Add("100-ch2-3", true, "Attack of the Fishmen 3", "100-ch2");

    settings.Add("100-ch3-1", true, "Jailbreak", "100");

    settings.Add("100-ch4", true, "Escape from Innsmouth", "100");
    settings.Add("100-ch4-1", true, "Escape from Innsmouth 1", "100-ch4");
    settings.Add("100-ch4-2", true, "Escape from Innsmouth 2", "100-ch4");

    settings.Add("100-ch5", true, "The Marsh Refinery", "100");
    settings.Add("100-ch5-1", true, "The Marsh Refinery 1", "100-ch5");
    settings.Add("100-ch5-2", true, "The Marsh Refinery 2", "100-ch5");
    settings.Add("100-ch5-3", true, "The Marsh Refinery 3", "100-ch5");
    settings.Add("100-ch5-4", true, "The Marsh Refinery 4", "100-ch5");
    settings.Add("100-ch5-5", true, "The Marsh Refinery 5", "100-ch5");

    settings.Add("100-ch6", true, "Esoteric Order of Dagon", "100");
    settings.Add("100-ch6-1", true, "Esoteric Order of Dagon 1", "100-ch6");
    settings.Add("100-ch6-2", true, "Esoteric Order of Dagon 2", "100-ch6");

    settings.Add("100-ch7-1", true, "Dangerous Voyage", "100");

    settings.Add("100-ch8-1", true, "Devil's Reef", "100");
    
    settings.Add("100-ch9", true, "Air-Filled Tunnels", "100");
    settings.Add("100-ch9-1", true, "Air-Filled Tunnels 1", "100-ch9");
    settings.Add("100-ch9-2", true, "Air-Filled Tunnels 2", "100-ch9");
}

init {
    refreshRate = 30;
    timer.IsGameTimePaused = false;
}

update {
    if(current.mapLoaded == 2 && current.inCutscene == 1 && !vars.startingCutscenesPlayed) {
        vars.startingCutscenesPlayed = true;
    }

    if(current.onMainMenu == 1 && vars.startingCutscenesPlayed) {
        vars.startingCutscenesPlayed = false;
    }

    if(current.mapLoaded == 27 && old.inCutscene == 1 && current.inCutscene == 0) {
        if(!vars.end1cutscenePlayed) {
            vars.end1cutscenePlayed = true;
        }
        else if(vars.end1cutscenePlayed && !vars.end2cutscenePlayed) {
            vars.end2cutscenePlayed = true;
        }
    }
}

start {
    // starts the timer when player first gains control
    if(current.mapLoaded == 2 && current.inCutscene == 0 && vars.startingCutscenesPlayed) {
        vars.startingCutscenesPlayed = false;
        return true;
    }
}

isLoading {
    return current.isLoading != 0;
}

split {
    if(settings["any"]) {
    	return ((settings["any-ch0-1"] && old.mapLoading == 2 && current.mapLoading == 3)    ||
       	        (settings["any-ch1-1"] && old.mapLoading == 4 && current.mapLoading == 5)    ||
       	        (settings["any-ch1-2"] && old.mapLoading == 5 && current.mapLoading == 6)    ||
       	        (settings["any-ch1-3"] && old.mapLoading == 6 && current.mapLoading == 7)    ||
       	        (settings["any-ch2-1"] && old.mapLoading == 8 && current.mapLoading == 9)    ||
                (settings["any-ch2-2"] && old.mapLoading == 9 && current.mapLoading == 10)   ||
                (settings["any-ch2-3"] && old.mapLoading == 10 && current.mapLoading == 11)  ||
                (settings["any-ch3-1"] && old.mapLoading == 11 && current.mapLoading == 12)  ||
                (settings["any-ch4-1"] && old.mapLoading == 12 && current.mapLoading == 13)  ||
                (settings["any-ch4-2"] && old.mapLoading == 13 && current.mapLoading == 14)  ||
                (settings["any-ch5-1"] && old.mapLoading == 15 && current.mapLoading == 18)  ||
                (settings["any-ch5-4"] && old.mapLoading == 18 && current.mapLoading == 19)  ||
                (settings["any-ch5-5"] && old.mapLoading == 19 && current.mapLoading == 21)  ||
                (settings["any-ch6-1"] && old.mapLoading == 21 && current.mapLoading == 22)  ||
                (settings["any-ch6-2"] && old.mapLoading == 22 && current.mapLoading == 23)  ||
                (settings["any-ch7-1"] && old.mapLoading == 23 && current.mapLoading == 24)  ||
                (settings["any-ch8-1"] && old.mapLoading == 25 && current.mapLoading == 26)  ||
                (settings["any-ch9-1"] && old.mapLoading == 26 && current.mapLoading == 27)  ||
                (settings["any-ch9-2"] && current.mapLoaded == 27 && current.inCutscene == 1 && vars.end2cutscenePlayed));
    }
    else if(settings["100"]) {
        return ((settings["100-ch0-1"] && old.mapLoading == 2 && current.mapLoading == 3)    ||
       	        (settings["100-ch1-1"] && old.mapLoading == 4 && current.mapLoading == 5)    ||
       	        (settings["100-ch1-2"] && old.mapLoading == 5 && current.mapLoading == 6)    ||
       	        (settings["100-ch1-3"] && old.mapLoading == 6 && current.mapLoading == 7)    ||
       	        (settings["100-ch2-1"] && old.mapLoading == 8 && current.mapLoading == 9)    ||
                (settings["100-ch2-2"] && old.mapLoading == 9 && current.mapLoading == 10)   ||
                (settings["100-ch2-3"] && old.mapLoading == 10 && current.mapLoading == 11)  ||
                (settings["100-ch3-1"] && old.mapLoading == 11 && current.mapLoading == 12)  ||
                (settings["100-ch4-1"] && old.mapLoading == 12 && current.mapLoading == 13)  ||
                (settings["100-ch4-2"] && old.mapLoading == 13 && current.mapLoading == 14)  ||
                (settings["100-ch5-1"] && old.mapLoading == 15 && current.mapLoading == 16)  ||
                (settings["100-ch5-1"] && old.mapLoading == 16 && current.mapLoading == 17)  ||
                (settings["100-ch5-1"] && old.mapLoading == 17 && current.mapLoading == 18)  ||
                (settings["100-ch5-4"] && old.mapLoading == 18 && current.mapLoading == 19)  ||
                (settings["100-ch5-5"] && old.mapLoading == 19 && current.mapLoading == 21)  ||
                (settings["100-ch6-1"] && old.mapLoading == 21 && current.mapLoading == 22)  ||
                (settings["100-ch6-2"] && old.mapLoading == 22 && current.mapLoading == 23)  ||
                (settings["100-ch7-1"] && old.mapLoading == 23 && current.mapLoading == 24)  ||
                (settings["100-ch8-1"] && old.mapLoading == 25 && current.mapLoading == 26)  ||
                (settings["100-ch9-1"] && old.mapLoading == 26 && current.mapLoading == 27)  ||
                (settings["100-ch9-2"] && current.mapLoaded == 27 && current.inCutscene == 1 && vars.end2cutscenePlayed));
    }
}

exit {
    timer.IsGameTimePaused = true;
}
