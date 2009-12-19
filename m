Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NLyyB-0000En-Va
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 14:03:43 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NLywR-0002vL-3Q for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 08:01:51 -0500
Date: Sat, 19 Dec 2009 08:01:26 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1261226260.10861.20.camel@mattotaupa.wohnung.familie-menzel.net>
Message-ID: <alpine.LFD.2.00.0912190758060.6856@localhost>
References: <alpine.LFD.2.00.0912171137010.30166@localhost>
	<4B2A77E5.1040804@balister.org>
	<alpine.LFD.2.00.0912171402080.2265@localhost>
	<1261226260.10861.20.camel@mattotaupa.wohnung.familie-menzel.net>
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
Subject: Re: should i submit detailed bugs for e2fsprogs and gnome-games?
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
X-List-Received-Date: Sat, 19 Dec 2009 13:03:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 19 Dec 2009, Paul Menzel wrote:

> Am Donnerstag, den 17.12.2009, 14:02 -0500 schrieb Robert P. J. Day:
> > On Thu, 17 Dec 2009, Philip Balister wrote:
> >
> > > I saw the gnome-games problem. Steve says he has a later version
> > > in his repo, when he figure out some other things we hope that
> > > update solves the problem.
> >
> >   but the e2fsprogs build problem is all mine, is it?  *sigh*.
> > i'll see what i can figure out.
>
> Sorry, bad news for you Robert. My `bitbake beagleboard-demo-image`
> was successful with a030c6b8e12445a266a8673efe589375baf93ccc (with
> local commit to build Abiword without plugins) on a Debian
> Sid/unstable system.

  that's ok, it's still useful to know that other distros have no
problem since it helps narrow down the search.  i started out with
three broken packages, the mesa package got fixed quickly, philip
suggests there's a known issue with gnome-games, so that just leaves
me with e2fsprogs and figuring out why it won't build specifically on
fedora 12.

  these things happen, but e2fsprogs is the real puzzler.  dang.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


