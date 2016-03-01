# Log all queries.
function mysqlLog {
  drush sql-cli << EOF
SET global log_output = 'FILE';
SET global general_log_file='/tmp/query.log';
SET global general_log = 1;
EOF
  echo "Queries will be saved at /tmp/query.log"
}

# Stop logging all queries.
function mysqlUnlog {
  sudo service mysql restart
}

# Git branch in prompt
source ~/.git-prompt.sh
PS1='\u@\h\w$(__git_ps1 "(%s)")\$ '
#PS1='\w$(__git_ps1 "(%s)") > '

