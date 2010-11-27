Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PMHxb-0003ci-0O
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 11:24:51 +0100
Received: from p5b034141.dip.t-dialin.net ([91.3.65.65] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PMHwL-0004mH-ME by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 11:23:36 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PMHwK-0003D0-Mw
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 11:23:32 +0100
Date: Sat, 27 Nov 2010 11:23:32 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101127102332.GK22419@excalibur.local>
References: <1290852938-4776-1-git-send-email-schwarzkopf@sensortherm.de>
	<4CF0DB6A.6010107@sensortherm.de>
MIME-Version: 1.0
In-Reply-To: <4CF0DB6A.6010107@sensortherm.de>
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
Subject: Re: [PATCH] download link fixed
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
X-List-Received-Date: Sat, 27 Nov 2010 10:24:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2010-11-27 at 11:20, Klaus Schwarzkopf wrote:
> Is this patch ok or what can i do better?

You could do better, but already on the right way :)

- The subject line does not mention which areas/recipes are touched.
- Separate patches for separate recipes are better to track changes on recipe
  level.

http://wiki.openembedded.org/index.php/Commit_Policy

regards
Stefan Schmidt


