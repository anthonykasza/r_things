library('fpc');
library('ggplot2');
http_col_names <- c("ts", "uid", "id.orig_h", "id.orig_p", "id.resp_h", "id.resp_p", "trans_depth", "method", "host", "uri", "referrer", "user_agent", "request_body_len", "response_body_len", "status_code", "status_msg", "info_code", "info_msg", "filename", "tags", "username", "password", "proxied", "mime_type", "md5", "extraction_file");
http <- read.table("http.log", header=FALSE, sep="\t", col.names=http_col_names, skip=7, fill=TRUE);
capture_duration <- floor(max(http$ts) - min(http$ts));
http_count <- nrow(http);
qplot(data=http, host, main=paste(http_count, " HTTP connections in ", capture_duration, " seconds", sep=""), ylab="Connection Count", xlab="HTTP Host Header") + coord_flip();
ggsave("toga.jpg")