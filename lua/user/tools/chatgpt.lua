vim.env.OPENAI_API_KEY = "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"

-- local chatgpt_ok, chatgpt = pcall(require, "chatgpt")
-- if not chatgpt_ok then
--   return
-- end

-- chatgpt.setup()
require("chatgpt").setup({
  -- openai_params = {
  --   model = "text-ada-001",
  -- },
})
