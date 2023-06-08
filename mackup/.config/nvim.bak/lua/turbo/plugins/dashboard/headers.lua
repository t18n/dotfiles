local logos = require("turbo.plugins.dashboard.logos")

math.randomseed(os.time())

local current_day = os.date("%A")

local logo_names = { "night_fury", "western_dragon" }
local random_logo_name = logo_names[math.random(1, #logo_names)]

local random = vim.split(logos['animals'][random_logo_name], "\n")
local animal = vim.split("\n" .. logos['animals']["western_dragon"], "\n");
local days_of_week = vim.split(
  "\n\n\n" .. logos['days_of_week'][current_day] .. "\n\n" .. os.date("%Y-%m-%d %H:%M:%S" .. "\n"),
  "\n"
);

return {
  random = random,
  animal = animal,
  days_of_week = days_of_week,
}