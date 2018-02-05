#!/usr/bin/env bash
# shellcheck disable=SC2029
alias vi='vim'
alias fail='tail -f'
alias telnet='telnet -K'
alias q='exit'
alias k='kubectl'
alias radb='whois -h whois.radb.net --'
alias l3rr='whois -h rr.level3.net --'
alias awho='whois -h whois.arin.net --'
alias arr='whois -h rr.arin.net --'
alias rviews='telnet route-views.routeviews.org'
alias nocom='egrep -v "^$|^[[:space:]]*#"'
alias ssh-insecure='ssh -o StrictHostKeyChecking=no'
weather() { if [[ -n $1 ]]; then LOC=$(echo -n "~$*" | jq -s -R -r @uri); fi; curl -kA curl "https://wttr.in/${LOC}"; }
