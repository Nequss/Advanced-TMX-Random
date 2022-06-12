namespace TMX
{
    class User
    {
        int _id;
        string _text;

        User(Json::Value response)
        {
            _id = response["id"];
            _text = response["text"];
        }
    }
}