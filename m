Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ob8NV-0007DI-RJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 10:40:49 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ob8NH-0003bl-L0 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 10:40:30 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Ob8NG-0003rz-UM
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 10:40:27 +0200
Date: Tue, 20 Jul 2010 10:40:26 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720084026.GI1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i23lkm$ftn$1@dough.gmane.org>
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
X-List-Received-Date: Tue, 20 Jul 2010 08:40:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-20 at 10:09, Koen Kooi wrote:
> On 20-07-10 09:01, Stefan Schmidt wrote:
> > 
> > From the silence on this topic I gather that the interest to create a new branch
> > or change the process is quite low.
> 
> I have an interest in a new stable branch, but no interest in changing
> the process.

Fair enough. Lets handle the issues seperately for now.

> The biggest problem is the .dev is halfway into big changes, e.g.
> halfway into new-style staging,

Agreed. While I think we are more then halfway through with this. Recipes are
left but most of the active maintained are already done. NO numbers but my
feeling here.

> halfway into packaged-staging rework, halfway into nativesdk, etc.

These both are ongoing for quite some time already. I have to admit that I lost
track where they stand and what is still outstanding.

So your suggestion is to wait until all three are done?

regards
Stefan Schmidt


