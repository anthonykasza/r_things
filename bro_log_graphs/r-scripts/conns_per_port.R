library('ggplot2');
conn_col_names <- c("ts", "uid", "id.orig_h",  "id.orig_p", "id.resp_h", "id.resp_p", "proto", "service", "duration", "orig_bytes", "resp_bytes", "conn_state", "local_orig", "missed_bytes", "history", "orig_pkts", "orig_ip_bytes", "resp_pkts", "resp_ip_bytes");
conn <- read.table("conn.log", header=FALSE, sep="\t", col.names=conn_col_names, skip=7);
port <- seq(1, 65536, 1);
ports <- conn$id.resp_p;
bytes <- conn$orig_bytes;
pb <- rbind(ports, bytes);
remove(conn, ports, bytes); # pb remains
total <- matrix(nrow=2, ncol=65536);
total[1,] <- 0;
total[2,] <- 0;
for (ALL in 1:ncol(pb)){
  cport <- pb[1, ALL];
  cbyte <- pb[2, ALL];
  total[2, cport] <- total[2, cport] + cbyte;
  total[1, cport] <- total[1, cport] + 1;
}
qplot(x=port, y=total[1,], size=total[2,], alpha=factor(total[2,]), main=paste("Connections and Bytes Per Port"), xlab="Port Number", ylab="Connection Count (log scale)", log="y", label=port, geom="text") + guides(size=FALSE) + theme(legend.position="none");