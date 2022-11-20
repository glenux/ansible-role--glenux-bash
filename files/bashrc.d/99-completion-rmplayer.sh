
# completion programmable sur les URLs qui vont bien

# mpv
# complete -W " 'mms://vip7.yacast.fr/encoderouifm' 
# 'mms://vipbu.yacast.fr/encoderouifm'
# 'mms://vip2.yacast.fr/encoderfun1'
# 'mms://vipbu.yacast.fr/encoderfun'
# 'mms://vip1.yacast.fr/encodernrj'
# 'mms://vipbu.yacast.fr/encodernrj'
# 'mms://vip1.yacast.fr/encodernostalgie' 
# " mpv
# 

_complete_mpv() {
	COMPREPLY=()
}

complete -o default -o nospace -F _complete_mpv mpv
