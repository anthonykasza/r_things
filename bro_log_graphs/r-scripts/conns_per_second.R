library('ggplot2');
conn_col_names <- c("ts", "uid", "id.orig_h",  "id.orig_p", "id.resp_h", "id.resp_p", "proto", "service", "duration", "orig_bytes", "resp_bytes", "conn_state", "local_orig", "missed_bytes", "history", "orig_pkts", "orig_ip_bytes", "resp_pkts", "resp_ip_bytes");
conn <- read.table("conn.log", header=FALSE, sep="\t", col.names=conn_col_names, skip=7);
secs <- floor((max(conn$ts) - min(conn$ts)));
ybreaks <- seq(0, 65535, 5000);
qplot(data=conn, x=ts, y=id.resp_p, color=proto, alpha=I(1/4), size=factor(as.numeric(orig_bytes)), main="Connections - Ports by Time", xlab=paste("Time (", secs, " seconds)", sep=""), ylab="Port Number") + guides(size=FALSE);
#ggsave(paste(sensor, "conns_per_second.jpg", sep=""));
remove(conn);