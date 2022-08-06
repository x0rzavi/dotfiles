#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Install my necessary fonts
# Dependencies: aria2, 7z

# Safer script
set -o errexit
set -o nounset
trap "exit" INT

# Temp directory to unpack into
directory=$(pwd)
mkdir -p "${directory}"/fonts_tmpdir
unpackdir="${directory}"/fonts_tmpdir
cd "${unpackdir}"

noto () {
	cat <<- EOF > noto.txt
	https://fonts.google.com/download?family=Noto%20Sans
	https://fonts.google.com/download?family=Noto%20Sans%20Mono
	https://fonts.google.com/download?family=Noto%20Serif
	EOF
	cat <<- EOF > notosans.txt
	NotoSans-Regular.ttf
	NotoSans-Italic.ttf
	# NotoSans-Medium.ttf
	# NotoSans-MediumItalic.ttf
	EOF
	cat <<- EOF > notosansmono.txt
	static/NotoSansMono/NotoSansMono-Regular.ttf
	# static/NotoSansMono/NotoSansMono-Medium.ttf
	EOF
	cat <<- EOF > notoserif.txt
	NotoSerif-Regular.ttf
	NotoSerif-Italic.ttf
	EOF

	mkdir -p "${unpackdir}"/noto
	aria2c -c -x16 -j16 --console-log-level=warn --dir="${unpackdir}" --input-file="${unpackdir}"/noto.txt && echo ''
	7z e -bso0 -y 'Noto_Sans.zip' -i'@notosans.txt' -o"${unpackdir}"/noto
	7z e -bso0 -y 'Noto_Sans_Mono.zip' -i'@notosansmono.txt' -o"${unpackdir}"/noto
	7z e -bso0 -y 'Noto_Serif.zip' -i'@notoserif.txt' -o"${unpackdir}"/noto
	rm "${unpackdir}"/Noto*.zip
}

notocjk () {
	cat <<- EOF > notocjk.txt
	https://fonts.google.com/download?family=Noto%20Sans%20HK
	https://fonts.google.com/download?family=Noto%20Sans%20JP
	https://fonts.google.com/download?family=Noto%20Sans%20KR
	https://fonts.google.com/download?family=Noto%20Sans%20SC
	https://fonts.google.com/download?family=Noto%20Sans%20TC
	EOF
	cat <<- EOF > notosanshk.txt
	NotoSansHK-Regular.otf
	# NotoSansHK-Medium.otf
	EOF
	cat <<- EOF > notosansjp.txt
	NotoSansJP-Regular.otf
	# NotoSansJP-Medium.otf
	EOF
	cat <<- EOF > notosanskr.txt
	NotoSansKR-Regular.otf
	# NotoSansKR-Medium.otf
	EOF
	cat <<- EOF > notosanssc.txt
	NotoSansSC-Regular.otf
	# NotoSansSC-Medium.otf
	EOF
	cat <<- EOF > notosanstc.txt
	NotoSansTC-Regular.otf
	# NotoSansTC-Medium.otf
	EOF

	mkdir -p "${unpackdir}"/notocjk
	aria2c -c -x16 -j16 --console-log-level=warn --dir="${unpackdir}" --input-file="${unpackdir}"/notocjk.txt && echo ''
	7z e -bso0 -y 'Noto_Sans_HK.zip' -i'@notosanshk.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_JP.zip' -i'@notosansjp.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_KR.zip' -i'@notosanskr.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_SC.zip' -i'@notosanssc.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_TC.zip' -i'@notosanstc.txt' -o"${unpackdir}"/notocjk
	rm "${unpackdir}"/Noto*.zip
}

notolingual () {
	cat <<- EOF > notolingual.txt
	https://fonts.google.com/download?family=Noto%20Naskh%20Arabic
	https://fonts.google.com/download?family=Noto%20Serif%20Bengali
	https://fonts.google.com/download?family=Noto%20Serif%20Devanagari
	EOF
	cat <<- EOF > notonaskharabic.txt
	static/NotoNaskhArabic-Regular.ttf
	# static/NotoNaskhArabic-Medium.ttf
	EOF
	cat <<- EOF > notoserifbengali.txt
	static/NotoSerifBengali/NotoSerifBengali-Regular.ttf
	# static/NotoSerifBengali/NotoSerifBengali-Medium.ttf
	EOF
	cat <<- EOF > notoserifdevanagari.txt
	static/NotoSerifDevanagari/NotoSerifDevanagari-Regular.ttf
	# static/NotoSerifDevanagari/NotoSerifDevanagari-Medium.ttf
	EOF

	mkdir -p "${unpackdir}"/notolingual
	aria2c -c -x16 -j16 --console-log-level=warn --dir="${unpackdir}" --input-file="${unpackdir}"/notolingual.txt && echo ''
	7z e -bso0 -y 'Noto_Naskh_Arabic.zip' -i'@notonaskharabic.txt' -o"${unpackdir}"/notolingual
	7z e -bso0 -y 'Noto_Serif_Bengali.zip' -i'@notoserifbengali.txt' -o"${unpackdir}"/notolingual
	7z e -bso0 -y 'Noto_Serif_Devanagari.zip' -i'@notoserifdevanagari.txt' -o"${unpackdir}"/notolingual
	rm "${unpackdir}"/Noto*.zip
}

notomisc () {
	cat <<- EOF > notomisc.txt
	https://fonts.google.com/download?family=Noto%20Emoji
	https://fonts.google.com/download?family=Noto%20Sans%20Math
	https://fonts.google.com/download?family=Noto%20Music
	https://fonts.google.com/download?family=Noto%20Sans%20Symbols
	https://fonts.google.com/download?family=Noto%20Sans%20Symbols%202
	EOF
	cat <<- EOF > notoemoji.txt
	static/NotoEmoji-Regular.ttf
	# static/NotoEmoji-Medium.ttf
	EOF
	cat <<- EOF > notosansmath.txt
	NotoSansMath-Regular.ttf
	EOF
	cat <<- EOF > notomusic.txt
	NotoMusic-Regular.ttf
	EOF
	cat <<- EOF > notosanssymbols.txt
	static/NotoSansSymbols-Regular.ttf
	# static/NotoSansSymbols-Medium.ttf
	EOF
	cat <<- EOF > notosanssymbols2.txt
	NotoSansSymbols2-Regular.ttf
	EOF

	mkdir -p "${unpackdir}"/notomisc
	aria2c -c -x16 -j16 --console-log-level=warn --dir="${unpackdir}" --input-file="${unpackdir}"/notomisc.txt && echo ''
	7z e -bso0 -y 'Noto_Emoji.zip' -i'@notoemoji.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Sans_Math.zip' -i'@notosansmath.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Music.zip' -i'@notomusic.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Sans_Symbols.zip' -i'@notosanssymbols.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Sans_Symbols_2.zip' -i'@notosanssymbols2.txt' -o"${unpackdir}"/notomisc
	rm "${unpackdir}"/Noto*.zip
}

applefonts () {
	cat <<- EOF > applefonts.txt
	AppleFontsNerdPatched/NewYorkSmall-Regular.otf
	AppleFontsNerdPatched/NewYorkSmall-RegularItalic.otf
	AppleFontsNerdPatched/SFMono Medium Nerd Font Complete.otf
	AppleFontsNerdPatched/SFMono Medium Italic Nerd Font Complete.otf
	AppleFontsNerdPatched/SF-Pro-Text-Medium.otf
	AppleFontsNerdPatched/SF-Pro-Text-MediumItalic.otf
	EOF

	mkdir -p "${unpackdir}"/applefonts
	curl -s https://api.github.com/repos/x0rzavi/apple-fonts-nerd-patched/releases/latest \
	| grep "browser_download_url.*.7z" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y 'AppleFontsNerdPatched.7z' -i'@applefonts.txt' -o"${unpackdir}"/applefonts && echo ""
	rm "${unpackdir}"/Apple*.7z
}

iosevka () {
	cat <<- EOF > iosevka.txt
	Iosevka Term Medium Nerd Font Complete.ttf
	Iosevka Term Medium Italic Nerd Font Complete.ttf
	EOF

	mkdir -p "${unpackdir}"/iosevka
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
	| grep "browser_download_url.*Iosevka.zip" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y 'Iosevka.zip' -i'@iosevka.txt' -o"${unpackdir}"/iosevka && echo ""
	rm "${unpackdir}"/Iosevka.zip
}

jetbrainsmono () {
	cat <<- EOF > jetbrainsmono.txt
	JetBrains Mono Medium Nerd Font Complete.ttf
	JetBrains Mono Medium Italic Nerd Font Complete.ttf
	EOF

	mkdir -p "${unpackdir}"/jetbrainsmono
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
	| grep "browser_download_url.*JetBrainsMono.zip" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y 'JetBrainsMono.zip' -i'@jetbrainsmono.txt' -o"${unpackdir}"/jetbrainsmono && echo ""
	rm "${unpackdir}"/JetBrainsMono.zip
}

lucide () {
	cat <<- EOF > lucide.txt
	lucide-font/lucide.ttf
	EOF

	mkdir -p "${unpackdir}"/misc
	curl -s https://api.github.com/repos/lucide-icons/lucide/releases/latest \
	| grep "browser_download_url.*lucide-font.*.zip" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y "lucide-font*.zip" -i'@lucide.txt' -o"${unpackdir}"/misc && echo ""
	rm "${unpackdir}"/lucide-font*.zip
}

install_fonts () {
	#noto
	#notocjk
	#notolingual
	notomisc
	#applefonts
	#jetbrainsmono
	#iosevka
	#lucide
	set +e && rm "${unpackdir}"/*.txt && set -e
	# printf "Please input your root password to proceed for moving files: "
	# sudo mkdir -p /usr/local/share/fonts/ && set +e && sudo mv "${unpackdir}"/* /usr/local/share/fonts/ && set -e
	# echo "" && fc-cache --really-force --verbose
	# rm -rf "${unpackdir}"
}

install_fonts
