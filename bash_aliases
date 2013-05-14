alias paria="time par2repair *.par2 *"
alias rockn="vlc http://105-stream-02.datacomm.ch:8000/rocknation"

alias nrsync='rsync -e "ssh -o StrictHostKeyChecking=false -o UserKnownHostsFile=/dev/null"'
alias nscp='scp -o StrictHostKeyChecking=false -o UserKnownHostsFile=/dev/null'
alias nssh='ssh -o StrictHostKeyChecking=false -o UserKnownHostsFile=/dev/null'

alias puppetvalidate='for puppetfile in $(find . -iname "*.pp"); do puppet parser validate --render-as s --modulepath=modules ${puppetfile}; done; echo "done"'
alias plint='puppet-lint --with-filename --no-80chars-check .'
