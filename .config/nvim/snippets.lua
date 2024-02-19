local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = false,
})

local argparse = function(index)
  return d(2, function(args)
    local parts = vim.split(args[1][1], ",", true)
    local vars = {}

    for i, arg in ipairs(parts) do
      local arg = arg:gsub("[=:](.*)", ""):gsub("%s+", "")

      if arg ~= '' and i == 1 then
        table.insert(vars, string.format("@%s = %s", arg, arg))
      elseif arg ~= '' then
        table.insert(vars, string.format("  @%s = %s", arg, arg))
      end
    end

    if vars[1] == nil then
      return sn(nil, {})
    else
      return sn(nil, { t(vars) })
    end
  end, { index })
end

local clamod = function(jump)
  return c(jump, { t("class"), t("module"), })
end

local camel_case = function(jump, str)
  local str = string.gsub(" "..str, "%W%l", string.upper):sub(2)
  local str = string.gsub(str, "_", "")

  return i(jump, str)
end

local modulename = function(args)
  -- local name = vim.fn.expand("%:r")

  return sn(nil, { camel_case(1, vim.fn.expand("%:t:r")) })
end

local classname = function(super)
  return function(args)
    return sn(nil, {
      camel_case(1, vim.fn.expand("%:t:r")),
      c(2, { sn(nil, { t(" < "), i(1, super) }), i(nil) })
    })
  end
end

local testsnippet = function(indent)
  return function()
    return sn(nil,
      fmt("test \"{}\" do\n  " .. indent .. "{}\n" .. indent .. "end", { i(1), i(2) })
    )
  end
end

ls.add_snippets("ruby", {
	s("bi", { t("binding.irb") }),
	s("irb", { t("binding.irb") }),
	s("pr", { t("private") }),
	s("inc", fmt("include {}", { i(1, "Module") })),
	s("rb", t({"#!/usr/bin/env ruby -wKU", "", ""})),
  s("defi", fmt("def initialize({args})\n  {instance_vars}\nend", { args = i(1), instance_vars = argparse(1) })),
  s({trig = "def", description = "def <name>..."}, fmt("def {}{}\n  {}\nend{}", { i(1, "method_name"), c(2, { sn(nil, { t("("), i(1, "*args"), t(")") }), i(nil) }), i(3), i(0) })),
  s({trig = "do", description = "do block"}, fmt("do {}\n  {}\nend{}", { c(1, { sn(nil, { t("|"), i(1, "args"), t("|") }), i(nil) }), i(2), i(0) })),
  s({trig = "{", description = "{} block"}, fmt("{{ {} {} }}{}", { c(1, { sn(nil, { t("|"), i(1, "args"), t("|") }), i(nil) }), i(2), i(0) })),
  s({trig = "r", description = "attr_reader"}, fmt("attr_reader {}", { i(1) })),
  s({trig = "w", description = "attr_writer"}, fmt("attr_writer {}", { i(1) })),
  s({trig = "rw", description = "attr_accessor"}, fmt("attr_accessor {}", { i(1) })),
  s({trig = "mod", description = "module"}, fmt("module {}\n  {}\nend", { d(1, modulename), i(0) })),
  s({trig = "cla", description = "class"}, fmt("class {}\n  {}\nend", { d(1, classname("Super")), i(0) })),
  s({trig = "controller", description = "controller"}, fmt("class {}\n  {}\nend", { d(1, classname("ApplicationController")), i(2) })),
  s({trig = "testcla", description = "test class"}, fmt("require \"test_helper\"\n\nclass {}\n  {}\nend", { d(1, classname("ActiveSupport::TestCase")), d(2, testsnippet("  ")) })),
  s({trig = "testclai", description = "integration test"}, fmt("require \"test_helper\"\n\nclass {}\n  {}\nend", { d(1, classname("ActionDispatch::IntegrationTest")), d(2, testsnippet("  ")) })),
  s({trig = "testclah", description = "helper test"}, fmt("require \"test_helper\"\n\nclass {}\n  {}\nend", { d(1, classname("ActionView::TestCase")), d(2, testsnippet("  ")) })),
  s({trig = "test", description = "test case"}, d(1, testsnippet(""))),
  s({trig = "frozen", description = "frozen string literal"}, t({"# frozen_string_literal: true", "", ""})),
  s({trig = "concern", description = "make concern"}, fmt("module {}\n  extend ActiveSupport::Concern\n\n  {}\nend", { d(1, modulename), i(0) })),
  s({trig = "are", description = "assert_response"}, fmt("assert_response :{}", { i(1) })),
  s({trig = "ae", description = "assert_equal"}, fmt("assert_equal {}, {}", { i(1, "expected"), i(2, "actual") })),
})

ls.add_snippets("javascript", {
  s({trig = "log", description = "console.log()"}, fmt("console.log({})", { i(1) })),
})

ls.add_snippets("eruby", {
  s({trig = "bi", description = "binding.b"}, t("<% binding.b %>")),
  s({trig = "link_to", description = "link_to"}, fmt("<%= link_to {} %>", { i(1) })),
  s({trig = "end", description = "end"}, fmt("<% end %>", {})),
  s({trig = "else", description = "else"}, fmt("<% else %>", {})),
  s({trig = "if", description = "if"}, fmt("<% if {} %>", { i(0) })),
  s({trig = "frame", description = "turbo_frame_tag"}, fmt("<%= turbo_frame_tag {} do %>\n  {}\n<% end %>", { i(1), i(2) })),
})
