# one-line functions

# translate urlencoded greek to utf-8
2greek() { echo "echo urldecode( '$1');" | php -a; }
big20() { find "$1" -ls -type f | gawk '{print $7,$11}' | sort -nr | head -20; }
d() { dict "$@" | more; }
dvd.sound.rip() { mpv -ao pcm -vc dummy -vo null dvd://1 -ao pcm:file="$1"; }
llh() { /bin/ls -lFArt --color "$@" | head; }
llt() { /bin/ls -lFArt --color "$@" | tail; }
mkcd() { [ ! -z "$1" ] && mkdir -vp "$@" && cd "$_" || return; }
showtime() { perl -ne '$now = localtime; print "$now ",$_'; }
# a function to spell-check
sp() { echo "$*" | aspell -a ;}
#sp() { echo "$*" | aspell clean strict ;}
tolower() { echo "${@,,}"; }
# twitfollowers() { curl -s https://twitter.com/$1 | grep -o '[0-9,]* Followers'; }

trandom() {
	[ -z "$1" ] && N="1" || N="$1"
	t ls | shuf | head "-$N"
}

acronym() {
	acro="$*"
	yes | w3m -graph -dump "http://acronyms.thefreedictionary.com/$acro" | \
		grep -wi "^${acro}\s\s\s" | more
}

wikipedia() {
	what="$*"
	wikipedia2text "$what" | mailx -s "wikipedia article: $what" $USER
	echo wikipedia article about "$what" sent to mailbox
}

pushd()
{
	[ $# -eq 0 ] && DIR="${HOME}" || DIR="$1"

	builtin pushd "${DIR}" > /dev/null
	echo -n "DIRSTACK: "
	dirs
}

popd()
{
	builtin popd > /dev/null
	echo -n "DIRSTACK: "
	dirs
}
