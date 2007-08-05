Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHc9Y-0005Ro-1V
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 11:12:00 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7599e1R003242 for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Aug 2007 11:09:40 +0200
Message-ID: <46B593CB.6050904@dominion.kabel.utwente.nl>
Date: Sun, 05 Aug 2007 11:09:31 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1168868059.20070805104013@vanille-media.de>
	<46B590A8.9040601@dominion.kabel.utwente.nl>
In-Reply-To: <46B590A8.9040601@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Bug Squashing Weekends?
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
X-List-Received-Date: Sun, 05 Aug 2007 09:12:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Michael 'Mickey' Lauer schreef:
>> What happened to these? Should we try to reinstate them? Especially given that
>> the changelogs show a dissatisfactory FIXED:NEW ratio nowadays.
> 
> According to http://www.openembedded.org/ical/oe-events.ics we're having one right now :)
> And we closed like 10 bugs yesterday :D

The stats for the past 7 days:

Bugs fixed:
bug_id resolution        short_desc
2717 FIXED       Error for tag missing while parsing XXXX_git.bb files.
1001 WONTFIX     bluez/bluez-utils-dbus_2.25.bb bcm203x problem
1195 WORKSFORME  faad2-2.0-r1 is not gcc4 safe
1955 FIXED       quilt does not get built properly with bb1.8 multithreading
2241 INVALID     gpe-calendar fails to open: Angstrom on Tosa
2384 FIXED       wrong uClibc.machine for simpad
2512 FIXED       base-files has simpad-specific files
2633 FIXED       autoconf-2.61 in OE doesn't handle OE site properly
2682 FIXED       Fixed poodle_pm-r3.patch to compile for linux-rp-2.6.21
2692 FIXED       lighttpd bb file is configured --without-pcre but pcre is required to
read the conf
2693 FIXED       Opie i18n packages need updating to 1.2.3
2700 WONTFIX     ipkg-utils missing in Angstrom feeds
2701 FIXED       [PATCH] updated libxslt to 1.1.21
2702 FIXED       [PATCH] updated libxml2 to 2.6.29
2703 INVALID     unable to compile kdrive 1.3.0.0
2704 FIXED       native-quilt reads .quiltrc
2705 FIXED       Updating cups .bb files
2707 FIXED       compulab 2.6.20 kernel needs eabi
2715 FIXED       [PATCH] Fix xf86-video-nsc driver on xserver-xorg 1.2.0 and later
2684 FIXED       wifi-radar 1.9.6-r0 have wrong dependencies


Bugs opened:
bug_id resolution        short_desc
2697     Bitbake doesn't seem to retry access after lock
2699     Bitbake final task error summary is misleading
2698     Kernels with usbhost enabled lack drivers for usb devices
2706     compulab with 2.6.20 cannot build jffs2 image
2708     Package gtk+-2.10.14-r1 fails to compile
2709     opie-usermanager 1.2.3 doesn't fetch
2710     mplayer dont work with -vo pxa in Spitz
2711     add fb.modes to enable qvga resolution in the console
2712     does fakeroot  work?
2713     get rid references to temporary directories on installed system
2714     [PATCH] lock mtd-utils to a specific git version so builds will not break
unexpectedly
2716     package puzz-le-2.0.0: failed
2718     cm-x270 kernel 2.6.20 support for rtc

In total 13 bugs have been created and 20 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtZPLMkyGM64RGpERAoXSAJ0XPXCsTYYcoeyERHeAPrGpY6bMCgCff0nF
6jyy6p1PFUtLhh4gLUeo1W4=
=04nQ
-----END PGP SIGNATURE-----


