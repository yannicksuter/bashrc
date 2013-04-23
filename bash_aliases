alias paria="time par2repair *.par2 *"
alias rockn="vlc http://105-stream-02.datacomm.ch:8000/rocknation"

alias puppetvalidate='for puppetfile in $(find . -iname "*.pp"); do puppet parser validate --render-as s --modulepath=modules ${puppetfile}; done; echo "done"'
