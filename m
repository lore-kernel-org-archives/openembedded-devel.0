Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LcOVE-0000DR-9V
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 19:29:04 +0100
Received: from [192.168.1.105] (e180139171.adsl.alicedsl.de [85.180.139.171])
	by drlauer-research.com (Postfix) with ESMTP id 4769058419A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 19:49:59 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49A5606D.3050507@dls.net>
References: <49A4EAFC.3080806@dls.net> <go2tlk$akt$2@ger.gmane.org>
	<1235550209.2621.28.camel@andromeda>  <49A5606D.3050507@dls.net>
Organization: Vanille-Media
Date: Wed, 25 Feb 2009 19:25:52 +0100
Message-Id: <1235586352.2621.42.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Minimal distro (was: fakeroot fails to build)
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
X-List-Received-Date: Wed, 25 Feb 2009 18:29:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 25.02.2009, 09:14 -0600 schrieb Mike (mwester):
> So it sounds like there's not a libtool problem; rather I need to
> upgrade to the new libtool entirely then. :-(   That's unfortunate,
> really unfortunate timing -- but timing is not an OE issue. :-(

Sorry about that. I guess we really need a new stable branch.

> (BTW, the reason libtool got locked down for me is because it made
> pkgconfig fail to build, so I might be back with questions on how to
> make that work if that failure still exists.)

Try with pkgconfig 0.23, it works with the new libtool.

> ((Also, are there any non-angstrom distros still left in OE, besides
> SlugOS?  I really feel like I'm swimming upstream all the time with OE
> -- things break for me so often that just don't seem to affect anyone
> else...))

I seriously want to revitalize the 'minimal' distro, that's why I have
started to do some (invasive) work on improving / updating default
versions.

As much as I love Angstrom, I think it is dangerous only to depend on
one -- relatively complex -- distribution, since this hides all kinds of
bugs in our metadata.

Since my time slots to work on that is also pretty limited, I'd be very
glad if I could get some people on board to work towards this common goal:
Providing a distribution with minimal policies and default settings that
serves as a starting point for new distros.

Can I count on you?

-- 
:M:



