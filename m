Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8T5b-0000xp-HX
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 07:23:30 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8T4M-0005nE-A7 for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 01:22:10 -0500
Date: Thu, 12 Nov 2009 01:22:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911120656.41249.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0911120116420.1847@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
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
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 06:23:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 12 Nov 2009, Holger Hans Peter Freyther wrote:

> On Thursday 12 November 2009 06:47:22 Robert P. J. Day wrote:
> >   seriously, either the build of xterm_207 should be fixed, or
> > that package should be dropped in its entirety.  it's been at
> > least three weeks since i pointed out that it doesn't build, and
> > even explained in detail *why* it doesn't build and how to fix it.
> > to no avail.
> >
> >   so, a humble suggestion -- either fix it, or remove it from OE
> > entirely.
>
> Did you attempt to create a patch?

  no, but i explained in precise detail (down to the exact line) what
the problem was, and *one* possible way it could be fixed, but given
that there was more than one possible fix, i left it with the list to
decide how to resolve it.

  and before someone lays the blame back at my feet, it was koen who
posted that, when bugs are identified and posted to the list, they are
typically fixed within a day.  it's been about three weeks now, and
the breakage remains.

  so, once again, seriously, either fix it or officially obsolete that
package and remove it from any builds that currently include it.
either way would work just fine.

rday

p.s.  do you want me to, once again, explain what the problem is and a
couple possible solutions?

--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


