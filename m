Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q9FWk-0000CB-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 13:43:30 +0200
Received: from [2001:638:602:1183:fc72:82ea:fd94:eb19] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q9FUc-00061O-Jv by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 13:41:20 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1Q9FUa-0006n2-Nc
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 13:41:16 +0200
Date: Mon, 11 Apr 2011 13:41:16 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110411114116.GB5626@excalibur.local>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
	<20110411080125.GB28101@jama.jama.net>
	<1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
	<20110411105712.GA5626@excalibur.local>
	<BANLkTikvA5bhUTJ0NhKXn158Y5RhZ8V-_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikvA5bhUTJ0NhKXn158Y5RhZ8V-_g@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 11:43:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-04-11 at 13:29, Anders Darander wrote:
> 
> On Mon, Apr 11, 2011 at 12:57, Stefan Schmidt <stefan@datenfreihafen.org> wrote:
> > On Mon, 2011-04-11 at 11:08, Anders Darander wrote:
> >> I'll try to make a somewhat better explanation in the included patch during the evening, and I can also remove the PR bump before submitting a third revision of the patch. Hopefully I can find some time this evening.
> >
> > Thanks for this. I will test your patch and push it out after this.
> 
> Thanks, I make sure to send a v3 this evening (at the latest tomorrow evening).

Thanks

> > While I still want to get lowpan-tools fixed for libnl2 I think this
> > is a good solution for the current releases.
> 
> Yes, I agree with you that the correct fix is to update lowpan-tools
> to use libnl2. However, due to time constraints, we opted for the
> interim solution.

Yup, no problem. I'm going to touch the ieee802154 kernel stack and
maybe lowpan-tools the next weeks anyway I will try to squeeze in the
change to libnl2.

regards
Stefan Schmidt


