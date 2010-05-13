Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OCTwg-0001cR-FL
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:39:10 +0200
Received: from p5b036869.dip.t-dialin.net ([91.3.104.105] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OCTsr-0003rH-U6 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 10:35:13 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OCTsq-0001Cd-Ic
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:35:08 +0200
Date: Thu, 13 May 2010 10:35:08 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513083508.GA3507@excalibur.local>
References: <1273182940.4942.10.camel@T61> <hse1bq$k70$1@dough.gmane.org>
	<20100512183815.GA27784@excalibur.local>
	<hsgbeu$a9i$4@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hsgbeu$a9i$4@dough.gmane.org>
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
Subject: Re: [PATCH] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Thu, 13 May 2010 08:39:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-05-13 at 09:58, Koen Kooi wrote:
> On 12-05-10 20:38, Stefan Schmidt wrote:
> > On Wed, 2010-05-12 at 12:53, Koen Kooi wrote:
> >>
> >> You forgot to bump PR in that patch
> > 
> > Yeah, and I forgot to bump it when testing and pushing it. Done now, thanks.
> 
> And you slipped in an imote2 change :)

Doh, really not my day. Linux-zigbee needs some more work before it can go in
the tree. Restored to the old kernel provider.

regards
Stefan Schmidt


