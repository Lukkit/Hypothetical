--
-- Click Events
-- These are definitions
--


local clickEvents = require("lukkit/chat").clickEvents

-- Open a url at the given path
clickEvents.OPEN_URL = 0
-- Open a file at the given path
clickEvents.OPEN_FILE = 1
-- Run the given command
clickEvents.RUN_COMMAND = 2
-- Inserts the given string into the players' text box
clickEvents.SUGGEST_COMMAND = 3
-- Change to the given page number in a book
clickEvents.CHANGE_PAGE = 4
