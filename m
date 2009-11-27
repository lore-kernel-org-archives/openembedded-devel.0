Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NDw8d-0001Us-7o
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 09:25:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 9EDB8A2C357
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:00:28 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id XpDwzgT24z8g
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:00:24 +0100 (CET)
Received: from tomboy.localnet (pD9E15882.dip.t-dialin.net [217.225.88.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 8E1B2A2C341
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:00:24 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Nov 2009 09:00:24 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31-6.slh.2-sidux-amd64; KDE/4.3.2; x86_64; ;
	)
References: <E1NDcWJ-0005Ee-Np@melo.openembedded.org>
	<ae9c9a1c0911261808v3dec996fqd83d164f6c960798@mail.gmail.com>
In-Reply-To: <ae9c9a1c0911261808v3dec996fqd83d164f6c960798@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911270900.24221.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Thomas Zimmermann : obexd: add version 0.19
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
X-List-Received-Date: Fri, 27 Nov 2009 08:25:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Freitag 27 November 2009 03:08:42 schrieb Ricardo Salveti de Araujo:
> Hi,
> 
> I actually sent a similar patch to the list, but also moving the
> content to a .inc file, 4 days ago.
> 
> Was this patch available anywhere else or simply no one is paying much
> attention to patchwork?
> 
> Just to understand better how the patch process is actually being handled
>  in OE.
> 
> Thanks,
> 
> Ricardo
> 
> On Thu, Nov 26, 2009 at 8:28 AM, git version control
> 
> <git@git.openembedded.org> wrote:
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: 05e63abd2b64cd171d41d7f4745463bfb325d396
> > URL:  
> >  http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=05e63abd2b
> >64cd171d41d7f4745463bfb325d396
> >
> > Author: Thomas Zimmermann <ml@vdm-design.de>
> > Date:   Thu Nov 26 09:20:49 2009 +0000
> >
> > obexd: add version 0.19
> >
> > Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
> >
> > ---
> >
> >  conf/checksums.ini          |    4 ++++
> >  recipes/bluez/obexd_0.19.bb |   10 ++++++++++
> >  2 files changed, 14 insertions(+), 0 deletions(-)
> >
> > diff --git a/conf/checksums.ini b/conf/checksums.ini
> > index df3e609..5755108 100644
> > --- a/conf/checksums.ini
> > +++ b/conf/checksums.ini
> > @@ -19802,6 +19802,10 @@
> > sha256=44ba0d99e1bf8fa2caf9f7a85d569e513208c0710c1ad00032e271289e87b63f
> > md5=5674f746b55439d32bc765d2c5baad16
> >  sha256=6dbabd9345967120ad21cc25489a6d244aed7975cee9297cc5716af4debc7228
> >
> > +[http://www.kernel.org/pub/linux/bluetooth/obexd-0.19.tar.gz]
> > +md5=2f03b81411a1f7c359ada35459d946a5
> > +sha256=37fb4cffad7e361daffa9915ee6a37e615d0bf4d1f24760e585d5ac922515ca8
> > +
> >  [http://downloads.sourceforge.net/openobex/obexftp-0.20.tar.gz]
> >  md5=085b9edc0504c0d79e7479a54e2018c5
> >  sha256=7246fc75257afcd30ff16dc70185057157bcefc12fa9fba111b3b201577cc40e
> > diff --git a/recipes/bluez/obexd_0.19.bb b/recipes/bluez/obexd_0.19.bb
> > new file mode 100644
> > index 0000000..e1cc6ce
> > --- /dev/null
> > +++ b/recipes/bluez/obexd_0.19.bb
> > @@ -0,0 +1,10 @@
> > +DESCRIPTION = "OBEX Server and Client"
> > +DEPENDS = "openobex glib-2.0 dbus bluez4"
> > +
> > +LICENSE = "GPLv2"
> > +
> > +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
> > +
> > +inherit autotools_stage
> > +
> > +FILES_${PN} += "${datadir}/dbus-1/"
> >
I needed that package und because of that i asked Klaus to commit it for me.
I haven't looked at patchworkd, sorry for that.


