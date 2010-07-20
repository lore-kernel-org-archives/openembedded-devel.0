Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1ObIPB-0000g2-Nd
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:23:10 +0200
Received: from p5b0342e9.dip.t-dialin.net ([91.3.66.233] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1ObIP1-0005VJ-2f by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 21:22:57 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1ObIOz-0007oz-Lk
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:22:53 +0200
Date: Tue, 20 Jul 2010 21:22:53 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720192253.GN1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
	<AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 19:23:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-20 at 21:07, Esben Haabendal wrote:
> On Tue, Jul 20, 2010 at 7:34 PM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
> > On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
> >> And of course the number of people screaming for a stable branch is an
> >> order of magnitude larger than the number of people that end up actually
> >> supporting it.
> >
> > Sure, that is no surprise. :)
> 
> It might be surprising to some, but some of those not actively
> supporting the "stable" branch might choose not to do so because the
> chosen stable process does not fit their needs.
> Most likely, all people contributing to stable is mostly happy with
> how it is handled.

People who add a "me, too" for a new stable branch seem to think that they fit
their needs.

What does not fit your needs with the current stable handling?

I would like to have a more continous flow of changes from dev over some testing
branch to stable. As indicated in my initial mail. That would people working on
this idea and keeping it alive though. Given that no one seemed to be interested
but man seem to be interested to get a new stable/2010 branch the same way we
had for 2009 it seems the most practical way to get one at all, no?

Other models will only work if enough support from the active contributors is
available. Without this even the best idea might die.

regards
Stefan Schmidt


