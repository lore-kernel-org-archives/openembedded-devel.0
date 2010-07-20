Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1ObCwQ-0000xV-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 15:33:03 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1ObCwG-0008QD-Al by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 15:32:55 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1ObCwF-0000si-F6
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 15:32:51 +0200
Date: Tue, 20 Jul 2010 15:32:51 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720133251.GK1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<4C45A062.6080606@balister.org>
MIME-Version: 1.0
In-Reply-To: <4C45A062.6080606@balister.org>
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
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 13:33:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-20 at 09:10, Philip Balister wrote:
> On 07/20/2010 04:40 AM, Stefan Schmidt wrote:
> >On Tue, 2010-07-20 at 10:09, Koen Kooi wrote:
> >
> >>The biggest problem is the .dev is halfway into big changes, e.g.
> >>halfway into new-style staging,
> >
> >Agreed. While I think we are more then halfway through with this. Recipes are
> >left but most of the active maintained are already done. NO numbers but my
> >feeling here.
> >
> >>halfway into packaged-staging rework, halfway into nativesdk, etc.
> >
> >These both are ongoing for quite some time already. I have to admit that I lost
> >track where they stand and what is still outstanding.
> >
> >So your suggestion is to wait until all three are done?
> 
> We should identify the work in progress in dev and decide which ones
> we should finish before creating a new staging. There is no sense
> making a new stable branch and then creating a major diversion from
> dev that will make maintaining both in parallel for as long as
> possible difficult.

Does my mail read as if I wanted to rush this in? If yes, that was not my
intend.

I'm interested in new stable branch. I had a moment where I hoped it would be
ready in time for our upcoming BUG2.0 release, but this moment is over already.
Neverless I want to see it happened and it should not be rushed in.

The question was completely honest. Is the idea to wait until all three are
finished (for every recipe in tree)?

For the new staging I could imagine that we could get close. Of course minus all
the recipes in tree nobody maintains. A problem we always have and which does
not go away in a stable snapshot.

For packaged staging it may come true as well, but the nativesdk part I see
mostly arguing back and forth. So if the people listed as stable maintainers
come to the conclusion that we should wait for all three that is fine with me.
Maybe a roadmap what you guys want to have ready before branching of would help
others then.

regards
Stefan Schmidt


