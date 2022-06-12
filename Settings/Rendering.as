namespace Settings
{
    [SettingsTab name="Map Options"]
    void MapConfig()
    {
        if (UI::BeginCombo("Map length", chosenLength, UI::ComboFlags::HeightLarge)){
            for (uint i = 0; i < searchLengths.Length; i++) {
                string length = searchLengths[i];

                if (UI::Selectable(length, chosenLength == length)) {
                    chosenLength = length;
                }

                if (chosenLength == length) {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();

        if (UI::BeginCombo("Length Operator", chosenOperator)){
            for (uint i = 0; i < searchOperators.Length; i++) {
                string operator = searchOperators[i];

                if (UI::Selectable(operator, chosenLength == operator)) {
                    chosenOperator = operator;
                }

                if (chosenOperator == operator) {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();

        if (UI::BeginCombo("Map Difficulty", chosenDiff)){
            for (uint i = 0; i < searchDiff.Length; i++) {
                string diff = searchDiff[i];

                if (UI::Selectable(diff, chosenDiff == diff)) {
                    chosenDiff = diff;
                }

                if (chosenDiff == diff) {
                    UI::SetItemDefaultFocus();
                }
            }
            UI::EndCombo();
        }

        UI::Separator();
        novalued = UI::Checkbox("Include maps with no replay value", novalued);

        UI::Separator();
        awarded = UI::Checkbox("Include not awarded maps", awarded);
    }

    [SettingsTab name="Tags Options"]
    void TagsConfig()
    {
        UI::TextWrapped("Selected tags will be added to map searching query");
        UI::Separator();

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
            UI::Separator();
        }
    }

    [SettingsTab name="Bulk Adding"]
    void BulkAdd()
    {
        UI::TextWrapped("Add multiple or all maps from the same author");
        UI::TextWrapped("Search: (Author' MX username, ingame login or UserID)");
        UI::Separator();

        author =  UI::InputText("", author, UI::InputTextFlags::AutoSelectAll, null);
        UI::SameLine();
        if(UI::Button("Search"))
        {
            TMX::SearchUsers();
        }
        UI::Separator();

        if(TMX::users.Length > 0)
        {
            for(int i = 0; i < TMX::users.Length; i++)
            {
                if(UI::Button(TMX::users[i]._text))
                {
                    id = TMX::users[i]._id;
                    users.Resize(0);
                }
            }
        }

        if(id != 0)
        {
            
        }
    }

    [SettingsTab name="Plugin Options"]
    void PluginConfig()
    {
        
    }

    [SettingsTab name="About"]
    void About()
    {
        
    }

    void RenderSettings()
    {
        MapConfig();
        TagsConfig();
        BulkAdd();
        PluginConfig();
        About();
    }
}