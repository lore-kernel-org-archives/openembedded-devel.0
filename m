Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OTH2N-0002Me-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 18:18:28 +0200
Received: from p5b032e9a.dip.t-dialin.net ([91.3.46.154] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OTGxo-0002YL-Vm by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 18:13:43 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OTGxn-0001Q3-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 18:13:39 +0200
Date: Mon, 28 Jun 2010 18:13:38 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100628161338.GA26604@excalibur.local>
References: <1277568967-23506-1-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1277568967-23506-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] shadow: Disable email checking completely
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
X-List-Received-Date: Mon, 28 Jun 2010 16:18:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2010-06-26 at 18:16, Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> This allows faster login due to not checking for new emails.

I just pushed this one by accident while pushing another fix. Does anyone see a
problem with it? If yes I'm going to revert it.

Will tell me to work in branches even more. :)

regards
Stefan Schmidt


