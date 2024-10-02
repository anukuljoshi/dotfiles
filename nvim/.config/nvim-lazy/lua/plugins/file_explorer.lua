return {

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = {
            window = {
                position = "right",
                width = 40,
            },
            mappings = {
            },
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end
                },
                {
                    event = "file_renamed",
                    handler = function(args)
                        -- fix references to file
                        print(args.source, " renamed to ", args.destination)
                    end
                },
                {
                    event = "file_moved",
                    handler = function(args)
                        -- fix references to file
                        print(args.source, " moved to ", args.destination)
                    end
                },
                {
                    event = "neo_tree_buffer_enter",
                    handler = function()
                        vim.cmd("highlight! Cursor blend=100")
                    end,
                },
                {
                    event = "neo_tree_buffer_leave",
                    handler = function()
                        vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
                    end,
                },
            }
        }
    }

}