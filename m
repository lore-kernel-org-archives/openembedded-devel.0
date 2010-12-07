Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PQ2Ax-0000mP-Lu
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 19:22:08 +0100
Received: from p5b0372eb.dip.t-dialin.net ([91.3.114.235] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PQ29W-0005iP-NK by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 19:20:41 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PQ29U-0001BI-QW
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 19:20:36 +0100
Date: Tue, 7 Dec 2010 19:20:36 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101207182036.GA4130@excalibur.local>
References: <4cf49384.a26fe50a.019c.ffffed4d@mx.google.com>
	<20101207113857.GG20482@excalibur.local>
	<idlk69$rbg$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <idlk69$rbg$2@dough.gmane.org>
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
Subject: Re: [PATCHv3 1/5] u-boot_git:add patch for am3517-crane board support
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
X-List-Received-Date: Tue, 07 Dec 2010 18:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-12-07 at 16:34, Koen Kooi wrote:
> 
> On 07-12-10 12:38, Stefan Schmidt wrote:
> > Hello.
> > 
> > On Tue, 2010-11-30 at 11:32, Anil Kumar wrote:
> >>     * Patch Version updated for latest git tree.
> >>
> >>     * This patch adds u-boot support for am3517-crane board.
> >>
> >>     * CraneBoard is a hardware development platform based
> >>       on the Sitara AM3517 ARM Cortex - A8 microprocessor
> >>       device. This is a low cost reference design.
> >>
> >>     * You can find more about CraneBoard here:
> >>            [1] http://www.ti.com/arm
> >>            [2] http://www.mistralsolutions.com/products/craneboard.php
> >>
> >> Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
> > 
> > I only reviewd the OE part, not the u-boot patch itself.
> > 
> > Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> > 
> > Who is going to take this one? On some earlier iterations I have seen Koen
> > stating that he will take them. Still the case?
> 
> It is. My craneboard should be arriving this week, so I'm waiting for
> that :)

As you will handle this I toss it from my todo list. :)

regards
Stefan Schmidt


