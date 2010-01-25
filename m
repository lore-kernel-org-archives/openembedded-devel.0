Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZOD6-0006Ph-Vb
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 13:38:32 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZOAp-000055-Vy for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:36:08 -0500
Date: Mon, 25 Jan 2010 07:35:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjk21o$8m0$1@ger.gmane.org>
Message-ID: <alpine.LFD.2.00.1001250734330.4249@localhost>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<201001241610.24013.holger+oe@freyther.de>
	<alpine.LFD.2.00.1001241029400.13981@localhost>
	<201001250345.51424.holger+oe@freyther.de>
	<alpine.LFD.2.00.1001250647330.3439@localhost>
	<hjk21o$8m0$1@ger.gmane.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Mon, 25 Jan 2010 12:38:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 25 Jan 2010, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-01-10 12:49, Robert P. J. Day wrote:

> >   still working on it, but a question.  a while back, i observed
> > that one of the OE branches (stable/2009?) came with bitbake built
> > in, while the other i work with (dev) did not.  or was it the
> > other way around?  and there was some confusion as to why the
> > situation would be different between the two branches.
> >
> >   can i document that, no matter what branch one is working with,
> > the proper approach is to download bitbake separately and make
> > sure that's the one that's being invoked.  (i might add a short
> > side note that some branches came with bitbake built in, but users
> > should *not* take advantage of that.)
> >
> >   does that sound reasonable?
>
> *If* is has bitbake builtin, users should use that one, as it is
> certain that bitbake will match the metadata. You can opt to choose
> to install a bitbake yourself, but then it's up to you to make sure
> bitbake and OE match. Since stable/2009 is a long term branch we
> decided to put bitbake in there to remove at least on point of
> failure.

  ok, i'll point that out, thanks.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


