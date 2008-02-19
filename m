Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jin@mediatomb.cc>) id 1JRSCS-00077W-Ui
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 14:08:01 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id CE77383900; Tue, 19 Feb 2008 14:07:07 +0100 (CET)
Date: Tue, 19 Feb 2008 14:07:07 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080219130707.GD27792@deadlock.dhs.org>
References: <20080214155508.GA4163@deadlock.dhs.org>
	<37367b3a0802170728r226edd39r5e8fd7c2f4fa869b@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <37367b3a0802170728r226edd39r5e8fd7c2f4fa869b@mail.gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
X-SA-Exim-Connect-IP: 128.131.95.14
X-SA-Exim-Mail-From: jin@mediatomb.cc
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: building uClinux using OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2008 13:08:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, 

On Sun, Feb 17, 2008 at 12:28:27PM -0300, Alan Carvalho de Assis wrote:
> > uClibc is also already supported by OE, not sure if I would have to add
> > an option for uC-libc.
> >
> Although uC-libc is not so "up to date" I think it can be important to
> device with small flash memory (like Netburn MOD5272) since it create
> smallest binary footprint.

I will probably start with uClibc since it's already in OE, I am not sure
if my project requires uC-libc, I guess I will look at that when I get a
little further.

> > I do not have any uClinux experience yet, and it seems to be quite difficult
> > to gather all the bits and pieces of information, so I'd appreciate comments
> > and suggestions, especially if you see that I am missing something.
> >
> > I'd also be interested in your thoughts on what would be the best way to
> > integrate it into OE.
> >
> 
> Do you add all kernels supported by uClinux distro (2.0.x, 2.4.x and 2.6.x) ?

I will focus on 2.6.x, I do not have any hardware to test with the 
older kernels and the project I am working on also requires a 2.6.x version.
 
> I think your idea to add uClinux support on OE is fantastic!

Let's hope we succeed in doing so :)

Kind regards,
Jin




