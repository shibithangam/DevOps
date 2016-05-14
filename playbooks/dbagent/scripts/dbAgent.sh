### BEGIN INIT INFO
# Provides:          dbAgent
# Required-Start:    $syslog $remote_fs
# Required-Stop:     $syslog $remote_fs
# Default-Start:     3 5
# Default-Stop:      0 1 2 6
# Description:       Start dbAgent to collect stats
### END INIT INFO#


#Java install directory
JAVA="/usr/bin/java"

#agent's install directory
AGENT_HOME="/opt/appdynamics/deploy_env"
AGENT="$AGENT_HOME/db-agent.jar"

#CHANGE ME: Set to a name that is unique to the Controller - required when a machine agent is
#also running on the same hardware
AGENT_OPTIONS="-Dappdynamics.agent.uniqueHostId='inventory_hostname'"

# Agent Options
#AGENT_OPTIONS=""
AGENT_OPTIONS="$AGENT_OPTIONS -Dappdynamics.agent.logging.dir=$AGENT_HOME/logs -Duser.timezone=UTC-06:00"
#AGENT_OPTIONS="$AGENT_OPTIONS -Dmetric.http.listener=true | false
#AGENT_OPTIONS="$AGENT_OPTIONS -Dmetric.http.listener.port=<port>"
#AGENT_OPTIONS="$AGENT_OPTIONS -Dserver.name=<hostname>"


start()
{
nohup $JAVA $AGENT_OPTIONS -Xmx32m -jar $AGENT > /var/log/agent-eqa.log 2>&1 &
}

stop()
{
ps -opid,cmd |egrep "[0-9]+ java.*db-agent" | awk '{print $1}' | xargs --no-run-if-empty kill -9
}

case "$1" in
start)
start
;;

stop)
stop
;;

restart)
stop
start
;;
*)
echo "Usage: $0 start|stop|restart"
esac