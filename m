Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZ2uS-00053H-S8
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:53:52 +0100
Received: from cpe00e0b8e80755-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.244.198] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZ2sE-0002xn-MA for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 08:51:30 -0500
Date: Sun, 24 Jan 2010 08:50:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001231357.53005.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.1001240845250.12002@localhost>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
	<BD272887-5F72-4B99-B9E9-0C8D1451426F@mac.com>
	<201001231357.53005.holger+oe@freyther.de>
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
X-List-Received-Date: Sun, 24 Jan 2010 13:53:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 23 Jan 2010, Holger Hans Peter Freyther wrote:

> On Saturday 23 January 2010 13:38:08 Elvis Dowson wrote:

> > Hi, I found the solution for this. I was using the older svn
> > repository, and bitbake is now being maintained using the git
> > repository, which has the latest updates.
> >
> > Switching to the git version of the bitbake repository helped
> > remove the error, and the build has now commenced! :-)
>
> And in general we encourage users to use the release tarballs of
> Bitbake. This is why you should not be able to find your git
> commands in the documentation on OpenEmbedded.org

  just catching up on this thread ... i'm confused, what does it mean
to say, "you should not be able to find your git commands in the
documentation on OpenEmbedded.org"?  does that mean that the
development version of bitbake has additional commands above and
beyond the latest tarball release that aren't documented?  or what?

  also, while i appreciate that you encourage people to use the stable
version of bitbake, i don't think you should be so discouraging
regarding people who want to use the git checkout.  as long as people
realize it's a development version, why would you want to talk people
out of using it and helping you identify possible bugs?

  as long as users know the risks, i'd personally *encourage* them to
use the dev version, and reports bugs they find.  the more testers,
the better, no?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


