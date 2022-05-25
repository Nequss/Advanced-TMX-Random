namespace TMX
{
    class Tag
    {
        int _id;
        string _name;
        string _color;

        Tag(Json::Value response)
        {
            _id = response["ID"];
            _name = response["Name"];
            _color = response["Color"];
        }
    }
}
