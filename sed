# remove spam
mailq | grep mail@fitpartner.jp | awk '{print $1}' | tr -d '-' | while read -r a; do rm df$a; done

mailq | grep mail@fitpartner.jp | awk '{print $1}' | tr -d '-' | while read -r a; do rm /var/spool/mqueue/df$a; done

grep -Ril 'mail@fitpartner.jp' /var/spool/mqueue

# remove lines with comma
cat metal | sed '/,/ d' > filter

# remove lines starting with
sed '/^#/ d'

# awk 3 columns or more, get cpu specs
grep -m 1 -E '(QEMU|Intel\(R\))' /proc/cpuinfo | awk '{ print substr($0, index($0,$4)) }'

mailq | grep mail@fitpartner.jp | awk '{print $1}' | tr -d '-' | tr -d '*' | while read -r a; do echo df$a; done > /root/mq

# amo5 {{{
sed -r 's/.*From:([^]]+).*/\1/' /var/spool/mqueue/qfw695Lt29099605
cat /var/spool/mqueue/qfw695Lt29099605 | grep -Po '(?<=(\[)).*(?=\])'
echo (cat ~/Documents/sync/at1) | grep -Po '(?<=(\[)).*(?=\])'
# ssh
cat /var/spool/mqueue/qfw695Lt29099605
grep -oP 'Received: from \K([^]]+)|by \K([^.]+)' /var/spool/mqueue/qfw695Lt29099605 | paste -d' ' - -
grep -oP '\[\K([^]]+)|by \K([^.]+)' /var/spool/mqueue/qfw695Lt29099605 | paste -d' ' - -
grep -oP '(?<=(\[)).*(?=\])' /var/spool/mqueue/qfw695Lt29099605
grep -oP '(?<=(\[)).*(?=\])' /var/spool/mqueue/qfw697f5j2152305
grep -oP '(?<=(Attached|iscsiadm)).*'

# nagios extract hostname and ip
cat /etc/nagios/PSP/unix/hosts/gamakatsu-backup.cfg | sed '/#/d' | grep 'define host' -A 5 | grep -E 'host_name|address' | awk '{ print $2 }'
cat /etc/nagios/PSP/unix/hosts/example.com.cfg

# v2 working extract ip server sender subj
cat /var/spool/mqueue/qfw69CJZMH009667
grep -oP '\[\K([^]]+)|by \K([^.]+)|From:.*<\K([^>]+)|Subject: \K(.{0,50})' /var/spool/mqueue/qfw69CJZMH009667 | tail -4 | paste -d'|' - - - -
# v3
grep -oP '\[\K([^]]+)|by \K([^.]+)|From: \K([^H]+)|Subject: \K(.{0,40})' /var/spool/mqueue/qfw69CJZMH009667 | tail -4 | paste -d "|" - - - -
grep -oP '\[\K([^]]+)|by \K([^.]+)|[^From:]*<\K([^>]+)|Subject: \K(.{0,40})' /var/spool/mqueue/qfw697f5j2152305 | tail -4 | paste -d'|' - - - -
cat /var/spool/mqueue/qfw698ig1V181577
# v4 !!!
grep -oP '\[\K([^]]+)|by \K([^.]+)|From: \K([^\n]+)|Subject: \K(.{0,40})' /var/spool/mqueue/qfw698WwNg227706 | tail -4 | paste -d "|" - - - -
grep -oP '\[\K([^]]+)|by \K([^.]+)|From: \K(\w+@\w+\.\w+)|Subject: \K(.{0,40})' /var/spool/mqueue/qfw698WwNg227706 | tail -4 | paste -d "|" - - - -
cat /var/spool/mqueue/qfw698WwNg227706
(^H\?\?From.*)
# match all except starting with foo
^(?!foo).*$
# match everything but "="
[^=]*
# ref
sed -r 's/.*\[([^]]+).*by ([^.]+)[^<]*<([^>]+).*Subject: (.{0,30}).*/\1 \2 \3 \4/' ~/Documents/sync/d2.txt
echo (cat ~/Documents/sync/at1) | sed -r 's/.*\[([^]]+).*by ([^.]+).*Subject: (.{0,50}).*/\1 \2 \3/'
# }}}
# old {{{
# extract text between UserExtra/ and $
sed -r 's/.*UserExtra\/([^$]+).*/\1/' ~/mtt/ltp60UX.txt > ~/mtt/ltp60n.txt

# surround path in single quotes
sed -e "s/\(.*\)/'\1'/" ~/mtt/ltp60p.txt

# https://askubuntu.com/questions/697120/extract-word-from-string-using-grep-sed-awk

# data file
a=0,b=3,c=5
a=2,b=0,c=4
a=3,b=6,c=7

# sed file
sed -r 's/^a=([0-9]+).*/\1/' d.txt
# test
sed -r 's/^a=([0-9]+).*c=([0-9]+)$/\1 \2/' d.txt

# sed file
sed -r 's/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/\1/' d2.txt
sed 's/[^"]*"\([^"]*\).*/\1/'
# echo $t2 | grep -Po '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'

# sed extract substring
# finished extract ip, server, from
sed -r 's/.*\[([^]]+).*by ([^.]+)[^<]*<([^>]+).*Subject: (.{0,30}).*/\1 \2 \3 \4/' ~/Documents/sync/d2.txt
vim ~/Documents/sync/d2.txt
# remove line breaks fish
echo (cat ~/Documents/sync/at1) | sed -r 's/.*amout([^.]+).*/\1/'
# remove line breaks bash
echo $(cat ~/Documents/sync/at1)
# extract last ip, server, subject!!
echo (cat ~/Documents/sync/at1) | sed -r 's/.*\[([^]]+).*by ([^.]+).*Subject: (.{0,50}).*/\1 \2 \3/'
echo (cat ~/Documents/sync/at1)

echo $(cat /var/spool/mqueue/qfw678Ev6U210105) | sed -r 's/.*\[([^]]+).*by ([^.]+).*Subject: (.{0,50}).*/\1 \2 \3/'
echo $(cat /var/spool/mqueue/qfw695Lt29099605) | sed -r 's/.*\[([^]]+).*/\1/'
w678Ev6U210105

# test new
# Received: from [127.0.0.1] (unknown [177.23.208.82]) by ampri01.alpha-mail.net
sed -r 's/.*\[([^]]+).*by ([^.]+)[^<]*<([^>]+).*Subject: (.{0,30}).*/\1 \2 \3 \4/' ~/Documents/sync/d2.txt
echo $(cat /var/spool/mqueue/qfw678Ev6U210105) | sed -r 's/.*\[([^]]+).*/\1/'
echo $(cat /var/spool/mqueue/qfw678Ev6U210105) | sed -r 's/.*Received([^]]+)$.*/\1/'
echo $(cat /var/spool/mqueue/qfw678Ev6U210105) | sed -r 's/.*\[177([^0]+).*/\1/'
echo (cat ~/Documents/sync/at1) | sed -r 's/.*Received([^]]+)$.*by ([^.]+).*/\1 \2/'
echo $(cat /var/spool/mqueue/qfw678Ev6U210105)
# working
echo (cat ~/Documents/sync/at1) | grep -Po '(?<=(\[)).*(?=\])'
sed -e 's/.*Here\(.*\)String.*/\1/'
echo (cat ~/Documents/sync/at1) | sed -r 's/.*Received([0-9]+)/\1/'
# test at1
# find files containing text
grep -rnw '/path/to/somewhere/' -e 'pattern'

# replace text in file
sed -i 's/old-text/new-text/g' input.txt

sed -r 's/(ampri.*)/\1/' d3.txt
# }}}
