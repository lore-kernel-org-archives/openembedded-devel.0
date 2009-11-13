Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8rmO-0002Ge-Cw
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 09:45:19 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8rl4-0008AE-9E; Fri, 13 Nov 2009 03:43:57 -0500
Date: Fri, 13 Nov 2009 03:43:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <200911121411.53422.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0911130342570.31751@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<alpine.LFD.2.00.0911120748300.3045@localhost>
	<200911121411.53422.holger+oe@freyther.de>
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
Cc: Holger Hans Peter Freyther <holger@freyther.de>
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
X-List-Received-Date: Fri, 13 Nov 2009 08:45:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Holger Hans Peter Freyther wrote:

> On Thursday 12 November 2009 13:58:23 Robert P. J. Day wrote:
>
> >   i'm checking right now if there's an option to "ls" to turn *off*
> > that feature, but i don't see one offhand.  perhaps a better lesson is
> > that the way xterm's sinstall.sh script works is really hacky, using
> > sed to allegedly reproduce a file's existing mode settings.  perhaps
> > there's a simpler way to get that effect without dragging "sed" into
> > it.  but, again, if only one package was affected, maybe just hack up
> > an xterm fix and move on, and deal with things on a case-by-case
> > basis as they come up.
>
> Hi Robert,
>
> Could you please try this patch to the sinstall.sh?
>
> http://paste.lisp.org/display/90216

  xterm was recently upgraded to version 251 so that patch no longer
applies.  give me a few minutes and i'll fix and test it.


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


