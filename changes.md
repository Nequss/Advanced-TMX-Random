# Advanced TMX Random Plugin Fixes

## Core Issues Fixed

1. **HTTP Request Handling**
   - Added proper request completion checking in `TMX::GetTags()` with a `while` loop that waits for the request to finish before parsing
   - Fixed the error: "Http Request has not yet finished - use Finished() before calling this function"

2. **Property Access Corrections**
   - Changed `get_Length()` to `Length` in multiple files (TMX.as, BulkAdd.as)
   - Fixed "Method call get_Length is actually a property" errors

3. **Resource Handling**
   - Changed `Resources::Texture` to `UI::Texture` in Image.as
   - Fixed "namespace 'Resources' doesn't exist" error

4. **Initialization Sequence**
   - Moved global tag initialization from direct assignment to an asynchronous process
   - Created empty `tags` array in Settings/Data.as instead of initializing with `TMX::GetTags()`
   - Added proper `Resize()` call for `chosenTags` array after tags are loaded
   - Added dedicated `InitializePlugin()` function to properly load data in the correct sequence

## Files Changed

- **TMX/TMX.as**: Fixed HTTP request handling with proper waiting
- **TMX/BulkAdd.as**: Updated property access (get_Length → Length)
- **TMX/Image.as**: Fixed texture namespace (Resources → UI)
- **Settings/Data.as**: Changed tag initialization approach
- **Main.as**: Added proper initialization sequence with async loading

These changes ensure the plugin initializes properly and handles HTTP requests correctly, following Openplanet plugin development best practices.
