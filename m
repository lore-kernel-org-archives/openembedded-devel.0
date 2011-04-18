Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QBjHm-0001Mq-4l
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 09:54:18 +0200
Received: from [2001:638:602:1183:cda5:2bfc:7471:f49a] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QBjFS-0000gY-Qk by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 09:52:00 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QBjFR-0005AM-Hf
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 09:51:53 +0200
Date: Mon, 18 Apr 2011 09:51:53 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110418075153.GA15540@excalibur.local>
References: <20110412085148.GC17374@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110412085148.GC17374@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: Patchwork day on Sunday 2011-04-17 and shutdown of patchwork.openembedded.org in favour of patches.openembedded.org
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
X-List-Received-Date: Mon, 18 Apr 2011 07:54:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2011-04-12 at 10:51, Stefan Schmidt wrote:
> 
> I would like to have another patchwork day on Sunday 2011-04-17. The
> focus will be on a final cleanup for patchwork.openembedded.org.

OK, wuite patchwork weekend again. Seems I would need to pester people
a bit more so they are going to look at it. Was just not in the mood
for it yesterday. To great weather. :)

I did some work on my own thought. See the results below.

> That one is set on hold in favour of patches.openembedded.org since a
> while now and the newest patches in their are 5 months old then while
> the oldest are nearly 2 years.
> 
> I would like everyone interested in patches sitting there comming back
> to us in this thread. A lot of them will apply now longer and
> interested parties should re-work them and re-sent them. That way they
> will get picked up by the new patchwork installation.

From 158 patches sitting there 98 no longer applied. The remaining 60
patches did apply cleanly. I skimmed over them and have not seen "must
have" patches in it. Some problems have already been fixed in other
ways, some recipe updates or new recipes. Surely there are still some
fixes in that are still missing.

But we will need feedback from the original submitter for this.
Without it I see not much point it keeping the patches.

> Also anyone having patches sitting in any of the patchwork
> installations should try to update the status of their patches. Maybe
> ping on the list again to get some feedback.

No response her eon the ml and neither in private or IRC. I would
judge therefor that the patches sitting in there are not of much
interest for people anymore.

What worries me is that people put work into them and maybe we have
not been fast enough with review and they just skipped OE. Which would
be a bad sign. Not much we can improve on the old patches for this
thought. Only trying to improve in the future on this.

> After this cleanup I would propose to shutdown
> patchwork.openembedded.org

Personally I think we are ready for this. I would propose shutting it
down next weekend.

regards
Stefan Schmidt


