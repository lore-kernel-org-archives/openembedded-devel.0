Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M10Sj-0008PG-Lt
	for openembedded-devel@openembedded.org; Mon, 04 May 2009 17:52:14 +0200
Received: (qmail 28040 invoked from network); 4 May 2009 15:46:25 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 4 May 2009 08:46:25 -0700
Date: Mon, 4 May 2009 08:46:24 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090504154624.GH7973@smtp.west.cox.net>
References: <20090503233009.B15601880DC@amethyst.openembedded.net>
	<20090504032113.GG7973@smtp.west.cox.net>
	<200905040954.04468.jay4mail@gmail.com>
	<200905041049.44146.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200905041049.44146.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Tom Rini : base.bbclass: check_gcc3 needs	to?check for gcc-3.4.6 first.
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
X-List-Received-Date: Mon, 04 May 2009 15:52:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2009 at 10:49:43AM +0400, Roman I Khimov wrote:
> On Monday 04 May 2009 09:54:04 Yuri Bushmelev wrote:
> > Hello!
> >
> > > And I really wish qemu would get fixed / rewritten to work with some
> > > sort of modern compiler, yeah :(
> >
> > Qemu 0.10.0 and higher (current is 0.10.3) require no gcc3.x to build. Look
> > here: http://www.nongnu.org/qemu/changelog.html
> 
> Speaking of which, we've been using 0.10.2 for native (GCC3 in build? No, 
> thanks!) and it worked fine for us. Though there are a lot of patches 
> currently in OE for qemu, some are very target-specific, so I've not checked 
> those.

Great.  Just one thing, can we grab 0.10.3 (or whatever the most current
stable is)?

-- 
Tom Rini


