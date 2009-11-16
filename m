Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9zEc-0006TE-7j
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:55:05 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9zDI-00053e-NA for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 05:53:40 -0500
Date: Mon, 16 Nov 2009 05:53:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258365971.25369.528.camel@lenovo.internal.reciva.com>
Message-ID: <alpine.LFD.2.00.0911160553300.13586@localhost>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
	<200911160100.38336.marcin@juszkiewicz.com.pl>
	<alpine.LFD.2.00.0911160353130.16011@localhost>
	<1258365971.25369.528.camel@lenovo.internal.reciva.com>
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
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 10:55:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 16 Nov 2009, Phil Blundell wrote:

> On Mon, 2009-11-16 at 04:05 -0500, Robert P. J. Day wrote:
> >   IMHO, the fact that you don't know anyone who uses a fedora
> > build host is not a compelling reason to ignore build breakage
> > that happens on a fedora build host.
>
> That's true, but not having access to a host where the problem
> occurs does make it much harder to do anything about it.

  which is why i'm more than happy to do that testing on my f12 beta
system, then report back with the relevant results.  and, AFAICT,
those reports have resulted in a couple subtle build issues being
fixed, at least for certain distros.

  i apologize for making such a big deal out of this, i didn't intend
to incite such a sh*tstrom, but here's the thing.  i've been told that
OE is most emphatically a "community" project.  of course it is -- i
understand that.  and i, as a long-time fedora user, am trying to
*contribute* to that community.  which is why i'm willing to check out
the dev branch, and keep it up to date, and burn off cycles trying to
build it on a regular basis, and report on build breakage and even try
to research that breakage to figure out what the problem might be and
how to fix it.

  i only wish i had the OE background to be able to debug and submit
patches for that breakage -- don't have it yet, but i'm working on it.
until then, i have to depend on the good graces of other OE folks to
help out.  but simply saying that, "hey, it builds on *my* distro, you
should use that distro" disqualifies a fairly huge part of a potential
community -- those folks that use fedora.

  and i'm willing to test as well, but i can't do that until i can
build -- it's as simple as that.  so, for now, the best i can do is
just keep running the stable version of angstrom on my beagleboard,
but keep pulling and trying to build until i get a working build which
i can use as a benchmark for future builds.  i just need to get there
first.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


