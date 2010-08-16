Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ol0EX-0001WW-QX
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 16:00:28 +0200
Received: from w1536.wlan.rz.tu-bs.de ([134.169.206.12] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ol0EB-0005XX-Kk by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 15:59:59 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Ol0E9-0000I1-5H
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:59:49 +0200
Date: Mon, 16 Aug 2010 15:59:43 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816135943.GG19855@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1281455076-4291-1-git-send-email-morphis@gravedo.de>
	<20100813215524.GE19855@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100813215524.GE19855@excalibur.local>
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
Subject: Re: [PATCH 5/5] lvm2.inc: remove unnecessary EXTRA_OECONF_arm line from recipe
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
X-List-Received-Date: Mon, 16 Aug 2010 14:00:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2010-08-13 at 23:55, Stefan Schmidt wrote:
> 
> On Tue, 2010-08-10 at 17:44, Simon Busch wrote:
> > Signed-off-by: Simon Busch <morphis@gravedo.de>
> 
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> 
> Will apply this with the other lvm patches tomorrow.

Done now. Thanks for getting lvm2 into a working state.

regards
Stefan Schmidt


