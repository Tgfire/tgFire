do

local function run(msg, matches)
if matches[1]=="me" and is_sudo(msg) then 
return  "*Your ID* 》 _"..user.."_\n *Your Rank* 》 _بابایی 😍_"
elseif matches[1]=="me" and is_admin(msg) then 
return  "*Your ID* 》 _"..user.."_\n *Your Rank* 》 _Bot Admin❤️_"
elseif matches[1]=="me" and is_owner(msg) then 
return  "*Your ID* 》 _"..user.."_\n *Your Rank* 》 _Owner❤️_"
elseif matches[1]=="me" and is_mod(msg) then 
return  "*Your ID* 》 _"..user.."_\n *Your Rank* 》 _GP Admin❤️_"
else
return  "*Your ID* 》 _"..user.."_\n *Your Rank* 》 _Member_"
end

end

return {
  patterns = {
    "^[!#/](me)$",
    },
  run = run
}
end


--By @toofansheytani_shah
-- @fire_channel
