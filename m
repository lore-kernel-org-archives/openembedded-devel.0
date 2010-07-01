Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OUI2l-0006bJ-5u
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:35:14 +0200
Received: from p5b032f87.dip.t-dialin.net ([91.3.47.135] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OUHy5-0004PG-HS by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 13:30:12 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OUHy4-0004LZ-Ly
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:30:08 +0200
Date: Thu, 1 Jul 2010 13:30:08 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100701113008.GB12260@excalibur.local>
References: <i0hp61$n03$1@dough.gmane.org>
	<20100701105500.GA12260@excalibur.local>
	<i0htq1$7dm$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i0htq1$7dm$1@dough.gmane.org>
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
Subject: Re: java staging problem
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
X-List-Received-Date: Thu, 01 Jul 2010 11:35:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-07-01 at 13:22, Koen Kooi wrote:
> > 
> > Right now I would be happy to have a reliable build and then work towards
> > getting it mor sane and bring it into OE. Thats blocking me a bit here from
> > further upstream work, but we will get behind it.
> 
> I pushed all the magic needed to build it for angstrom:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=90249cc563b916a4d764573156042fd8998f0731
> 
> That should make it easier for other people to test.

Good. Lets work on a cleaner solution once build problems have been settled.

regards
Stefan Schmidt


