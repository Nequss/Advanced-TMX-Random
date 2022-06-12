namespace TMX
{
    class Map
    {
        int _trackID;
        int _userID;
        string _username;
        string _authorLogin;
        string _trackUID;
        string _mood;
        string _name;
        string _lengthName;
        int _laps;
        string _difficultyName;
        int _authorTime;
        int _trackValue;
        int _awardCount;

        Map(Json::Value result)
        {  
            _trackID = result["TrackID"];
            _userID = result["UserID"];
            _username = result["Username"];
            _authorLogin = result["AuthorLogin"];
            _trackUID = result["TrackUID"];
            _mood = result["Mood"];
            _name = result["Name"];
            _lengthName = result["LengthName"];
            _laps = result["Laps"];
            _difficultyName = result["DifficultyName"];
            _authorTime = result["AuthorTime"];
            _trackValue = result["TrackValue"];
            _awardCount = result["AwardCount"];
        }
    }
}