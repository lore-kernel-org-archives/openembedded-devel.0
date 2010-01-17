Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWQ1a-0007Kp-IV
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 08:58:21 +0100
Received: from cpe00195b4acfae-cm001adea99f3e.cpe.net.cable.rogers.com
	([99.235.244.96] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWPzR-0007Zq-5Y for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 02:56:05 -0500
Date: Sun, 17 Jan 2010 02:55:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hitlc7$fes$1@ger.gmane.org>
Message-ID: <alpine.LFD.2.00.1001170254190.2736@localhost>
References: <alpine.LFD.2.00.1001161439340.13406@localhost>
	<hitlc7$fes$1@ger.gmane.org>
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
X-List-Received-Date: Sun, 17 Jan 2010 07:58:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Jan 2010, Rolf Leggewie wrote:

> Robert P. J. Day wrote:
> >   following up on a thread from the bitbake dev ML, what is the
> > purpose of actual tarballs in the OE dev repository?
>
> best way to find out is probably to do a "git log
> --finde-copies-harder" on the files in question and asking the
> committers directly is probably the best way to find out.
>
> If they have otherwise no home on the net, I'm sure we can provide
> hosting somewhere.

  good plan, i'll take a look at that later today, thanks.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


