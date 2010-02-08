Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NeacD-0005lZ-Im
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 21:53:56 +0100
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Feb 2010 21:51:19 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Feb 2010 21:50:50 +0100
Received: from [192.168.1.116] ([79.54.158.78]) by FBCMCL01B05.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Feb 2010 21:50:48 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B701EA0.5090304@dresearch.de>
References: <4B701EA0.5090304@dresearch.de>
Date: Mon, 08 Feb 2010 21:50:42 +0100
Message-Id: <1265662242.3736.26.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 08 Feb 2010 20:50:48.0744 (UTC)
	FILETIME=[64AA0A80:01CAA900]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Mon, 08 Feb 2010 20:53:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-08 at 15:24 +0100, Steffen Sledz wrote:
> Is anybody familar with autotools able to fix this?
> 
> ERROR: function do_configure failed
> ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/temp/log.do_configure.3914)
> | automake (GNU automake) 1.10.2
> | Copyright (C) 2008 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.10
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
> | autoreconf: Entering directory `.'
> | autoreconf: running: aclocal -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force -I m4
> | autoreconf: configure.ac: tracing
> | autoreconf: configure.ac: adding subdirectory vfs/samba to autoreconf
> | autoreconf: Entering directory `vfs/samba'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: configure.ac: not using aclocal
> | autoreconf: configure.ac: not using Libtool
> | autoreconf: running: /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoconf --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
> | autoreconf: running: /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoheader --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/mc-4.6.2/m4/ --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
> | autoreconf: configure.ac: not using Automake
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `vfs/samba'
> | autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
> | automake: unknown warning category `cross'
> | configure.ac:104: required file `config/config.rpath' not found
> | configure.ac:10: installing `config/install-sh'
> | configure.ac:10: installing `config/missing'
> | configure.ac:104: installing `config/mkinstalldirs'
> | edit/Makefile.am: installing `config/depcomp'
> | autoreconf: automake failed with exit status: 1
> | FATAL: autoreconf execution failed.
I think you have to look in configure.ac at line 104
It will give you the part that is making this problem.
I had a similar problem with an enlightenment thing(not yet commited...I
just came back from fosdem)
I had to gettextize before configuring to make it work.

Denis




