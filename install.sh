#!/bin/bash

TABLES_ROOT='/etc/iptables'

BLACKLIST_FILE=$TABLES_ROOT/blacklist.txt

SERVICES_FILE=$TABLES_ROOT/services.txt

##
# These need to be true and there is no corrective action that we
# can take if they are not
##
check()
{
  if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
  fi

  FOUND=`which iptables`
  if [ -z "$FOUND" ]; then
    echo "iptables does not appear to be installed" 1>&2
    exit 1
  fi

	FOUND=`uname -s`
	if [ "$FOUND" != "Linux" ]; then
		echo "This software assumes we are running Linux" 1>&2
		exit 1
	fi
}

##
# Things that need to exist but we can fix them if they do not
##
needed()
{
  if [ ! -d "$TABLES_ROOT" ]; then
    echo "The directory $TABLES_ROOT is missing" 1>&2
    mkdir $TABLES_ROOT
  fi

  # Force the permissions
  chmod a=rx,u+w $TABLES_ROOT

  if [ ! -r "$BLACKLIST_FILE" ]; then
    echo "The file $BLACKLIST_FILE is missing"
    touch $BLACKLIST_FILE
  fi

  # Force the permissions
  chmod a=r,u+w $BLACKLIST_FILE

  if [ ! -r "$SERVICES_FILE" ]; then
    echo "The file $SERVICES_FILE is missing"
    echo 22 > $SERVICES_FILE
  fi

  # Force the permissions
  chmod a=r,u+w $SERVICES_FILE
}

check
needed

install -g root -o root -m a=r,u+x fw /usr/local/sbin/fw
