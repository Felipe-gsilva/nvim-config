-- [nfnl] Compiled from fnl/plugins/ai.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local codec = require("codecompanion")
  local curl = require("plenary.curl")
  local log = require("codecompanion.utils.log")
  local utils = require("codecompanion.utils.adapters")
  local get_models
  local function _2_(self, opts)
    local adapter = require("codecompanion.adapters")(__fnl_global___2eresolve, self)
    if not adapter then
      log:error("Could not resolve Ollama adapter in the `get_models` function")
      return {}
    else
      adapter["get-env-vars"]()
      local url = adapter["env-replaced"].url
      local headers
      if adapter["env-replaced"].api_key then
        headers = {["content-type"] = "application/json", Authorization = ("Bearer " .. adapter["env-replaced"].api_key)}
      else
        headers = {["content-type"] = "application/json"}
      end
      local response
      local function _4_()
        return curl.get((url .. "/v1/models"), {sync = true, headers = headers, insecure = config.adapters.opts.allow_insecure, proxy = config.adapters.opts.proxy})
      end
      response = pcall(_4_)
      if not first(response) then
        log:error(("Could not get the Ollama models from " .. url .. "/v1/models.\nError: " .. second(response)))
        return {}
      else
        local json
        local function _5_()
          return vim.json.decode(second(response), __fnl_global___2ebody)
        end
        json = pcall(_5_)
        if not first(json) then
          log:error(("Could not parse the response from " .. url .. "/v1/models"))
          return {}
        else
          local models
          local function _6_(model)
            return model.id
          end
          models = map(_6_, second(json), __fnl_global___2edata)
          if (opts and ("last")(opts)) then
            return first(models)
          else
            return models
          end
        end
      end
    end
  end
  get_models = _2_
  local function _11_(self, params, messages)
    return params
  end
  local function _12_(self, messages)
    return {messages = utils["merge-messages"](messages)}
  end
  local function _13_(self, data)
    local json
    local function _14_()
      return vim.json.decode(data, {luanil = {object = true}})
    end
    json = pcall(_14_)
    if (first(json) and ("eval_count")(second(json))) then
      return ("eval_count")(second(json))
    else
      return nil
    end
  end
  local function _16_(self, data)
    local json
    local function _17_()
      return vim.json.decode(data, {luanil = {object = true}})
    end
    json = pcall(_17_)
    if first(json) then
      local message = ("message")(second(json))
      return {status = "success", output = {content = ("content")(message), role = ("role")(message)}}
    else
      return {status = "error", output = "Error malformed json"}
    end
  end
  local function _19_(self, data, context)
    local json
    local function _20_()
      return vim.json.decode(data, {luanil = {object = true}})
    end
    json = pcall(_20_)
    if first(json) then
      return ("content")(("message")(second(json)))
    else
      return nil
    end
  end
  local function _22_(self, data)
    if (("status")(data) >= 400) then
      return log:error(("Error: " .. ("body")(data)))
    else
      return nil
    end
  end
  local function _24_(self)
    return get_models(self, {last = true})
  end
  local function _25_(self)
    return get_models(self)
  end
  local function _26_(n)
    return {((n >= 0) and (n <= 2)), "Must be between 0 and 2"}
  end
  local function _27_(n)
    return {(n > 0), "Must be a positive number"}
  end
  return codec.setup({opts = {log_level = "DEBUG"}, strategies = {chat = {adapter = "ollama"}, inline = {adapter = "ollama"}}, adapter = {name = "ollama", formatted_name = "Ollama", roles = {llm = "assistant", user = "user"}, opts = {stream = true}, features = {text = true, tokens = true, vision = false}, url = "${url}/api/chat", env = {url = "http://localhost:11434"}, handlers = {form_parameters = _11_, form_messages = _12_, tokens = _13_, chat_output = _16_, inline_output = _19_, on_exit = _22_}, schema = {model = {order = 1, mapping = "parameters", type = "enum", desc = "ID of the model to use.", default = _24_, choices = _25_}, temperature = {order = 2, mapping = "parameters.options", type = "number", optional = true, default = 0.8, desc = "Sampling temperature between 0 and 2.", validate = _26_}, num_ctx = {order = 3, mapping = "parameters.options", type = "number", optional = true, default = 2048, desc = "Max tokens in context.", validate = _27_}}}})
end
return {{"olimorris/codecompanion.nvim", dependencies = {}, config = _1_}}
