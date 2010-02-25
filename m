Received: from smtp105.biz.mail.in2.yahoo.com ([203.104.19.14])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <tejas@picus.in>) id 1NkZIy-0000Uf-7Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:42:51 +0100
Received: (qmail 41143 invoked from network); 25 Feb 2010 08:39:56 -0000
Received: from 106.74.116.28.hathway.com (tejas@116.74.106.28 with login)
	by smtp105.biz.mail.in2.yahoo.com with SMTP;
	25 Feb 2010 14:09:55 +0530 IST
X-Yahoo-SMTP: vL6ZkSyswBA8eZdwmFTvr8l2__OJ14.9dJSX
X-YMail-OSG: dkZrGoAVM1nFWRovJ9scF7SDk6FqXbR0Byf_dQsFK2OFwtCvw47klszAroNNSeiDLhFw5A8wVFYxhjeo0q8beEktoOBDtMC.ex4LORBbRHVbDGs.FQUa658iKbY3WlkAYq.JMiBqXsDUQwQKwtPo3OubP7NGuff_23ZpsvZCvK3KCDkXU9ROoeX3l4gfHsEzBMVF.nHCMlsN1u6k7YMgKnb36OUCsQdqAIL6bTts.OZGMTTXLp1CEull
X-Yahoo-Newman-Property: ymail-3
From: "Tejas" <tejas@picus.in>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Feb 2010 14:12:19 +0530
Message-ID: <000001cab5f6$70c966f0$525c34d0$@in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acq19m94LdiHygNJQJ+yIaEg2gu4UQ==
x-cr-hashedpuzzle: dmg= ACoG A5zE BM9D BwQT CCOY Dlxl ECo0 E6x1 FZbB FfUk G4tz
	JC8d JTB4 J1dN J97N; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {7DCAEAFE-E590-4D46-8A86-3CA28D28DE59};
	dABlAGoAYQBzAEAAcABpAGMAdQBzAC4AaQBuAA==;
	Thu, 25 Feb 2010 08:42:17 GMT;
	RgBhAGMAaQBuAGcAIABwAHIAbwBiAGwAZQBtACAAdABvACAAYgB1AGkAbABkACAAdABvAHQAZQBtAA==
x-cr-puzzleid: {7DCAEAFE-E590-4D46-8A86-3CA28D28DE59}
X-SA-Exim-Connect-IP: 203.104.19.14
X-SA-Exim-Mail-From: tejas@picus.in
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=HTML_MESSAGE, UNPARSEABLE_RELAY,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Facing problem to build totem
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
X-List-Received-Date: Thu, 25 Feb 2010 08:42:51 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All,

               I am facing problem to build totem movie player for beagle
board. When I run bitbake totem , it downloads all necessary packages and
complete all tasks except configuring of totem. The log is as followed.

 

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to
increase performance.

NOTE: Handling BitBake files: \ (6701/6701) [100 %]

NOTE: Parsing finished. 6414 cached, 0 parsed, 287 skipped, 0 masked.

NOTE: Cache is clean, not saving.

NOTE: Resolving any missing task queue dependencies

NOTE: Preparing runqueue

NOTE: Executing runqueue

NOTE: Running task 1614 of 2327 (ID: 5,
/home/neelam/tejas_work/oe/openembedded/recipes/totem/totem_2.24.2.bb,
do_configure)

ERROR: function do_configure failed

ERROR: see log in
/home/neelam/tejas_work/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/t
otem-2.24.2-r0/temp/log.do_configure.15367

NOTE: Task failed:
/home/neelam/tejas_work/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/t
otem-2.24.2-r0/temp/log.do_configure.15367

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/neelam/tejas_work/oe/openembedded/recipes/totem/totem_2.24.2.bb
do_configure failed

ERROR: Task 5
(/home/neelam/tejas_work/oe/openembedded/recipes/totem/totem_2.24.2.bb,
do_configure) failed

NOTE: Tasks Summary: Attempted 2315 tasks of which 2315 didn't need to be
rerun and 1 failed.

ERROR:
'/home/neelam/tejas_work/oe/openembedded/recipes/totem/totem_2.24.2.bb'
failed

 

               The log file of log.do_configure.15367 is as followed.

 

/home/neelam/tejas_work/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/t
otem-2.24.2-r0/temp/log.do_configure.15367

 

automake (GNU automake) 1.10.2

Copyright (C) 2008 Free Software Foundation, Inc.

License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl.html>

This is free software: you are free to change and redistribute it.

There is NO WARRANTY, to the extent permitted by law.

 

Written by Tom Tromey <tromey@redhat.com>

       and Alexandre Duret-Lutz <adl@gnu.org>.

AUTOV is 1.10

NOTE: Executing glib-gettextize --force --copy

Copying file mkinstalldirs

Copying file po/Makefile.in.in

 

Please add the files

  codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4

  progtest.m4

from the
/home/neelam/tejas_work/oe/angstrom-dev/staging/i686-linux/usr/share/aclocal
directory to your autoconf macro directory

or directly to your aclocal.m4 file.

You will also need config.guess and config.sub, which you can get from

ftp://ftp.gnu.org/pub/gnu/config/.

 

NOTE: Executing intltoolize --copy --force --automake

NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint
-I/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnue
abi/usr/share/aclocal-1.10 -I /hom
e/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/us
r/share/aclocal

Use of uninitialized value in formline at
/home/neelam/tejas_work/oe/angstrom-dev/staging/i686-linux/usr/bin/automake
line 7641.

Use of uninitialized value in formline at
/home/neelam/tejas_work/oe/angstrom-dev/staging/i686-linux/usr/bin/automake
line 7641.

autoreconf: Entering directory `.'

autoreconf: configure.in: not using Gettext

autoreconf: running: aclocal -I
/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal-1.10 -I
/home/neelam/tejas_work/oe/angstrom-dev/staging/a
rmv7a-angstrom-linux-gnueabi/usr/share/aclocal --force

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923: warning: underquoted definition of
AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_T    CI

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923:   or see
http://sources.redhat.com/automake/automake.html#Extending-acloc    al

autoreconf: configure.in: tracing

autoreconf: running: libtoolize --copy --force

libtoolize: putting auxiliary files in `.'.

libtoolize: copying file `./ltmain.sh'

libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and

libtoolize: rerunning libtoolize, to keep the correct libtool macros
in-tree.

libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923: warning: underquoted definition of
AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'

/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueab
i/usr/share/aclocal/libpcap.m4:923:   or see
http://sources.redhat.com/automake/automake.html#Extending-acloc    al

autoreconf: running:
/home/neelam/tejas_work/oe/angstrom-dev/staging/i686-linux/usr/bin/autoconf
--include=/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-li
nux-gnueabi/    usr/share/aclocal-1.10
--include=/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-li
nux-gnueabi/usr/share/aclocal --force --warnings=cross

autoreconf: running:
/home/neelam/tejas_work/oe/angstrom-dev/staging/i686-linux/usr/bin/autoheade
r
--include=/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-li
nux-gnueab    i/usr/share/aclocal-1.10
--include=/home/neelam/tejas_work/oe/angstrom-dev/staging/armv7a-angstrom-li
nux-gnueabi/usr/share/aclocal --force --warnings=cross

autoreconf: running: automake --foreign --add-missing --copy --force-missing
--warnings=cross

automake: unknown warning category `cross'

configure.in:27: installing `./config.guess'

configure.in:27: installing `./config.sub'

gnome-doc-utils.make:63: HAVE_GNOME_DOC_UTILS does not appear in
AM_CONDITIONAL

help/Makefile.am:1:   `gnome-doc-utils.make' included from here

gnome-doc-utils.make:133: ENABLE_SK does not appear in AM_CONDITIONAL

help/Makefile.am:1:   `gnome-doc-utils.make' included from here

gnome-doc-utils.make:182: ENABLE_SK does not appear in AM_CONDITIONAL

help/Makefile.am:1:   `gnome-doc-utils.make' included from here

autoreconf: automake failed with exit status: 1

FATAL: autoreconf execution failed.

 

 

               Before building totem, I have already built base-image for
beagle board and it was successful. If anywhere I am wrong, please guide me
and correct me.

 

-Tejas.


