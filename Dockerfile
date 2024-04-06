FROM pretix/standalone:stable
USER root
#replace or append pretix-mollie in the next line with any plugins you would like to include, see more at: https://marketplace.pretix.eu/
RUN pip3 install pretix-mollie
USER pretixuser
RUN cd /pretix/src && make production
