Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZNV4-0007jw-Aj
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 12:53:01 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZNSp-0005hD-4u for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 06:50:39 -0500
Date: Mon, 25 Jan 2010 06:49:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001250345.51424.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.1001250647330.3439@localhost>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<201001241610.24013.holger+oe@freyther.de>
	<alpine.LFD.2.00.1001241029400.13981@localhost>
	<201001250345.51424.holger+oe@freyther.de>
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
X-List-Received-Date: Mon, 25 Jan 2010 11:53:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 25 Jan 2010, Holger Hans Peter Freyther wrote:

> On Sunday 24 January 2010 16:34:43 Robert P. J. Day wrote:
>
> > > On the other hand I agree totally agree that more testers the
> > > better, but IMO this would also mean that they follow the low
> > > volume bitbake-dev mailinglist, to get information like the
> > > svn->git switch, branches and such?!
> >
> >   i'm currently updating the bitbake manual (yes, you should be
> > nervous) and i noticed that there is nothing early on about how to
> > *get* bitbake.  so i'm going to add a short section, suggesting
> > first to use the latest official tarball (explaining where to get
> > it), followed by a section for more advanced users on how to check
> > it out, with the appropriate cautions.
>
> Thanks a lot for doing this update.

  still working on it, but a question.  a while back, i observed that
one of the OE branches (stable/2009?) came with bitbake built in,
while the other i work with (dev) did not.  or was it the other way
around?  and there was some confusion as to why the situation would be
different between the two branches.

  can i document that, no matter what branch one is working with, the
proper approach is to download bitbake separately and make sure that's
the one that's being invoked.  (i might add a short side note that
some branches came with bitbake built in, but users should *not* take
advantage of that.)

  does that sound reasonable?

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


