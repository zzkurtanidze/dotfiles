local g = vim.g

g.dashboard_default_executive ='telescope'

g.dashboard_custom_header = {
"██████╗ ██████╗ ██████╗ ███████╗███╗   ██╗██╗   ██╗██╗     ██╗",
"██╔══██╗██╔══██╗██╔══██╗╚══███╔╝████╗  ██║██║   ██║██║     ██║",
"██████╔╝██████╔╝██║  ██║  ███╔╝ ██╔██╗ ██║██║   ██║██║     ██║",
"██╔══██╗██╔══██╗██║  ██║ ███╔╝  ██║╚██╗██║██║   ██║██║     ██║",
"██████╔╝██║  ██║██████╔╝███████╗██║ ╚████║╚██████╔╝███████╗██║",
"╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝",
"████████╗███████╗ ██████╗ ███████╗████████╗██╗",
"╚══██╔══╝██╔════╝██╔═══██╗██╔════╝╚══██╔══╝██║",
"   ██║   █████╗  ██║   ██║███████╗   ██║   ██║",
"   ██║   ██╔══╝  ██║▄▄ ██║╚════██║   ██║   ██║",
"   ██║   ███████╗╚██████╔╝███████║   ██║   ██║",
"   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝   ╚═╝   ╚═╝",
 }

g.dashboard_custom_section = {
    a = {description = {"  Find File                       Ctrl + P"}, command = "Telescope find_files"},
    c = {description = {"  Find Word                       Ctrl + G"}, command = "Telescope live_grep"},
    d = {description = {"  New File                        Ctrl + T"}, command = "DashboardNewFile"},
    g = {description = {"  Update Plugins                Leader + A"}, command = "PlugUpdate"},
    h = {description = {"  Settings                                "}, command = "edit $MYVIMRC"},
    i = {description = {"  Exit                                    "}, command = "exit"}
}

g.dashboard_custom_footer = {
}
