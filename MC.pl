use lib '.';
use MineStat;
use Socket;
use strict;
if ($#ARGV != 1) {
  print "MC.pl <ip> <port>\n\n";
  exit(1);
}
my ($ip,$port) = @ARGV;


# Below is an example using the MineStat class.
# If server is offline, other instance members will be undef.
&MineStat::init("$ip", $port);
print "Minecraft server status of $MineStat::address on port $MineStat::port:\n";
if($MineStat::online)
{
  print "Server is online running version $MineStat::version\n";
  print "with $MineStat::current_players out of $MineStat::max_players players.\n";
  print "Message of the day: $MineStat::motd\n";
  print "Latency: ${MineStat::latency}ms\n";
}
else
{
  print "Server is offline!\n";
}
