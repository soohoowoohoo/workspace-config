# load zsh functions
for file in ~/workspace/.zshfunctions/*; do
	autoload $file
done

# path
alias w='cd ~/workspace'
alias r='cd ~/workspace/repositories'
alias s='cd ~/workspace/scripts'
alias show_hidden='ls -ld .?*'

# git
# alias git="hub"
alias b='git branch'
alias bcp='+git-branch-cherrypick'
alias bcu='+git-branch-cleanup'
alias bc='+git-branch-create'
alias gs='git status'
alias gc='git checkout'
alias gcm='git checkout master'
alias ghud='git pull -r upstream master'
export GH_HOST=github.ibm.com
export GITHUB_ENTERPRISE_TOKEN=$(cat ~/workspace/.ghe-cli-access-token)
export GITHUB_TOKEN=$(cat ~/workspace/.gh-cli-access-token)

# kube
alias getNodes='+kubectl-get-nodes-detailed'

# python config
export PATH=/Users/soohoos/Library/Python/2.7/bin:${PATH} # add python2 pip support
export PATH=/Users/soohoos/Library/Python/3.9/bin:${PATH} # add python3 binary support

# golang config
# go env -w GOPATH=/Users/soohoos/workspace/golang
export PATH=$(go env GOPATH)/bin:${PATH}

# ruby config
export PATH=/Users/soohoos/.gem/ruby/2.6.0/bin:${PATH}
# export GEM_PATH=/opt/homebrew/lib/ruby/gems/3.3.0/bin

# java config
# run the below command to find your java home
# java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home'
# old java home
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=/Users/soohoos/.sdkman/candidates/java/8.0.345.fx-zulu/zulu-8.jdk/Contents/Home/jre
export PATH=/usr/local/apache-maven-3.6.0/bin:${PATH}

# scripting config
export PATH=~/workspace/.scripts:${PATH}
export PATH=./.soohoo_scripts:$PATH
export PATH=.:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
