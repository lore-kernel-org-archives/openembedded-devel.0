Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1ObI74-0007rd-Q4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:04:23 +0200
Received: from p5b0342e9.dip.t-dialin.net ([91.3.66.233] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1ObI6u-0005Br-Ez by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 21:04:14 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1ObI6s-0007mU-RR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:04:10 +0200
Date: Tue, 20 Jul 2010 21:04:10 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720190410.GM1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
	<i24qm2$qc6$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i24qm2$qc6$1@dough.gmane.org>
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
X-List-Received-Date: Tue, 20 Jul 2010 19:04:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-20 at 20:42, Koen Kooi wrote:
> 
> On 20-07-10 19:34, Stefan Schmidt wrote:
> > 
> > Wasn't there a list produced with all recipes that used legacy staging? I swear
> > I have seen something like this but I can't find it in my recent builds.
> 
> In your TMPDIR:
> 
> koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq | wc -l
> 53

Ha, there it was. :)

> It includes beasts like perl and python.

Hmm, that would be tricky. But there are some more easier ones that could get
nucked before.

regards
Stefan Schmidt


