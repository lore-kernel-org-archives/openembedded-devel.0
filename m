Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QUM0q-0007SI-E4
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:53:48 +0200
Received: from p4fc773cd.dip.t-dialin.net ([79.199.115.205]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QULxe-0001YD-1O by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 18:50:32 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>) id 1QULxc-0003sk-NS
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:50:28 +0200
Date: Wed, 8 Jun 2011 18:50:27 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110608165027.GA30722@excalibur.local>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
	<1307534514.2529.4780.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
	<1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
	<iso6bf$lu8$1@dough.gmane.org>
	<0C757E680E33864AB113392C7E83F910BE5188@GSX300A.mxchg.m.corp>
MIME-Version: 1.0
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5188@GSX300A.mxchg.m.corp>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 16:53:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-06-08 at 18:13, Hauser, Wolfgang (external) wrote:
> >Really? A default angstrom install will use bitbake 1.12.x and
> >2011.03-maintenances and that has been building perfectly for a while
> now.
> 
> I use the release archive as base and got errors using bitbake 1.12.0.

With archive you mean the release bracnh with all maintenance patches?

I recently switched our build, 2011.03 based, at BugLabs to bitbake 1.12
and did not hit a single problem. And that image contains a lot stuff
(12000 tasks).

If you are hitting a problem with 1.12 it might be worth fixing it for
2011.03. Depending on your use-case of course. What packages do you
see failing and whats your distro, etc?

regards
Stefan Schmidt


