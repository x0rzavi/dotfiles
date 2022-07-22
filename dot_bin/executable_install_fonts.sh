#!/usr/bin/env bash

# Safer script
trap "exit" INT
set -euo pipefail

# Author: https://github.com/x0rzavi
# Description: Install my favourite fonts
# Dependencies: aria2, 7z

# Temp directory to unpack into
directory=$(pwd)
mkdir -p ${directory}/fonts_tmpdir
unpackdir=${directory}/fonts_tmpdir
cd ${unpackdir}

noto () {
	cat << EOF > noto.txt
#### Noto Sans (NEEDS UPDATE!)
https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Regular.ttf
https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Italic.ttf
# https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-Medium.ttf
# https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSans/NotoSans-MediumItalic.ttf
#### Noto Sans Mono
# https://notofonts.github.io/fonts/NotoSansMono/hinted/ttf/NotoSansMono-Regular.ttf
https://notofonts.github.io/fonts/NotoSansMono/hinted/ttf/NotoSansMono-Medium.ttf
#### Noto Serif
https://notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-Regular.ttf
https://notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-Italic.ttf
# https://notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-Medium.ttf
# https://notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-MediumItalic.ttf
EOF

	mkdir -p ${unpackdir}/noto
	aria2c -c -x16 -j16 --console-log-level=warn --dir=${unpackdir}/noto --input-file=${unpackdir}/noto.txt && echo ""
}

notomisc () {
	cat << EOF > notomisc.txt
#### Noto Emoji
https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
#### Noto Sans Symbols (NEEDS UPDATE!)
https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSansSymbols/NotoSansSymbols-Regular.ttf
# https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSansSymbols/NotoSansSymbols-Medium.ttf
#### Noto Sans Symbols 2 (NEEDS UPDATE!)
https://github.com/notofonts/noto-fonts/raw/main/hinted/ttf/NotoSansSymbols2/NotoSansSymbols2-Regular.ttf
EOF

	mkdir -p ${unpackdir}/notomisc
	aria2c -c -x16 -j16 --console-log-level=warn --dir=${unpackdir}/notomisc --input-file=${unpackdir}/notomisc.txt && echo ""
}

notolingual () {
	cat << EOF > notolingual.txt
#### Noto Sans Arabic
https://notofonts.github.io/fonts/NotoSansArabic/hinted/ttf/NotoSansArabic-Regular.ttf
# https://notofonts.github.io/fonts/NotoSansArabic/hinted/ttf/NotoSansArabic-Medium.ttf
#### Noto Sans Bengali
https://notofonts.github.io/fonts/NotoSansBengali/hinted/ttf/NotoSansBengali-Regular.ttf
# https://notofonts.github.io/fonts/NotoSansBengali/hinted/ttf/NotoSansBengali-Medium.ttf
#### Noto Sans Devanagari
https://notofonts.github.io/fonts/NotoSansDevanagari/hinted/ttf/NotoSansDevanagari-Regular.ttf
# https://notofonts.github.io/fonts/NotoSansDevanagari/hinted/ttf/NotoSansDevanagari-Medium.ttf
EOF

	mkdir -p ${unpackdir}/notolingual
	aria2c -c -x16 -j16 --console-log-level=warn --dir=${unpackdir}/notolingual --input-file=${unpackdir}/notolingual.txt && echo ""
}

notocjk () {
	cat << EOF > notocjk.txt
#### Noto CJK Sans
https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Medium.otf
https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Korean/NotoSansCJKkr-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Korean/NotoSansCJKkr-Medium.otf
https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Medium.otf
https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChinese/NotoSansCJKtc-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChinese/NotoSansCJKtc-Medium.otf
https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChineseHK/NotoSansCJKhk-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChineseHK/NotoSansCJKhk-Medium.otf
#### Noto CJK Serif
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/Japanese/NotoSerifCJKjp-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/Japanese/NotoSerifCJKjp-Medium.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/Korean/NotoSerifCJKkr-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/Korean/NotoSerifCJKkr-Medium.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Medium.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/TraditionalChinese/NotoSerifCJKtc-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/TraditionalChinese/NotoSerifCJKtc-Medium.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/TraditionalChineseHK/NotoSerifCJKhk-Regular.otf
# https://github.com/googlefonts/noto-cjk/raw/main/Serif/OTF/TraditionalChineseHK/NotoSerifCJKhk-Medium.otf
EOF

	mkdir -p ${unpackdir}/notocjk
	aria2c -c -x16 -j16 --console-log-level=warn --dir=${unpackdir}/notocjk --input-file=${unpackdir}/notocjk.txt && echo ""
}

apple_fonts () {
	cat << EOF > applefonts.txt
#### New York
AppleFontsNerdPatched/NewYorkSmall-Regular.otf
AppleFontsNerdPatched/NewYorkSmall-RegularItalic.otf
#### San Francisco Mono
AppleFontsNerdPatched/SFMono Medium Nerd Font Complete.otf
AppleFontsNerdPatched/SFMono Medium Italic Nerd Font Complete.otf
#### San Francisco Pro Text
AppleFontsNerdPatched/SF-Pro-Text-Medium.otf
AppleFontsNerdPatched/SF-Pro-Text-MediumItalic.otf
EOF

	mkdir -p ${unpackdir}/applefonts
	curl -s https://api.github.com/repos/x0rzavi/apple-fonts-nerd-patched/releases/latest \
	| grep "browser_download_url.*.7z" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y "AppleFontsNerdPatched.7z" -i'@applefonts.txt' -o${unpackdir}/applefonts && echo ""
	rm ${unpackdir}/AppleFontsNerdPatched.7z
}

iosevka () {
	cat << EOF > iosevka.txt
#### Iosevka Term
Iosevka Term Medium Nerd Font Complete.ttf
Iosevka Term Medium Italic Nerd Font Complete.ttf
EOF

	mkdir -p ${unpackdir}/iosevka
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
	| grep "browser_download_url.*Iosevka.zip" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y "Iosevka.zip" -i'@iosevka.txt' -o${unpackdir}/iosevka && echo ""
	rm ${unpackdir}/Iosevka.zip
}

jetbrainsmono () {
	cat << EOF > jetbrainsmono.txt
#### JetBrains Mono
JetBrains Mono Medium Nerd Font Complete.ttf
JetBrains Mono Medium Italic Nerd Font Complete.ttf
EOF

	mkdir -p ${unpackdir}/jetbrainsmono
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
	| grep "browser_download_url.*JetBrainsMono.zip" | cut -d : -f 2,3 \
	| xargs aria2c -c -x16 -j16 --console-log-level=warn
	7z e -bso0 -y "JetBrainsMono.zip" -i'@jetbrainsmono.txt' -o${unpackdir}/jetbrainsmono && echo ""
	rm ${unpackdir}/JetBrainsMono.zip
}

install_fonts () {
	noto
	notocjk
	notomisc
	notolingual
	apple_fonts
	jetbrainsmono
	iosevka
	set +e && rm ${unpackdir}/*.txt && set -e
	echo -e "Please input your root password to proceed for moving files:\n"
	sudo mkdir -p /usr/local/share/fonts/ && set +e && sudo mv ${unpackdir}/* /usr/local/share/fonts/ && set -e
	echo "" && fc-cache --really-force --verbose
	rm -rf ${unpackdir}
}

install_fonts
