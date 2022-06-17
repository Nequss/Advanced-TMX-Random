namespace Settings
{
    [SettingsTab name="Map Search Options"]
    void MapConfig()
    {
        if (UI::BeginCombo("Map length", chosenLength, UI::ComboFlags::HeightLarge))
        {
            for (uint i = 0; i < searchLengths.Length; i++) 
            {
                string length = searchLengths[i];

                if (UI::Selectable(length, chosenLength == length))
                {
                    chosenLength = length;
                }

                if (chosenLength == length)
                {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();

        if (UI::BeginCombo("Length Operator", chosenOperator))
        {
            for (uint i = 0; i < searchOperators.Length; i++)
             {
                string operator = searchOperators[i];

                if (UI::Selectable(operator, chosenLength == operator))
                {
                    chosenOperator = operator;
                }

                if (chosenOperator == operator)
                {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();

        if (UI::BeginCombo("Map Difficulty", chosenDiff))
        {
            for (uint i = 0; i < searchDiff.Length; i++) 
            {
                string diff = searchDiff[i];

                if (UI::Selectable(diff, chosenDiff == diff))
                {
                    chosenDiff = diff;
                }

                if (chosenDiff == diff)
                {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();
        novalued = UI::Checkbox("Include maps with no replay value", novalued);

        UI::Separator();
        awarded = UI::Checkbox("Include not awarded maps", awarded);

        UI::Separator();
        UI::TextWrapped("Selected tags will be added to map searching query");

        if(UI::Button("Select All"))
        {
            for(int i = 0; i < chosenTags.Length; i++)
            {
                chosenTags[i] = true;
            }
        }

        UI::SameLine();

        if(UI::Button("Clear Selection"))
        {
            for(int i = 0; i < chosenTags.Length; i++)
            {
                chosenTags[i] = false;
            }
        }
        UI::Separator();

        for(int i = 0; i < chosenTags.Length; i++)
        {
            chosenTags[i] = UI::Checkbox(tags[i]._name, chosenTags[i]);
        }
    }

    [SettingsTab name="Bulk Adding"]
    void BulkAdd()
    {
        UI::TextWrapped("Add all maps from the same author");
        UI::TextWrapped("Search: (Author' MX username, ingame login or UserID)");
        UI::Separator();

        author =  UI::InputText("", author, UI::InputTextFlags::AutoSelectAll, null);
        UI::SameLine();
        if(UI::Button("Search"))
        {
            finished = false;
            status = "";

            TMX::SearchUsers();
        }

        if(finished)
        {
            if(totalcount > 0)
            {
                if(UI::Button("Add all " + totalcount + " maps"))
                {
                    startnew(TMX::AddAll);
                }
                UI::Separator();
            }
        }

        if(TMX::users.Length > 0)
        {
            for(int i = 0; i < TMX::users.Length; i++)
            {
                if(UI::Button(TMX::users[i]._text))
                {
                    status = "Loading maps...";
                    authorid = TMX::users[i]._id;
                    TMX::users.Resize(0);
                    TMX::maps.Resize(0);

                    startnew(TMX::GetUserMaps);
                }
            }
        }

        if(finished)
        {
            if(totalcount > 0)
            {
                for(int i = 0; i < TMX::maps.Length; i++)
                {
                    if(UI::Button("ID: " + TMX::maps[i]._trackID + " | " + TMX::maps[i]._name + " | Length: " + TMX::maps[i]._lengthName))
                    {
                        auto playground = GetApp().CurrentPlayground;
      
                        if (playground is null) 
                        {
	                    	print("No chat found");
	                    	return;
	                    }
                
	                    playground.Interface.ChatEntry = "//tmx add " +  TMX::maps[i]._trackID;
                    }

                    if (UI::IsItemHovered())
                    {
                        UI::BeginTooltip();
                        
                        auto thumbnail = Images::CachedFromURL("https://trackmania.exchange/tracks/thumbnail/" + TMX::maps[i]._trackID);
                        float width = Draw::GetWidth() * 0.20;

                        if (thumbnail.texture !is null)
                        {
                            vec2 thumbnailSize = thumbnail.texture.GetSize();
                            UI::Image(thumbnail.texture, vec2(width, thumbnailSize.y / (thumbnailSize.x / width)));
                        }
                        
                        UI::EndTooltip();
                    }      
                }
            }
        }
        else
        {
            UI::TextWrapped(status);
        }
    }

    [SettingsTab name="Plugin Options"]
    void PluginConfig()
    {
        UI::TextWrapped("Changes a command that adds tmx maps to the server or changes playable mode");
        UI::Dummy(vec2(2,2));
        UI::TextWrapped("Alone - Choose if you want to play alone not on a server");
        UI::TextWrapped("Evo - //add track_id");
        UI::TextWrapped("PyPlanet - //tmx add track_id");
        UI::Dummy(vec2(2,2));
        if (UI::BeginCombo("Select Controller/Mode", chosenController))
        {
            for (uint i = 0; i < controllers.Length; i++)
            {
                string operator = controllers[i];
                if (UI::Selectable(operator, chosenController == operator))
                {
                    chosenController = operator;

                    if(chosenController == "Evo")
                    {
                        Settings::addCommand = "//add ";
                    }

                    if(chosenController == "PyPlanet")
                    {
                        Settings::addCommand = "//tmx add ";
                    }
                }

                if (chosenController == operator)
                {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();
    }

    void RenderSettings()
    {
        MapConfig();
        BulkAdd();
        PluginConfig();
    }
}