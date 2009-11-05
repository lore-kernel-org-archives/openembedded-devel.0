Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5wMv-0003c0-Ti
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 08:02:57 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5wLX-0006NF-Id
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 02:01:27 -0500
Date: Thu, 5 Nov 2009 02:01:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <20091105054827.GD30116@denix.org>
Message-ID: <alpine.LFD.2.00.0911050153290.19993@localhost>
References: <alpine.LFD.2.00.0911050014240.6944@localhost>
	<20091105053459.GC30116@denix.org>
	<20091105054827.GD30116@denix.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: where is the canonical OE web site these days?
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
X-List-Received-Date: Thu, 05 Nov 2009 07:02:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 5 Nov 2009, Denys Dmytriyenko wrote:

> On Thu, Nov 05, 2009 at 12:34:59AM -0500, Denys Dmytriyenko wrote:
> > On Thu, Nov 05, 2009 at 12:15:09AM -0500, Robert P. J. Day wrote:
> > >
> > >   if one goes to openembedded.org these days, one gets to
> > > linuxtogo.org.  but there's also the site openembedded.net, which
> > > takes you to a fairly useful wiki (even if some of the info seems a
> > > bit out of date).  and the linuxtogo wiki definitely doesn't take one
> > > over to the openembedded.net wiki.
> > >
> > >   so where's the official portal these days?
> >
> > Try http://www.openembedded.org or http://wiki.openembedded.org. I
> > believe there is a misconfiguration (in DNS?) where
> > openembedded.org points to the IP address of linuxtogo.org, hence
> > opening http://openembedded.org opens http://linuxtogo.org Not
> > sure if there was a reason for that, as linuxtogo.org handles the
> > mailing list, but that would require an MX record, not IN...
>
> Sorry, meant to say "would require MX record, not A"...
>
> Hmm, interesting. According to my dig, there is no MX record for
> openembedded.org. Then lists.openembedded.org is a CNAME to
> openembedded.org - no wonder it requires to point A record to
> linuxtogo.org for the mailing list to work properly... I'm not sure
> why it's being done this way - let's ask admins :)

  i only brought this up since i was getting a bit confused as to what
were valid URLs and websites for OE.  as i mentioned earlier, some of
the top-level links at http://openembedded.org/ (eg., "OpenEmbedded",
"OpenZaurus" and "G(PE)^2") all appear borked.  at the very least, my
ISP claims that they don't resolve.

  and i ran across wiki.openembedded.net strictly by accident, but
it's obvious that it's still active, as there are recent news articles
from just last month.

  however, it's just as obvious that some of that info is out of date.
here:

  http://wiki.openembedded.net/index.php/OEandYourDistro

some of the distros listed there really are long gone (fedora 2/3/4),
and documenting them probably has little value.

  and as for fedora 11, some of the listed "necessary" packages really
aren't.  in particular, it appears that the "python-psyco" package
doesn't even *exist* anymore in f11.  just an observation.

  but glitches aside, a lot of that info is useful and should be more
obviously available.

rday
--



========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


