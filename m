Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8UDo-0005et-EA
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 08:36:03 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8UCZ-0003YK-2Y; Thu, 12 Nov 2009 02:34:43 -0500
Date: Thu, 12 Nov 2009 02:34:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Holger Hans Peter Freyther <holger+oe@freyther.de>
In-Reply-To: <200911120820.08344.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0911120226140.3969@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<200911120820.08344.holger+oe@freyther.de>
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
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 12 Nov 2009 07:36:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 12 Nov 2009, Holger Hans Peter Freyther wrote:

> On Thursday 12 November 2009 07:36:32 Robert P. J. Day wrote:
>
> >   anyway, this is about the fourth time i've explained this,
> > either here or on the angstrom-devel list.  that's the error, and
> > it's entirely reproducible on my f11 system.  at this point, i'm
> > leaving it with the powers that be, and you're free to deal with
> > it or totally ignore it.  whatever suits you.
>
> Robert,
>
> I totally agree that bugs should be fixed. Your attitude is somehow
> weird as you demand others to fix problems you are experiencing.
> Honestly speaking I am a bit disturbed by this attitude.

  at this point, i don't much care.  recently, i've been investing
some time in OE, doing some builds and reporting bugs when i've found
them so, yes, i am *also* part of that community of which you speak.
i even promoted OE for the beagleboard when i gave a talk recently at
ontario linux fest:

  http://onlinux.ca/node/78

  when i first ran across that xterm bug, i reported it.  nothing
happened.  i waited, and mentioned it again.  eventually, philip
balister admitted that he'd reproduced it.  good, i thought, someone
else has seen it so it should be fixed eventually.

  nothing.  so i mentioned it *again*, but only after doing some
research, to the point where i tracked down the *cause* of the bug,
posted a detailed explanation of that cause, and even mentioned that
i'd verified that a proposed fix solved the problem.

  nothing.  at this point, i've quite given up on investing any more
time trying to help out.

> Work on OE is purely community driven, ...

  i'm well aware of that.  i was trying to become a productive
*member* of that community.  at this point, i've pretty much lost
interest.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


