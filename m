Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1Joe9m-0001bV-4l
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 14:33:02 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>) id 1Joe9f-0001Er-Ag
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 13:32:55 +0100
Date: Wed, 23 Apr 2008 13:32:55 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080423123254.GC28337@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
	<480596E2.7030906@gmx.net>
	<35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
	<480EE63D.8070208@gmx.net>
	<35a670560804230444j7706a535u818d812d72f77649@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <35a670560804230444j7706a535u818d812d72f77649@mail.gmail.com>
X-Cookie: The best things in life are for a fee.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 12:33:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 23, 2008 at 01:44:26PM +0200, Matthijs van de Water wrote:
> On Wed, Apr 23, 2008 at 9:33 AM, Robert Schuster <theBohemian@gmx.net> wrote:

> >  Btw: Your statement that 4.3 is not widely in use is not quite right:
> >  Fedora 9 and Debian Lenny are build with it or are in the process of
> >  transition.

> Ok. I'm not sure how widely deployed the Fedora and Debian ARM
> distro's are, but that sounds at least positive.
> I'm going to give GCC 4.3 a spin and report back.

Debian ARM gets a reasonable amount of use, especially now that various
NAS devices are supported by the installer, though it's currently
transitioning to armel.  From the point of view of building Java stuff
it certainly gets a lot of exercise since pretty much all packages are
built for all architectures.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


