namespace Settings
{
    // Changed to empty array, will be populated in Main.as
    array<TMX::Tag@> tags;

    const array<string> searchLengths = 
    {
        "Anything",
        "15 Seconds",
        "30 Seconds",
        "45 Seconds",
        "1 Minute",
        "1 Minutes and 15 Seconds",
        "1 Minutes and 30 Seconds",
        "1 Minutes and 45 Seconds",
        "2 Minutes",
        "2 Minutes and 30 Seconds",
        "3 Minutes",
        "3 Minutes and 30 Seconds",
        "4 Minutes",
        "4 Minutes and 30 Seconds",
        "5 Minutes",
        "Longer than 5 Minutes"
    };

    const array<string> searchOperators = 
    {
        "Exacts",
        "Shorter than",
        "Longer than",
        "Exacts or Shorter to",
        "Exacts or Longer to"
    };

    const array<string> searchDiff =
    {
        "Anything",
        "Beginner",
        "Intermediate",
        "Advanced",
        "Expert",
        "Lunatic",
        "Impossible"
    };

    const array<string> searchLaps =
    {
        "Included",
        "Not included",
        "Only"
    };

    //map options
    string chosenLength = searchLengths[0];
    string chosenOperator = searchOperators[0];
    string chosenDiff = searchDiff[0];
    string chosenLaps = searchLaps[0];
    bool awarded = true;
    bool novalued = true;

    //tags
    array<bool> chosenTags;

    //window
    bool windowVisible = false;
    vec2 windowPosition = vec2(0, 300);
    int windowFlags =  UI::WindowFlags::NoTitleBar | UI::WindowFlags::NoCollapse | UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    //expandedmenu
    bool expandedVisible = false;

    //bulk add
    string author = "Nequsss";
    int authorid = 0;
    int totalcount = 0;
    bool finished = false;
    string status = "";

    //pluginconfig
    const array<string> controllers =
    {
        "Alone",
        "Evo",
        "PyPlanet"
    };
    string chosenController = "Alone";
    string addCommand = "";
}