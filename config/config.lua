--
-- This is a full example file for plugin configuration files
-- All lines must be documented
-- Default values are assumed to be what's written in this file, otherwise a commend should be added on the same line to note the default value
--

-- 'config' is a global variable that gets injected when 'config.lua' is executed

--
-- Plugin config
--
--
-- Sets up your basic plugin description and configuration
--


-- Name of the plugin to be displayed
config.pluginName = ""  -- default: nil, required
-- Version as a table. Written as {MAJOR, MINOR, PATCH} or {MAJOR, MINOR, PATCH, SUFFIX} which will output as "MAJ.MIN.PATCH"/"MAJ.MIN.PATCH-SUFFIX"
config.version = {1, 0, 0, ""}  -- default: nil, required
-- Description for the plugin. Short and simple
config.description = ""  -- default: "A Lukkit plugin"
-- The main author of the plugin. If there is no main author but there's a few core, use 'config.authorList' instead
config.author = ""  -- default: nil
-- A table of authors
config.authorList = {"", ""}  -- default: nil, optional
-- The main file where entrypoints are located in
config.main = ""  -- default: "main.lua"
-- A table of dependencies and their minimum/expected/maximum versions + load order
-- The 'loadOrder' property is relative to all other loadOrder properties in this plugin's config
--   0 being first and anything more being after that
-- Dependencies can share the same loadOrder but no gaurentee can be made about which one of them gets loaded first
-- You can also just supply a string if you don't care about anything apart from a name but I personally wouldn't
config.depends = {  -- default: nil
	{name = "SomePluginInARange", versionMin = "1.2.0-preview4", versionMax = "1.4.5-beta6"},
	{name = "SomeSpecificVersionedPlugin", version = "1.3.0", loadOrder = 3},
	"SomePluginWithNoVersionRequirements"
}



--
-- Feature switches
-- 
--
-- Some features are disabled by default as they are intensive or may be experimental
-- See the documentation for clarification on disable by default modules
-- You may also wish to turn some features off for whatever reason
--


-- Turns the feature on or off
config.feature.storage = true
config.feature.http = true
config.feature.io = true
config.feature.logging = true
config.feature.database = false


