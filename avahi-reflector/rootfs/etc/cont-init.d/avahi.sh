#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: chrony
# Configures chrony
# ==============================================================================
readonly AVAHI_CONF='/etc/avahi/avahi-daemon.conf'
declare HOSTNAME
declare INTERFACE

HOSTNAME=$(bashio::config 'host_name')
if bashio::var.is_empty "${HOSTNAME}"; then
    bashio::log.warning "Can't read hostname, using default."
    hostname="hassio"
fi

INTERFACE=$(bashio::config 'allow_interfaces')
if bashio::var.is_empty "${INTERFACE}"; then
    bashio::log.warning "Can't read interface, using default."
    INTERFACE=$(bashio::network.name)
fi



bashio::log.info "Using hostname=${HOSTNAME} interface=${INTERFACE}"

# Write configuration file
    bashio::log.debug "Adding hostname ${HOSTNAME}"
    echo "host-name=${HOSTNAME}" >> ${AVAHI_CONF}
	  bashio::log.debug "Adding interface ${INTERFACE}"
		echo "allow-interfaces=${INTERFACE}" >> ${AVAHI_CONF}
