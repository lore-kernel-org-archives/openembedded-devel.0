Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SVACD-0008Sp-1F
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 01:33:25 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M46004IFWYI3I90@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	17 May 2012 18:23:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BD9FC201CA; Thu,
	17 May 2012 19:23:06 -0400 (EDT)
Date: Thu, 17 May 2012 19:23:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120517232306.GN6829@denix.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
	<jp3k9b$p58$1@dough.gmane.org>
	<CALbNGRRGD=oykOV8mb0tTi+ZhHHTjsA7bbSTGSPr_OYUi=sPUQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALbNGRRGD=oykOV8mb0tTi+ZhHHTjsA7bbSTGSPr_OYUi=sPUQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-systemd
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
X-List-Received-Date: Thu, 17 May 2012 23:33:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 17, 2012 at 10:18:26PM +0200, Andreas M?ller wrote:
> On Thu, May 17, 2012 at 9:41 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 17-05-12 15:07, Andreas M?ller schreef:
> >> Hi
> >>
> >> happy to see this happen I have few questions on what is planned.
> >>
> >> In README is written:
> >>
> >>> And we're working to break the dependency on this one:
> >>>
> >>> URI: git://git.openembedded.org/meta-openembedded
> >>
> >> Maybe it is a misunderstanding but I would expect for contents of this
> >> layer
> >>
> >> * systemd.bbclass * all from meta-oe/recipes-core/systemd * bbappends for
> >> all recipes with systemd support.
> >>
> >> Is this correct?
> >
> > Correct. The bbappends will likely cause dependencies on non-oecore layers,
> > but so be it. We might need to set the unbreak-me flag for missing bb files
> > that match our bbappends.
> > Unless people actually start reporting the bugs they encounter by including
> > meta-oe...

Great! Glad to see progress in this area.


> Two more questions:
> 
> 1. Has anybody patches in queue to fill meta-systemd? If not I would
> stand up to prepare some.

I bet Koen has patches queued up - it was on his backburner since BSP Summit 
we had in early April... :)

-- 
Denys


