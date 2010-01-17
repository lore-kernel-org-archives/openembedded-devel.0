Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWWXY-0006Pn-1k
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 15:55:47 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWWVO-0008K8-8P for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 09:53:30 -0500
Date: Sun, 17 Jan 2010 09:52:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001171146.46952.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.1001170948220.8641@localhost>
References: <alpine.LFD.2.00.1001161439340.13406@localhost>
	<hitlc7$fes$1@ger.gmane.org>
	<alpine.LFD.2.00.1001170254190.2736@localhost>
	<201001171146.46952.holger+oe@freyther.de>
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
Subject: Re: what's the purpose of tarballs in the OE repo?
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
X-List-Received-Date: Sun, 17 Jan 2010 14:55:47 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Jan 2010, Holger Hans Peter Freyther wrote:

> On Sunday 17 January 2010 08:55:18 Robert P. J. Day wrote:
>
> >   good plan, i'll take a look at that later today, thanks.
>
> thanks for the work you have put into this.

  not a big deal, i noticed that a couple people have already replied
that they have ideas for how to move some tarballs out of the OE repo.

  i'm well aware that, very occasionally, there are special
circumstances which require that actual content be added to the repo,
but in cases like that, it might be useful to add a README file to the
appropriate recipes directory explaining those circumstances.

  not only would that prevent confusion but, sometime down the road,
someone examining that README file might realize, "hey, those special
circumstances don't apply anymore, we can finally do a proper download
here!", and submit a patch for it.

  or something like that.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


