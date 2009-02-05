Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LVAbR-0002Aw-AX
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 21:13:37 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090205201312.ZLCK2342.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>;
	Thu, 5 Feb 2009 15:13:12 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id CLDB1b00C1E665w04LDBnx; Thu, 05 Feb 2009 15:13:12 -0500
X-Authority-Analysis: v=1.0 c=1 a=HiWkEfo4AAAA:8 a=YLZkVB0M7hepEvVwhZEA:9
	a=0zHCqrx3r6YX97O-17spIBgUTRMA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 5 Feb 2009 13:13:11 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: Roman I Khimov <roman@khimov.ru>
Message-ID: <20090205201311.GT3856@smtp.west.cox.net>
References: <200902051836.25770.roman@khimov.ru>
	<200902052150.04203.roman@khimov.ru>
	<20090205190412.GS3856@smtp.west.cox.net>
	<200902052242.29168.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <200902052242.29168.roman@khimov.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 20:13:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2009 at 10:42:11PM +0300, Roman I Khimov wrote:
> Tom Rini:
> > On Thu, Feb 05, 2009 at 09:50:04PM +0300, Roman I Khimov wrote:
> > > Updated one:
> >
> > Perhaps a byacc.inc with most of what's in byacc_20081225.bb?
> 
> OK.
> 
> > > +SRC_URI = "ftp://invisible-island.net/byacc/byacc-20081225.tgz"
> >
> > then ${PN}-${PV}
> 
> I guess ${PN} would break native builds, done ${PV}.

Oops, you're right.

> > > +SECTION = "devel"
> >
> > Already set in the main one, btw.
> 
> OK, how about this one?

Looks good, thanks.  Assuming Koen doesn't push this shortly, I will.

-- 
Tom Rini


