Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvRW4-0003uj-7Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 09:37:24 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvRSx-0007mC-QW by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 09:34:02 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvRSx-0005lz-Jt
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 09:33:59 +0100
Date: Sat, 27 Mar 2010 09:33:59 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327083359.GA21542@excalibur.local>
References: <1252561144-5528-1-git-send-email-mike@compulab.co.il>
	<20100326215955.GF18337@excalibur.local>
	<hokf02$31b$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hokf02$31b$1@dough.gmane.org>
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
Subject: Re: [PATCH] omap3-sgx-modules: fix proc related build errors
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
X-List-Received-Date: Sat, 27 Mar 2010 08:37:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2010-03-27 at 09:18, Koen Kooi wrote:
> On 26-03-10 22:59, Stefan Schmidt wrote:
> > 
> > Koen, omap3-sgx-modules is your area of expertise. Can you comment on this?
> 
> 1.3.x is gone from OE now, we only have 1.4.x now, that doesn't need
> this patch.

Thanks. Removed from patchwork.

regards
Stefan Schmidt


