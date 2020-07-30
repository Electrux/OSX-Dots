function stopvm --wraps='VBoxManage controlvm'
VBoxManage controlvm $argv poweroff
end
