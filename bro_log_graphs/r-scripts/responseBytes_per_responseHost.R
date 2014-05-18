library('ggplot2');
conn_col_names <- c("ts", "uid", "id.orig_h",	"id.orig_p", "id.resp_h", "id.resp_p", "proto", "service", "duration", "orig_bytes", "resp_bytes", "conn_state", "local_orig", "missed_bytes", "history", "orig_pkts", "orig_ip_bytes", "resp_pkts", "resp_ip_bytes");
conns <- read.table("conn.log", header=FALSE, sep="\t", col.names=conn_col_names, skip=7);
capture_duration <- floor(max(conns$ts) - min(conns$ts));
connections <- nrow(conns);
qplot(data=conns, y=as.numeric(resp_bytes), x=id.resp_h, geom="boxplot", main=paste(connections, " connections in ", capture_duration, " seconds", sep=""), xlab="Response Host", ylab="Response Bytes") + theme(axis.text.x=element_text(angle=90, hjust=1)) + guides(size=FALSE);
ggsave("tiger.jpg");