Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1ObuQT-0000rq-Qw
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 13:59:09 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1ObuQH-0000d8-1f by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 13:58:47 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1ObuQF-0004om-JT
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 13:58:43 +0200
Date: Thu, 22 Jul 2010 13:58:43 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722115843.GD10442@excalibur.local>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
	<1279721232-24744-17-git-send-email-heinold@inf.fu-berlin.de>
	<20100722082630.GB10442@excalibur.local>
	<20100722112113.GA7974@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20100722112113.GA7974@rhein.zuhause.netz>
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
Subject: Re: [PATCH 16/21] fastjar: backport 0.98 version from openembedded-dev
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
X-List-Received-Date: Thu, 22 Jul 2010 11:59:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-07-22 at 13:21, Henning Heinold wrote:
> 
> sorry I have no problem with the patch.

Not you but I have to be sorry. Mistake on my side. I had a evil

[apply]
    whitespace = strip

in my .gitconfig whcih stripped the whitespaces off and therefore broke the
patch. Sorry again. Build test is running now.

regards
Stefan Schmidt


