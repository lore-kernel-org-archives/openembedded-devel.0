Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NeUZS-0002Nh-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 15:26:43 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E0B20491264
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2010 15:24:08 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Feb 2010 15:25:01 +0100
Message-ID: <4B701EA0.5090304@dresearch.de>
Date: Mon, 08 Feb 2010 15:24:32 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 08 Feb 2010 14:25:01.0210 (UTC)
	FILETIME=[7FA8A7A0:01CAA8CA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: configure failes for mc-4.6.2-r4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2010 14:26:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Is anybody familar with autotools able to fix this?

ERROR: function do_configure failed
ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/temp/log.do_configure.3914)
| automake (GNU automake) 1.10.2
| Copyright (C) 2008 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: running: aclocal -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: adding subdirectory vfs/samba to autoreconf
| autoreconf: Entering directory `vfs/samba'
| autoreconf: configure.ac: not using Gettext
| autoreconf: configure.ac: not using aclocal
| autoreconf: configure.ac: not using Libtool
| autoreconf: running: /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoconf --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
| autoreconf: running: /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoheader --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
| autoreconf: configure.ac: not using Automake
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `vfs/samba'
| autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
| automake: unknown warning category `cross'
| configure.ac:104: required file `config/config.rpath' not found
| configure.ac:10: installing `config/install-sh'
| configure.ac:10: installing `config/missing'
| configure.ac:104: installing `config/mkinstalldirs'
| edit/Makefile.am: installing `config/depcomp'
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.



