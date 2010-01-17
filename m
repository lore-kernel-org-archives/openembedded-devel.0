Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWYdQ-0001m6-3X
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 18:09:59 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWYbH-0000Ue-Rf for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:07:43 -0500
Date: Sun, 17 Jan 2010 12:06:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100117165403.GP30938@jama>
Message-ID: <alpine.LFD.2.00.1001171200010.16324@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<20100117165403.GP30938@jama>
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
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 17:09:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Jan 2010, Martin Jansa wrote:

> On Sun, Jan 17, 2010 at 11:47:06AM -0500, Robert P. J. Day wrote:
> >   it seems counter-productive to allow a single games package to put
> > the brakes on an entire build.
>
> Maybe you want to build with -k?
>
> If there is some build problem in games package, then it should be
> fixed, not silenced by whole task removal.

  i've reported the breakage related to gnome-games before:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02124.html

note in that posting that philip balister appears to confirm the
problem, and there's a reference to someone else who is working with
an update that might solve the problem.

  that was a *month* ago, and things are still broken.  if there's a
fix, then it should be applied.  if there isn't, then the reference to
gnome-games should be removed.  allowing a single broken package
that's been broken for over a month to be the single obstacle to a
successful build would seem to be entirely counter-productive.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


