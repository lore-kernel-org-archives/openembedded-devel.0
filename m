Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LcP2N-0001WG-5w
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 20:03:21 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090225185913.JMYD4363.fed1rmmtao103.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 13:59:13 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id LJzD1b00A4dMFYL04JzDw4; Wed, 25 Feb 2009 13:59:13 -0500
X-Authority-Analysis: v=1.0 c=1 a=3t9qBeb09IMA:10 a=bHuD5RsJqpsA:10
	a=6tYX19vIdiCGKLKksfMA:9 a=JQZl8W2wu1rDw3by7Xm0-2c6MscA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 25 Feb 2009 11:59:12 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090225185912.GR2172@smtp.west.cox.net>
References: <49A4EAFC.3080806@dls.net> <go2tlk$akt$2@ger.gmane.org>
	<1235550209.2621.28.camel@andromeda> <49A5606D.3050507@dls.net>
	<1235586352.2621.42.camel@andromeda>
MIME-Version: 1.0
In-Reply-To: <1235586352.2621.42.camel@andromeda>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Minimal distro (was: fakeroot fails to build)
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
X-List-Received-Date: Wed, 25 Feb 2009 19:03:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2009 at 07:25:52PM +0100, Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 25.02.2009, 09:14 -0600 schrieb Mike (mwester):
> > So it sounds like there's not a libtool problem; rather I need to
> > upgrade to the new libtool entirely then. :-(   That's unfortunate,
> > really unfortunate timing -- but timing is not an OE issue. :-(
> 
> Sorry about that. I guess we really need a new stable branch.
> 
> > (BTW, the reason libtool got locked down for me is because it made
> > pkgconfig fail to build, so I might be back with questions on how to
> > make that work if that failure still exists.)
> 
> Try with pkgconfig 0.23, it works with the new libtool.
> 
> > ((Also, are there any non-angstrom distros still left in OE, besides
> > SlugOS?  I really feel like I'm swimming upstream all the time with OE
> > -- things break for me so often that just don't seem to affect anyone
> > else...))
> 
> I seriously want to revitalize the 'minimal' distro, that's why I have
> started to do some (invasive) work on improving / updating default
> versions.
> 
> As much as I love Angstrom, I think it is dangerous only to depend on
> one -- relatively complex -- distribution, since this hides all kinds of
> bugs in our metadata.
> 
> Since my time slots to work on that is also pretty limited, I'd be very
> glad if I could get some people on board to work towards this common goal:
> Providing a distribution with minimal policies and default settings that
> serves as a starting point for new distros.
> 
> Can I count on you?

As someone else who depends on !Angstrom working, I'll volunteer to try
and help the minimal distro keep working.  I assume making sure
icecc.bbclass works with minimal is OK :)

-- 
Tom Rini


