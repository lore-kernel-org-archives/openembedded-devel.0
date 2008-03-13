Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZnra-00070w-AV
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 14:53:02 +0100
X-ASG-Debug-ID: 1205416243-794400460000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id BA52D1E42A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 08:50:43 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id BzROeO2SSeQakvCm for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 08:50:43 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Eureka!  AVR32 ld-uClibc.so segfault solved
Date: Thu, 13 Mar 2008 08:50:42 -0500
User-Agent: KMail/1.9.7
References: <200803121450.09688.geoffrey@pager.net>
	<47D83769.5020405@linuxdevelopment.de>
In-Reply-To: <47D83769.5020405@linuxdevelopment.de>
MIME-Version: 1.0
Message-Id: <200803130850.42204.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205416243
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Thu, 13 Mar 2008 13:53:03 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 12 March 2008 03:04:57 pm Robert W=F6rle wrote:
> > So I now have a working OE based AVR32 build system, using binutils
> > 2.17.atmel.0.0.99 20060623, gcc 4.2.1-atmel.1.0.3, and uClibc
> > 0.9.29-atmel.1. This is essentially the same as Atmel's
> > buildroot-avr32-v2.1.0.  As soon as I clean stuff up a little, I'll
> > submit patches for this via bugzilla.  Minus this uclibc.inc diff.  I
> > need more expert opinion on this.
>
> excellent job, can you supply any patches you have already, i would be
> more then happy to bring this up ( again !)

I need to clean up what I've done and take out all the extraneous changes t=
hat=20
didn't actually help.  Then test the resulting patches from scratch to make=
=20
sure everything still works.  Hopefully I'll have the patch set ready later=
=20
today.

=2D--
Geoffrey





