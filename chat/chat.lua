

local chat = require("lukkit/chat")

-- Text components are used to create plain messages.
local component = chat.text("your text")
-- Translatables are used for client side translations. It can be used to send translation keys for the client translate
-- client side, this means you are limited to the text provided by Minecraft (see below) unless a resource pack is used 
-- to add more. Some translations support arguments with can also be TranslatableComponents (or just TextComponents).
-- Default translations: https://github.com/SpigotMC/BungeeCord/blob/master/chat/src/main/resources/mojang-translations/en_US.properties
local component = chat.translatable("commands.give.success")

--
-- Formatting
-- 
-- Set the color of the text
component:color(chat.color.GOLD)
-- Bold the text and it's children
component:bold()
-- italicize the text and it's children
component:italic()
-- Underline the text and it's children
component:underlined()
-- Strikethrough the text and it's children
component:strikethrough()
-- Obfuscate the text and it's children
-- Obfuscation makes the text randomly change to other charaters of the same width
component:obfuscated()

-- To remove a specific formatting
component:bold(false)
component:italic(false)
component:underlined(false)
component:strikethrough(false)
component:obfuscated(false)

--
-- Click events
-- These events are ran when the user clicks the text component or it's children
--
-- Open a url at the given path
component:click(chat.clickEvents.OPEN_URL, "https://lukkit.net")
-- Open a file at the given path
component:click(chat.clickEvents.OPEN_FILE, "logs/latest.log")
-- Run the given command
component:click(chat.clickEvents.RUN_COMMAND, "/lukkit dev reload all")
-- Inserts the given string into the players' text box
component:click(chat.clickEvents.SUGGEST_COMMAND, "/lukkit help")
-- Change to the given page number in a book
-- NOTE: Not sure if we should do string or int
component:click(chat.clickEvents.CHANGE_PAGE, "15")

--
-- Hover Events
--
-- TODO