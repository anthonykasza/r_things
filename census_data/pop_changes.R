library(ggplot2);
library(reshape2);
options(scipen=5);
# Apportionment Data
raw <- read.csv("http://www.census.gov/2010census/csv/pop_change.csv", comment.char="#");
raw <- raw[!(raw$STATE_OR_REGION=="United States" | raw$STATE_OR_REGION=="Puerto Rico" | raw$STATE_OR_REGION=="Northeast" | raw$STATE_OR_REGION=="Midwest" | raw$STATE_OR_REGION=="Southwest" | raw$STATE_OR_REGION=="South" | raw$STATE_OR_REGION=="West"),1:12];
changes <- data.frame(id=seq_along(raw$STATE_OR_REGION), raw);
changes_df <- melt(changes, id.var = c("id", "STATE_OR_REGION"));
ggplot(changes_df, aes(variable, value, group=id, label=STATE_OR_REGION, colour=STATE_OR_REGION)) + geom_path(alpha=(3/4), size=(3/5)) + ylab("") + xlab("") + scale_x_discrete(labels=c("1910","1920","1930","1940","1950","1960","1970","1980","1990","2000","2010")) + theme(legend.position="none") + scale_y_log10() + geom_text(vjust=0, data=changes_df[511:561,], size=5) + geom_text(vjust=0, data=changes_df[1:51,], size=5) + theme(axis.text.x=element_text(size=24), axis.text.y=element_text(size=24), panel.background=element_rect(fill="black"), panel.grid.major=element_line(color="dark grey", linetype="1f", size=(1/4)), panel.grid.minor=element_blank(), axis.ticks=element_line(size=0), plot.background=element_rect(fill="black")) + geom_text(color="white",aes(8.5, 107500, label = "100 Years of State Populations"), size=12);
ggsave(file="state_population_changes.png", height=52, width=28, limitsize=FALSE);