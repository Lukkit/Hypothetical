-- 
-- Basic storage operations.
-- These methods are available to all implementation of the storage API
-- For storage implementation-specific methods see their respective file in this directory
--


local storage = require("lukkit/storage");

-- Loads and parses a storage file. Returns it using the required implementation.
-- Parameters:
-- 	string filePath - the path to the file relative to the plugin's directory
-- 	table options   - a table of options which change the default behvaviour. See file_options.lua
-- 	storage.error error - the error if one is present
-- Errors: UNKNOWN_EXTENSION, FILE_MISSING, FILE_INVALID. See errors.lua
-- The extension is the key to what implementation the storage api uses. v3 requires JSON & YAML
local obj = storage.load("path/to/file.json");
local obj = storage.load("path/to/someYamlFileNoExt", {"impl": "YAML"});

-- Loads the storage object if it exists in the fs, otherwise it exports an internal file then loads it.
-- If you just want to export a file you should use the appropriate 'io' method instead.
local obj = storage.loadOrExport("path/to/somefile.json", "path/to/internal/file");
local obj = storage.loadOrExport("path/to/somefile", "path/to/internal/file", {"impl": "YAML"});

-- Sets any value in the storage object
-- Use 'set<type>' instead of 'set' so you know what you're putting in.
-- Parameters:
-- 	string path  - the path through the file where the value will be stored
-- 	any value - the value to store
-- 	storage.error error - the error if one is present
-- Errors: UNTRACABLE_PATH
obj:set("path.to.value", someObject); 

-- All following functions are identical spec wise to the function above, but only take a specific type
obj:setObject("path.to.object", {"someKey": "someValue"});  -- object may be empty; depends on the implementation
obj:setArray("path.to.array", {"some", "array", "of things"});  -- array may be empty; depends on the implementation
obj:setString("path.to.string", "stringValue");
obj:setNumber("path.to.number", 0);  -- implemented as doubles, but an int looks like an int
obj:setBoolean("path.to.boolean", true);

-- Gets a value at a given path
-- Use 'get<type>' instead of 'get' as it makes it easier to see when a different type is stored than expected
-- Parameters:
-- 	string path - the path the value is to be fetched from
-- Returns:
-- 	any value   - the value found
-- 	storage.error error - the error if one is present
-- Errors: UNTRACABLE_PATH
obj:get("path.to.value");

-- All following functions are identical spec wise to the function above, but only take a specific type
obj:getObject("path.to.value");
obj:getArray("path.to.value");
obj:getString("path.to.value");
obj:getNumber("path.to.value");
obj:getBoolean("path.to.value");

-- These methods are the same as the above but return the given value when they would've returned an error
-- Note that the default value's type doesn't have to be the same as the method returns!
obj:getObjectDefault("path.to.value", "someDefaultValue");
obj:getDefault("path.to.value", "someDefaultValue");
obj:getArrayDefault("path.to.value", "someDefaultValue");
obj:getStringDefault("path.to.value", "someDefaultValue");
obj:getNumberDefault("path.to.value", "someDefaultValue");
obj:getBooleanDefault("path.to.value", "someDefaultValue");


