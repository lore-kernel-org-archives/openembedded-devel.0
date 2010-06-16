Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOooV-0005iZ-Dp
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:21:39 +0200
Received: from guest198.ibr.cs.tu-bs.de ([134.169.35.198] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOokA-000388-7G by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:17:12 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OOok9-0004fQ-F9
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:17:09 +0200
Date: Wed, 16 Jun 2010 11:17:09 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616091709.GA20969@excalibur.local>
References: <4C187CF6.5010401@gmx.net>
 <hva2qe$jco$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hva2qe$jco$1@dough.gmane.org>
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
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 09:21:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-06-16 at 10:42, Koen Kooi wrote:
> 
> My second question: When is all that openjdk stuff you keep talking
> about ending up in OE? I know Henning keeps handwaving about it not
> being ready, but after after waiting a year, is it ever going to be
> deemed ready by the jalimo crew? Just merge it into OE now :)

I can't speak for the jalimo crew but I can tell you that Tarent is currently
hired by BugLabs to bring in openjdk-6 and different other things to OE dev and
stable for our upcoming BugLabs stuff.

It seems to me that Robert is right now trying to bring in all the needed deps
for some parts. Talking LLVM, and therefor this patch, for JIT and others. If
nothing problematics happens we should have this stuff in dev (and hopefully
also stable) withing the next weeks.

regards
Stefan Schmidt


