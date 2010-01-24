Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NZ4XD-0000ld-5T
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:37:58 +0100
Received: from cpe00e0b8e80755-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.244.198] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NZ4Uy-0001vt-E9 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 10:35:36 -0500
Date: Sun, 24 Jan 2010 10:34:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001241610.24013.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.1001241029400.13981@localhost>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<201001231357.53005.holger+oe@freyther.de>
	<alpine.LFD.2.00.1001240845250.12002@localhost>
	<201001241610.24013.holger+oe@freyther.de>
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
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Sun, 24 Jan 2010 15:37:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 24 Jan 2010, Holger Hans Peter Freyther wrote:

> On Sunday 24 January 2010 14:50:39 Robert P. J. Day wrote:
>
> >   as long as users know the risks, i'd personally *encourage* them
> > to use the dev version, and reports bugs they find.  the more
> > testers, the better, no?
>
> It really depends. People following the getting started
> documentation are normally not in the class of users that know the
> risks?! Do you agree?

  absolutely, which is why i qualified that recommendation with "as
long as users know the risks", with the risks (or at least reasonable
cautions) pointed out to them.

> On the other hand I agree totally agree that more testers the
> better, but IMO this would also mean that they follow the low volume
> bitbake-dev mailinglist, to get information like the svn->git
> switch, branches and such?!

  i'm currently updating the bitbake manual (yes, you should be
nervous) and i noticed that there is nothing early on about how to
*get* bitbake.  so i'm going to add a short section, suggesting first
to use the latest official tarball (explaining where to get it),
followed by a section for more advanced users on how to check it out,
with the appropriate cautions.

  there will be a HUGE caution added that people should make sure
they're not running an old version.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


