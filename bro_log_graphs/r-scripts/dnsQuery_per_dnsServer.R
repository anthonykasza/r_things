library('ggplot2');
dns_col_names <- c("ts", "uid", "id.orig_h", "id.orig_p", "id.resp_h", "id.resp_p", "proto", "trans_id", "query", "qclass", "qclass_name", "qtype", "qtype_name", "rcode", "rcode_name", "QR", "AA", "TC", "RD", "RA", "Z", "answers", "TTLs");
dns <- read.table("dns.log", header=FALSE, sep="\t", col.names=dns_col_names, skip=7);
ggplot (dns, aes(id.resp_h, fill=qtype_name)) + labs(fill="Query Types", title="DNS Server Preferences", x="DNS Server", y="Query Count") + geom_histogram();
ggsave("texas.jpg");