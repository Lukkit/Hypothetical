--
-- Errors returned by storage methods
-- These are definitions
--


local errors = require("lukkit/storage").errors;

-- Extension doesn't match any implementations (can be overriden via an option)
errors.UNKNOWN_EXTENSION = 0;
-- File cannot be found
errors.FILE_MISSING = 1;
-- File parsing failed (implementation decides that)
errors.FILE_INVALID = 2;
-- Path couldn't be followed in the file
errors.UNTRACEABLE_PATH = 3;
