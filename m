Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1HqDOb-0008SJ-Ed
	for openembedded-devel@openembedded.org; Mon, 21 May 2007 21:18:17 +0200
Received: from [10.26.3.53] (87.54.0.50) by pne-smtpout1-sn2.hy.skanova.net
	(7.2.075) (authenticated as 0706224457)
	id 46386850004C0743 for openembedded-devel@openembedded.org;
	Mon, 21 May 2007 21:17:29 +0200
Message-ID: <4651EFEE.50907@atmel.com>
Date: Mon, 21 May 2007 21:15:58 +0200
From: Ulf Samuelsson <ulf@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 1.5.0.10 (X11/20060911)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.2.0
Subject: ERROR: Task 2246 ( ... org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
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
X-List-Received-Date: Mon, 21 May 2007 19:18:17 -0000
X-Groupsio-MsgNum: 2117
Content-Type: multipart/mixed; boundary="------------060805070003040800040305"

--------------060805070003040800040305
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Looks like there is an issue with the fdl.xml in this package?
Any workarounds?



NOTE: Running task 2742 of 3946 (ID: 2246, /home/ulf/projects/OpenEmbedded/org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile)
NOTE: package gnome-desktop-2.16.1: started
NOTE: package gnome-desktop-2.16.1-r1: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows (/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/temp/log.do_compile.24525)
| NOTE: make
| make  all-recursive
| make[1]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1'
| Making all in po
| make[2]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/po'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/po'
| Making all in libgnome-desktop
| make[2]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop'
| Making all in libgnome
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop/libgnome'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop/libgnome'
| Making all in libgnomeui
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop/libgnomeui'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop/libgnomeui'
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop'
| make[2]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/libgnome-desktop'
| Making all in gnome-about
| make[2]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about'
| Making all in headers
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about/headers'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about/headers'
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about'
| make[2]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/gnome-about'
| Making all in pixmaps
| make[2]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/pixmaps'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/pixmaps'
| Making all in desktop-docs
| make[2]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs'
| Making all in fdl
| make[3]: Entering directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs/fdl'
| xsltproc -o fdl-es.omf --stringparam db2omf.basename fdl --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang es --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help"
--stringparam db2omf.omf_in "`pwd`//home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs/fdl/fdl.omf.in" `/home/ulf/projects/OpenEmbedded/build/tmp/staging/i686-linux/bin/pkg-config --variable db2omf gnome-doc-utils`
es/fdl.xml
| warning: failed to load external entity
"/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs/fdl//home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs/fdl/fdl.omf.in"
| db2omf: Could not construct the OMF maintainer element.
|   Add an author, corpauthor, editor, othercredit, or publisher
|   element with the role attribute set to "maintainer" to fdl.xml.
| make[3]: *** [fdl-es.omf] Error 10
| make[3]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs/fdl'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1/desktop-docs'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/gnome-desktop-2.16.1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/ulf/projects/OpenEmbedded/build/tmp/work/armv5te-angstrom-linux-gnueabi/gnome-desktop-2.16.1-r1/temp/log.do_compile.24525
NOTE: package gnome-desktop-2.16.1-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gnome-desktop-2.16.1: failed
ERROR: Build of /home/ulf/projects/OpenEmbedded/org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb do_compile failed
ERROR: Task 2246 (/home/ulf/projects/OpenEmbedded/org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
ERROR: '/home/ulf/projects/OpenEmbedded/org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb' failed
ulf@aeglos:~/projects/OpenEmbedded/build>


-- 
Best Regards,
Ulf Samuelsson

--------------060805070003040800040305
Content-Type: text/x-vcard; charset=utf-8;
 name="ulf.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ulf.vcf"

begin:vcard
fn:Ulf Samuelsson
n:Samuelsson;Ulf
org:Atmel Nordic AB
adr;quoted-printable:;;Kavalleriv=C3=A4gen 24;Sundbyberg;S;117 58;Sweden
email;internet:ulf@atmel.com
title:Field Application Engineer
tel;work:+46 8 441 54 22
tel;cell:+46 706 22 44 57
url:http://www.atmel.com
version:2.1
end:vcard


--------------060805070003040800040305--
