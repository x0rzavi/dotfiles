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

cleanup () {
	set +e ; rm "${unpackdir}"/*.zip ; rm "${unpackdir}"/*.txt ; rm "${unpackdir}"/*.7z ; set -e
}

## Noto family fonts
##
noto () {
	cat <<- EOF > noto.txt
	https://fonts.google.com/download?family=Noto%20Sans
	https://fonts.google.com/download?family=Noto%20Sans%20Mono
	https://fonts.google.com/download?family=Noto%20Serif
	EOF
	cat <<- EOF > notosans.txt
	# NotoSans-Regular.ttf
	# NotoSans-Italic.ttf
	NotoSans-Medium.ttf
	NotoSans-MediumItalic.ttf
	EOF
	cat <<- EOF > notosansmono.txt
	# static/NotoSansMono/NotoSansMono-Regular.ttf
	static/NotoSansMono/NotoSansMono-Medium.ttf
	EOF
	cat <<- EOF > notoserif.txt
	NotoSerif-Regular.ttf
	NotoSerif-Italic.ttf
	EOF

	mkdir -p "${unpackdir}"/noto
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}" --input-file="${unpackdir}"/noto.txt || true && echo ''
	7z e -bso0 -y 'Noto_Sans.zip' -i'@notosans.txt' -o"${unpackdir}"/noto
	7z e -bso0 -y 'Noto_Sans_Mono.zip' -i'@notosansmono.txt' -o"${unpackdir}"/noto
	7z e -bso0 -y 'Noto_Serif.zip' -i'@notoserif.txt' -o"${unpackdir}"/noto
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
	# NotoSansHK-Regular.otf
	NotoSansHK-Medium.otf
	EOF
	cat <<- EOF > notosansjp.txt
	# NotoSansJP-Regular.otf
	NotoSansJP-Medium.otf
	EOF
	cat <<- EOF > notosanskr.txt
	# NotoSansKR-Regular.otf
	NotoSansKR-Medium.otf
	EOF
	cat <<- EOF > notosanssc.txt
	# NotoSansSC-Regular.otf
	NotoSansSC-Medium.otf
	EOF
	cat <<- EOF > notosanstc.txt
	# NotoSansTC-Regular.otf
	NotoSansTC-Medium.otf
	EOF

	mkdir -p "${unpackdir}"/notocjk
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}" --input-file="${unpackdir}"/notocjk.txt || true && echo ''
	7z e -bso0 -y 'Noto_Sans_HK.zip' -i'@notosanshk.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_JP.zip' -i'@notosansjp.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_KR.zip' -i'@notosanskr.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_SC.zip' -i'@notosanssc.txt' -o"${unpackdir}"/notocjk
	7z e -bso0 -y 'Noto_Sans_TC.zip' -i'@notosanstc.txt' -o"${unpackdir}"/notocjk
}

notolingual () {
	cat <<- EOF > notolingual.txt
	https://fonts.google.com/download?family=Noto%20Naskh%20Arabic
	https://fonts.google.com/download?family=Noto%20Serif%20Bengali
	https://fonts.google.com/download?family=Noto%20Serif%20Devanagari
	EOF
	cat <<- EOF > notonaskharabic.txt
	# static/NotoNaskhArabic-Regular.ttf
	static/NotoNaskhArabic-Medium.ttf
	EOF
	cat <<- EOF > notoserifbengali.txt
	# static/NotoSerifBengali/NotoSerifBengali-Regular.ttf
	static/NotoSerifBengali/NotoSerifBengali-Medium.ttf
	EOF
	cat <<- EOF > notoserifdevanagari.txt
	# static/NotoSerifDevanagari/NotoSerifDevanagari-Regular.ttf
	static/NotoSerifDevanagari/NotoSerifDevanagari-Medium.ttf
	EOF

	mkdir -p "${unpackdir}"/notolingual
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}" --input-file="${unpackdir}"/notolingual.txt || true && echo ''
	7z e -bso0 -y 'Noto_Naskh_Arabic.zip' -i'@notonaskharabic.txt' -o"${unpackdir}"/notolingual
	7z e -bso0 -y 'Noto_Serif_Bengali.zip' -i'@notoserifbengali.txt' -o"${unpackdir}"/notolingual
	7z e -bso0 -y 'Noto_Serif_Devanagari.zip' -i'@notoserifdevanagari.txt' -o"${unpackdir}"/notolingual
}

notomisc () {
	cat <<- EOF > notomisc.txt
	# https://fonts.google.com/download?family=Noto%20Emoji
	https://fonts.google.com/download?family=Noto%20Color%20Emoji
	https://fonts.google.com/download?family=Noto%20Sans%20Math
	https://fonts.google.com/download?family=Noto%20Music
	# https://fonts.google.com/download?family=Noto%20Sans%20Symbols
	# https://fonts.google.com/download?family=Noto%20Sans%20Symbols%202
	EOF
	# cat <<- EOF > notoemoji.txt
	# static/NotoEmoji-Regular.ttf
	# # static/NotoEmoji-Medium.ttf
	# EOF
	cat <<- EOF > notocoloremoji.txt
	NotoColorEmoji-Regular.ttf
	EOF
	cat <<- EOF > notosansmath.txt
	NotoSansMath-Regular.ttf
	EOF
	cat <<- EOF > notomusic.txt
	NotoMusic-Regular.ttf
	EOF
	# cat <<- EOF > notosanssymbols.txt
	# static/NotoSansSymbols-Regular.ttf
	# # static/NotoSansSymbols-Medium.ttf
	# EOF
	# cat <<- EOF > notosanssymbols2.txt
	# NotoSansSymbols2-Regular.ttf
	# EOF

	mkdir -p "${unpackdir}"/notomisc
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}" --input-file="${unpackdir}"/notomisc.txt || true && echo ''
	# 7z e -bso0 -y 'Noto_Emoji.zip' -i'@notoemoji.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Color_Emoji.zip' -i'@notocoloremoji.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Sans_Math.zip' -i'@notosansmath.txt' -o"${unpackdir}"/notomisc
	7z e -bso0 -y 'Noto_Music.zip' -i'@notomusic.txt' -o"${unpackdir}"/notomisc
	# 7z e -bso0 -y 'Noto_Sans_Symbols.zip' -i'@notosanssymbols.txt' -o"${unpackdir}"/notomisc
	# 7z e -bso0 -y 'Noto_Sans_Symbols_2.zip' -i'@notosanssymbols2.txt' -o"${unpackdir}"/notomisc
}

## Sans serif fonts
##
inter () {
	cat <<- EOF > inter.txt
	Desktop/Inter-Medium.otf
	Desktop/Inter-MediumItalic.otf
	# Desktop/Inter-Regular.otf
	# Desktop/Inter-Italic.otf
	# Variable/InterV.var.ttf
	# Variable/InterV-Italic.var.ttf
	EOF

	mkdir -p "${unpackdir}"/inter
	curl -s https://api.github.com/repos/rsms/inter/releases \
		| grep "browser_download_url.*Inter.*.zip" | cut -d : -f 2,3 | head -n 1 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "Inter*.zip" -i'@inter.txt' -o"${unpackdir}"/inter && echo ''
}

jost () {
	cat <<- EOF > jost.txt
	Jost-VariableFont_wght.ttf
	Jost-Italic-VariableFont_wght.ttf
	EOF

	mkdir -p "${unpackdir}"/jost
	printf '%s' 'https://fonts.google.com/download?family=Jost' \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "Jost.zip" -i'@jost.txt' -o"${unpackdir}"/jost && echo ''
}

## Serif fonts
##
lora () {
	cat <<- EOF > lora.txt
	fonts/otf/Lora-Medium.otf
	fonts/otf/Lora-MediumItalic.otf
	# fonts/otf/Lora-Regular.otf
	# fonts/otf/Lora-Italic.otf
	# fonts/variable/Lora[wght].ttf
	# fonts/variable/Lora-Italic[wght].ttf
	EOF

	mkdir -p "${unpackdir}"/lora
	curl -s https://api.github.com/repos/cyrealtype/Lora-Cyrillic/releases/latest \
		| grep "browser_download_url.*Lora.*.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "Lora*.zip" -i'@lora.txt' -o"${unpackdir}"/lora && echo ''
}

bodoni () {
	cat <<- EOF > bodoni.txt
	BodoniModa-VariableFont_opsz,wght.ttf
	BodoniModa-Italic-VariableFont_opsz,wght.ttf
	EOF

	mkdir -p "${unpackdir}"/bodoni
	printf '%s' 'https://fonts.google.com/download?family=Bodoni%20Moda' \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "Bodoni*.zip" -i'@bodoni.txt' -o"${unpackdir}"/bodoni && echo ''
}

baskerville () {
	cat <<- EOF > baskerville.txt
	LibreBaskerville-Regular.ttf
	LibreBaskerville-Italic.ttf
	LibreBaskerville-Bold.ttf
	EOF

	mkdir -p "${unpackdir}"/baskerville
	printf '%s' 'https://fonts.google.com/download?family=Libre%20Baskerville' \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "*Baskerville.zip" -i'@baskerville.txt' -o"${unpackdir}"/baskerville && echo ''
}

caslon () {
	cat <<- EOF > caslon.txt
	LibreCaslonText-Regular.ttf
	LibreCaslonText-Italic.ttf
	LibreCaslonText-Bold.ttf
	EOF

	mkdir -p "${unpackdir}"/caslon
	printf '%s' 'https://fonts.google.com/download?family=Libre%20Caslon%20Text' \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "*Caslon*.zip" -i'@caslon.txt' -o"${unpackdir}"/caslon && echo ''
}

century_schoolbook () {
	cat <<- EOF > censcbk.txt
	https://github.com/TimothyGu/Century-Schoolbook-L/raw/gh-pages/fonts/CenturySchL-Bold.otf
	https://github.com/TimothyGu/Century-Schoolbook-L/raw/gh-pages/fonts/CenturySchL-BoldItal.otf
	https://github.com/TimothyGu/Century-Schoolbook-L/raw/gh-pages/fonts/CenturySchL-Ital.otf
	https://github.com/TimothyGu/Century-Schoolbook-L/raw/gh-pages/fonts/CenturySchL-Roma.otf
	EOF

	mkdir -p "${unpackdir}"/censcbk
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}"/censcbk --input-file="${unpackdir}"/censcbk.txt || true && echo ''
}

## Monospace fonts
##
iosevka () {
	cat <<- EOF > iosevka.txt
	# iosevka-regular.ttf
	# iosevka-italic.ttf
	iosevka-medium.ttf
	iosevka-mediumitalic.ttf
	EOF

	mkdir -p "${unpackdir}"/iosevka
	curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest \
		| grep "browser_download_url.*ttf-iosevka-[0-9].*.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y '*iosevka*.zip' -i'@iosevka.txt' -o"${unpackdir}"/iosevka && echo ''
}

jetbrainsmono () {
	cat <<- EOF > jetbrainsmono.txt
	# fonts/ttf/JetBrainsMono-Regular.ttf
	# fonts/ttf/JetBrainsMonoNL-Italic.ttf
	fonts/ttf/JetBrainsMono-Medium.ttf
	fonts/ttf/JetBrainsMono-MediumItalic.ttf
	EOF

	mkdir -p "${unpackdir}"/jetbrainsmono
	curl -s https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest \
		| grep "browser_download_url.*JetBrainsMono-[0-9].*.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y 'JetBrainsMono*.zip' -i'@jetbrainsmono.txt' -o"${unpackdir}"/jetbrainsmono && echo ''
}

cartograph() {
	cat <<- EOF > cartograph.txt
	# CartographCF-Regular.ttf
	# CartographCF-RegularItalic.ttf
	CartographCF-DemiBold.ttf
	CartographCF-DemiBoldItalic.ttf
	EOF

	mkdir -p "${unpackdir}"/cartograph
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 \
		'https://en.bestfonts.pro/fonts_files/600c045b6a101229c67525c5/font.zip' || true
	7z e -bso0 -y 'font.zip' -i'@cartograph.txt' -o"${unpackdir}"/cartograph && echo ''
}

## Miscellaneous fonts
##
nerdsyms () {
	cat <<- EOF > nerdsyms.txt
	Symbols-1000-em Nerd Font Complete.ttf
	# Symbols-2048-em Nerd Font Complete.ttf
	EOF

	mkdir -p "${unpackdir}"/nerdsyms
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
		| grep "browser_download_url.*NerdFontsSymbolsOnly.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y 'NerdFontsSymbolsOnly.zip' -i'@nerdsyms.txt' -o"${unpackdir}"/nerdsyms && echo ''
}

applefonts () {
	cat <<- EOF > applefonts.txt
	# AppleFonts/NewYorkSmall-Medium.otf
	# AppleFonts/NewYorkSmall-MediumItalic.otf
	# AppleFonts/NewYorkSmall-Regular.otf
	# AppleFonts/NewYorkSmall-RegularItalic.otf
	# AppleFonts/SF-Mono-Regular.otf
	# AppleFonts/SF-Mono-RegularItalic.otf
	AppleFonts/SF-Mono-Medium.otf
	AppleFonts/SF-Mono-MediumItalic.otf
	# AppleFonts/SF-Pro-Text-Regular.otf
	# AppleFonts/SF-Pro-Text-RegularItalic.otf
	AppleFonts/SF-Pro-Text-Medium.otf
	AppleFonts/SF-Pro-Text-MediumItalic.otf
	EOF

	mkdir -p "${unpackdir}"/applefonts
	curl -s https://api.github.com/repos/x0rzavi/apple-fonts-nerd-patched/releases \
		| grep "browser_download_url.*AppleFonts.7z" | cut -d : -f 2,3 | head -n 1 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y 'AppleFonts*.7z' -i'@applefonts.txt' -o"${unpackdir}"/applefonts && echo ''
}

lucide () {
	cat <<- EOF > lucide.txt
	# lucide-font/lucide.ttf
	EOF

	mkdir -p "${unpackdir}"/lucide
	curl -s https://api.github.com/repos/lucide-icons/lucide/releases/latest \
		| grep "browser_download_url.*lucide-font.*.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "lucide-font*.zip" -i'@lucide.txt' -o"${unpackdir}"/lucide && echo ''
}

recursive () {
	cat <<- EOF > recursive.txt
	*/Recursive_Desktop/Recursive_VF_*.ttf
	*/Recursive_Code/RecMonoCasual/RecMonoCasual-Italic-*.ttf
	*/Recursive_Code/RecMonoCasual/RecMonoCasual-Bold-*.ttf
	*/Recursive_Code/RecMonoCasual/RecMonoCasual-Regular-*.ttf
	*/Recursive_Code/RecMonoCasual/RecMonoCasual-BoldItalic-*.ttf
	EOF

	mkdir -p "${unpackdir}"/recursive
	curl -s https://api.github.com/repos/arrowtype/recursive/releases/latest \
		| grep "browser_download_url.*ArrowType-Recursive.*.zip" | cut -d : -f 2,3 \
		| xargs aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 || true
	7z e -bso0 -y "ArrowType-Recursive*.zip" -i'@recursive.txt' -o"${unpackdir}"/recursive && echo ''
}

material_symbols () {
	cat <<- EOF > matsym.txt
	# https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsOutlined%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf
	https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsRounded%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf
	EOF

	mkdir -p "${unpackdir}"/matsym
	aria2c --console-log-level=error --summary-interval=0 --auto-file-renaming=false --max-tries=0 --dir="${unpackdir}"/matsym --input-file="${unpackdir}"/matsym.txt || true && echo ''
}

install_fonts () {
	#noto
	#notocjk
	#notolingual
	#notomisc

	inter
	#jost

	lora
	#bodoni
	#baskerville
	#caslon
	#century_schoolbook

	#iosevka
	#jetbrainsmono
	#cartograph

	#nerdsyms
	#applefonts
	#lucide
	#recursive
	#material_symbols

	cleanup
	if [ "$(id -u)" -eq 0 ]
	then 
		mkdir -p /usr/local/share/fonts/ && set +e && sudo mv "${unpackdir}"/* /usr/local/share/fonts/ && set -e
		fc-cache --force --really-force --verbose
	else 
		mkdir -p ~/.local/share/fonts/ && set +e && mv "${unpackdir}"/* ~/.local/share/fonts && set -e
		fc-cache --force --really-force --verbose
	fi
	rm -rf "${unpackdir}"
}

install_fonts