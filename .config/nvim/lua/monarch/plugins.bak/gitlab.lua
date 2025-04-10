return {
    "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
    enabled = false,
    -- Activate when a file is created/opened
    event = { "BufReadPre", "BufNewFile" },
    -- Activate when a supported filetype is open
    ft = { "go", "javascript", "vue", "terraform", "typeScript" },
    cond = function()
        -- Only activate if token is present in environment variable.
        -- Remove this line to use the interactive workflow.
        return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    opts = {
        statusline = {
            -- Hook into the built-in statusline to indicate the status
            -- of the GitLab Duo Code Suggestions integration
            enabled = true,
        },
        resource_editing = {
            enabled = false,
        },
        telemetry = {
            enabled = false,
        },

        code_suggestions = {
            auto_filetypes = { "go", "javascript", "vue", "terraform", "typeScript" },
        },
    },
}
