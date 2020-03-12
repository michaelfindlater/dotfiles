export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vi goodness
set -o vi
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
alias ls='ls -G'
alias ku='kubectl describe nodes | grep -A 2 -e "^\\s*CPU Requests"'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com.'
alias kdp='kubectl describe pod'
alias kb="kubectl exec -it"
alias nodepods="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces"
alias nodepods_u="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces | awk '!seen[$1]++'"
alias isys="kubectl get service -n istio-system"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias vm='gcloud beta compute --project "facy-production" ssh --zone "asia-northeast1-a" "dev2"'
alias failedpods="kubectl get pods --field-selector=status.phase=Failed --all-namespaces"
alias delfailed="kubectl delete pods --field-selector=status.phase=Failed"
alias delcompleted="kubectl delete pods --field-selector=status.phase=Completed"

export KUBE_EDITOR=nvim
export GIT_PROMPT_THEME=Chmike

kreveal() {
    kubectl get secret "$1" -o json | jq '.data | map_values(@base64d)'
}
