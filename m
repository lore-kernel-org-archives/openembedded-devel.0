Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NB7lJ-0005hr-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 15:13:32 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NB7jx-0004nJ-8L for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 09:12:05 -0500
Date: Thu, 19 Nov 2009 09:12:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258638762.23826.90.camel@mill.internal.reciva.com>
Message-ID: <alpine.LFD.2.00.0911190909260.5078@localhost>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
	<1258638762.23826.90.camel@mill.internal.reciva.com>
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
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 14:13:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Nov 2009, Phil Blundell wrote:

> On Thu, 2009-11-19 at 11:42 -0200, Otavio Salvador wrote:
> > Ok but what is the planned migration path from users that used
> > stable/2009 to stable/2010?
> >
> > I mean, when we start stable/2010 we expect that users that based
> > their distros in stable/2009 need to redo all work to move to
> > stable/2010? If we merge stable/2009 into .dev then this is going
> > to be much easier.
>
> I am still struggling to understand what you mean by "merge
> stable/2009 into .dev".  Can you please explain what exactly you
> think the result of this merge would look like?  Maybe you could
> pick a couple of sample packages and give a concrete description of
> how the merged version would differ from what is currently in .dev.

  what *is* the protocol for a new OE release?  if one were to emulate
kernel development, it would normally involve, perhaps, starting a new
branch headed toward, say, stable/2010, where packages would slowly be
frozen and, as the release date approached, we'd see tags like "rc1",
"rc2" and so on, and a final freeze and tag of "stable/2010", no?

  in the meantime, the .dev branch would chug merrily on.  is that
even remotely close?

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


