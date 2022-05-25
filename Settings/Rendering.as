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

        if (UI::BeginCombo("Multi-laps", chosenLaps)){
            for (uint i = 0; i < searchLaps.Length; i++) {
                string laps = searchLaps[i];

                if (UI::Selectable(laps, chosenLaps == laps)) {
                    chosenLaps = laps;
                }

                if (chosenLaps == laps) {
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
        UI::TextWrapped("Selected tags will be added to map searching");
        UI::Separator();

        for(int i = 0; i < chosenTags.Length; i++)
        {
            chosenTags[i] = UI::Checkbox(tags[i]._name, chosenTags[i]);
            UI::Separator();
        }
    }

    [SettingsTab name="Plugin Options"]
    void PluginConfig()
    {
        
    }

    [SettingsTab name="Bulk Adding"]
    void BulkAdd()
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
        PluginConfig();
        BulkAdd();
        About();
    }
}