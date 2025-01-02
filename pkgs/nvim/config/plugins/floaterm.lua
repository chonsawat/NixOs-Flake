local position = "bottomright"

---------------------------------------------------
--  Hotkey Control
---------------------------------------------------
vim.keymap.set({ 'n', 't' }, '<A-n>', function()
    vim.cmd(string.format('FloatermNew --position=%s', position))
end, { desc = "Floating Terminal [N]ew" })

vim.keymap.set({ 'n', 't' }, '<A-]>', '<cmd>FloatermNext<CR>', { desc = "Floating Terminal [N]ext" })
vim.keymap.set({ 'n', 't' }, '<A-[>', '<cmd>FloatermPrev<CR>', { desc = "Floating Terminal [P]revious" })

vim.keymap.set({ 'n', 't' }, '<A-\\>', function()
    local exists = vim.fn["floaterm#buflist#gather"]()[1]
    if exists ~= nil then
        vim.cmd [[FloatermToggle]]
    else
        vim.cmd(string.format('FloatermNew --position=%s', position))
    end
end, { desc = "Floating Terminal [T]oggle" })
vim.keymap.set({ 't' }, '<A-k>', '<cmd>FloatermKill<CR>', { desc = "Floating Terminal [K]ill" })

---------------------------------------------------
--  Run Rust
---------------------------------------------------
vim.keymap.set({ 'n', 't' }, '<leader>rs', '<cmd>FloatermSend nix develop ~/flake/\\#rust<CR>', { desc =
"Rust Environment" })
vim.keymap.set({ 'n', 't' }, '<leader>rr', '<cmd>FloatermSend cargo run<CR>', { desc = "Run Rust" })

---------------------------------------------------
--  Run Java maven
---------------------------------------------------
vim.keymap.set("n", "<leader>Jp", function()
    vim.cmd(string.format([[echo "Running (com.demo.App) ..."]]))

    local exists = vim.fn["floaterm#terminal#get_bufnr"]('java-term')

    if exists == -1 then
        vim.cmd(string.format('FloatermNew --name=java-term --position=%s', position))
    else
        vim.cmd [[FloatermShow --name=java-term]]
    end
    vim.cmd(string.format([[FloatermSend --name=java-term mvn package ]]))
    vim.cmd(string.format([[FloatermSend --name=java-term mvn exec:java -Dexec.mainClass="com.demo.App" -q]]))
end, { desc = "Run Maven Project" })


vim.keymap.set("n", "<leader>JP", function()
    local user_input = vim.fn.input("Enter input: ")
    vim.cmd(string.format([[echo "Running (%s) ..."]], user_input))

    if user_input ~= "" then
        -- vim.cmd(string.format([[terminal mvn clean install && mvn exec:java -dexec.mainclass="%s"]], user_input))
        local exists = vim.fn["floaterm#terminal#get_bufnr"]('java-term')

        if exists == -1 then
            vim.cmd(string.format('FloatermNew --name=java-term --position=%s', position))
        else
            vim.cmd [[FloatermShow --name=java-term]]
        end
        vim.cmd(string.format([[FloatermSend --name=java-term mvn package]], user_input))
        vim.cmd(string.format([[FloatermSend --name=java-term mvn exec:java -Dexec.mainClass="%s" -q]], user_input))
    else
        print("Skipping execution because input is empty.")
    end
end, { desc = "Run Maven Project" })

---------------------------------------------------
--  Run Spring Boot
---------------------------------------------------
vim.keymap.set("n", "<leader>JS", function()
    vim.cmd(string.format([[echo "Running (Springboot Application) ..."]]))

    local exists = vim.fn["floaterm#terminal#get_bufnr"]('springboot-term')

    if exists == -1 then
        vim.cmd(string.format('FloatermNew --name=springboot-term --position=%s', position))
    else
        vim.cmd [[FloatermShow --name=springboot-term]]
    end
    vim.cmd(string.format([[FloatermSend --name=springboot-term mvn spring-boot:run]]))
end, { desc = "Run Spring Boot Project" })
