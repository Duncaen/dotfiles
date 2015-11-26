PAGER=$(command -v less)
LESS="-FXRi"
# LESSHISTFILE=-
MANWIDTH=80

# colored man pages:
LESS_TERMCAP_md=$'\e[1;31m'     # start bold
LESS_TERMCAP_so=$'\e[1;40;37m'  # start standout
LESS_TERMCAP_se=$'\e[0m'        # end standout
LESS_TERMCAP_us=$'\e[0;34m'     # start underlining
LESS_TERMCAP_ue=$'\e[0m'        # end underlining
LESS_TERMCAP_me=$'\e[0m'        # end all modes]']']']']']'

export PAGER LESS LESSHISTFILE MANWIDTH LESS_TERMCAP_md LESS_TERMCAP_so \
       LESS_TERMCAP_se LESS_TERMCAP_us LESS_TERMCAP_ue LESS_TERMCAP_me
