Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HuQOC-0000Y1-8y
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2007 11:59:16 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l529vGox007407 for <openembedded-devel@openembedded.org>;
	Sat, 2 Jun 2007 11:57:17 +0200
Message-ID: <46613EFA.7010005@dominion.kabel.utwente.nl>
Date: Sat, 02 Jun 2007 11:57:14 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <465FEB10.5080101@dominion.kabel.utwente.nl>
In-Reply-To: <465FEB10.5080101@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: OpenEmbedded ChangeLog for 200705
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2007 09:59:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> Here's the changelog for may 2007, made with contrib/mtn2cl.sh (blame thunderbird for the
> line wrapping):

And the bugfix list:

bug_id	resolution	short_desc
228	FIXED	asterisk is still 1.0.7 which has security issues, should be 1.0.9
349	DUPLICATE	new bb submission for bitlbee
355	FIXED	Minimo build package incorrect
375	FIXED	mpeg2dec and libmpeg2 provide the exact same package
377	WONTFIX	Update aircrack to 2.3 and applying hostap driver patch
413	FIXED	sdl-perl installs to incorrect location
692	FIXED	minimo-0.0cvs20060102-r8 does not build
716	FIXED	Include bb files for wxbase package
972	WONTFIX	hostap .pc/ipaq_compat.patch is wrong!
979	WONTFIX	at76c503a-modules-0.0+cvs fails compiling...
1066	FIXED	Cross Compile Badness in compiling sdl-perl
1076	FIXED	kdepimpi fails to build
1144	DUPLICATE	binary locale generation using qemu fails on amd64 host
1155	FIXED	dosfstools-native fails to build on 64bit AMD gcc 3.4.4, glibc 2.4
1188	WORKSFORME	opie-image build breaks during opie-bluepin-1.2.2-r0: task do_compile
1257	FIXED	local linux headers interfere with apmd build
1296	WONTFIX	Touchscreen not working on Collie under 2.6 kernel.
1353	FIXED	gpe-session-scripts shouldn't depend on gpe-bluetooth
1391	FIXED	minimo package bit rotted badly
1452	FIXED	"fakeroot has runtime dependency on getopt; where is getopt?"
1510	FIXED	New bb: qtopia/qtopia-core_4.2.0.bb
1521	FIXED	package opie-console-1.2.2-r0: task do_compile: failed
1596	FIXED	Vincent - OpenGL-ES library for ARM
1653	WORKSFORME	tin-1.9.1-r0 fails task do_install
1682	FIXED	gnutls suffers from cross-build contamination
1700	FIXED	perl fails compilation for Sharp ROM
1750	FIXED	bitbake build for package iana-etc (solves a minor ntpdate problem)
1770	DUPLICATE	GTK apps need Native gdk-pixbuf-csource
1772	FIXED	libsdl-native compile dies on SDL_cpuinfo.c
1774	FIXED	CFLAGS += -lz breaks build of libglade for x86_64
1821	FIXED	Binary locale generation uses the files in /usr/share/i18n/locales/
1827	FIXED	remove 'inherit native' from mkfontscale
1836	FIXED	"zaurus-clamshell.conf typos: sumtool uses --eraseblocks but not mkfs.jffs2 + a
missing ;"
1852	DUPLICATE	Bison contains path to buildsystem
1879	FIXED	libxml-parser-perl build failing
1918	FIXED	Add soft-float support for powerpc targets without fpu
1923	FIXED	Reorder the dependencies of gtkmm and glibmm libraries
1925	INVALID	Remove cairo/libsvg, cairo/libsvg-cairo and cairo/xsvg
1929	FIXED	lirc fails to build
1951	FIXED	gcc fails to build on x86_64
1978	FIXED	opie-dagger wont build
1998	DUPLICATE	lirc-modules fails to build
2006	DUPLICATE	fortune-mod-1.99 fails on powerpc (builds without problem for x86)
2013	WORKSFORME	bitbake gpe-image fails on gtk-engines looking for gtk 2.8 (2.6 present)
2035	FIXED	perl-native is broken on feisty
2047	FIXED	New recipe (update): sshfs-fuse_1.7.bb
2051	FIXED	Billiardz wont build cuz of missing gcc4 patch
2054	DUPLICATE	glibc-2.5-r5 accesses /usr
2069	WORKSFORME	ettercap fails to build.
2076	FIXED	git read-tree LABEL_2006_06_30_2020 failed
2099	FIXED	m4-native doesn't like Os
2100	FIXED	xqt2 minor bug
2127	FIXED	angstrom-console-image build now depends on GTK
2131	FIXED	uClibc 0.9.29 support
2133	FIXED	bitbake 1.8 r816 breaks SRCDATE
2139	FIXED	Touchscreen Calibration off
2146	FIXED	bad RPATH in mencoder/mplayer (QA build failure)
2147	FIXED	Insane RPATH in gnutls 1.6.2
2155	FIXED	Added pango 1.16.4. Needs testing before making default.
2160	FIXED	RPATH issue in sword
2162	FIXED	latest altboot packages have packaging issues
2165	DUPLICATE	opie-dagger fails do_compile
2168	FIXED	perl-native-5.8.7-r4 doesn't compile
2169	DUPLICATE	Bad RPATHs in gnutls-xx 1.6.2-r0
2176	FIXED	gpe-autostarter 0.12 fails compilation with wireless headers related errors
2177	FIXED	prismstumbler build fails for two reasons.
2178	FIXED	kismet fails compilation when it finds host's Magick-config
2184	DUPLICATE	gqview-2.1.1 fails to build error in pixbuf_util.c
2187	FIXED	libusbpp contains bad RPATH
2192	FIXED	bad RPATH in libmodplug
2193	FIXED	"libopie2 fails do_compile for MACHINE=""qemuarm"" and angstrom"
2196	FIXED	sword (opie) build fails for angstrom fails because of symbols invisibility
2197	FIXED	angstrom opie-networksettings build fails due to wireless headers problem
2201	FIXED	qte build for angstrom fails because of kernel includes
2202	FIXED	do_package of glibc fails because of lack of qemu-arm
2208	FIXED	RPATH in madplay
2210	FIXED	QA issues in lftp (RPATH, etc)
2216	FIXED	evas-x11 build for angstrom-e-image fails due to kernel headers changes
2224	INVALID	the latest opie-todo build fails, because the patch isn't applicable.
2227	FIXED	insane rpath check has troubles with funny filenames.
2233	FIXED	prismstumbler compiling failed on gpe-image for hx4700
2247	FIXED	SIMpad Kernel 2.6.21
2255	FIXED	Bad python-fuse_cvs debug packaging
2256	FIXED	update gmailfs-fuse to 0.7.3
2274	FIXED	Check success of running terminal-opening commands
2281	WONTFIX	rosetta not configuring, libfreetype complains
2294	FIXED	libsdl-qpe fails do_compile
2307	INVALID	qpf-font-common does not build any packages
2333	INVALID	package perl-native-5.8.8-r7: task do_compile: failed
2340	INVALID	testbug please ignore
2342	FIXED	evince needs scrollkeeper-native
2343	FIXED	bb file for nano 2.0.6 (latest stable version)
2344	FIXED	hdparm does not build using uclibc
2349	FIXED	Speed up ipkg-make-index few times, try 2.
2352	WONTFIX	Unable to create gstreamer .xml plugin register due to conflicts with
audioresample
2353	FIXED	xserver-xorg 1.2.0 package broken
2354	FIXED	xf86-input-keyboard 1.2.0 needs xserver 1.3.0.0 but it's not in OE
2355	FIXED	dropbear is defined twice, ignoring  ${DISTRO_SSH_DAEMON}
2360	FIXED	more granularity for xserver-xorg package
2372	WONTFIX	totem package fail when gpe-image building for hx4700
2375	FIXED	can't build lirc
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGYT76MkyGM64RGpERAv4aAKCVy4z86KHzbrDAKHT3CF0E8gjCUQCdGN8/
x1A0d9rG5nrya5y9tCHqbFo=
=K61S
-----END PGP SIGNATURE-----


