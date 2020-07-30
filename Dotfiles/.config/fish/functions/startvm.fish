function startvm --wraps='VBoxManage startvm'
VBoxManage startvm $argv --type headless
end
