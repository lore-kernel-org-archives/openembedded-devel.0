Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PF9rq-0000c8-Mp
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 19:22:11 +0100
Received: from p5b034640.dip.t-dialin.net ([91.3.70.64] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PF9qw-0003zn-TS by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 19:20:33 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PF9qv-0003oo-JB
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 19:20:29 +0100
Date: Sun, 7 Nov 2010 19:20:29 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101107182029.GP6691@excalibur.local>
References: <20101104082759.GG19934@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20101104082759.GG19934@excalibur.local>
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
Subject: Re: Patchwork cleanup weekend in two days
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
X-List-Received-Date: Sun, 07 Nov 2010 18:22:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-11-04 at 09:27, Stefan Schmidt wrote:
> 
> Its time for some house-keeping again. I know many people are working on
> patchwork on-going, thanks for that.
> 
> Looking throught it during OEDEM did still show up way to many entries. Some are
> still from 2009. Next Saturday and Sunday I would like to reduce our  current
> count from 273 patches. 100 or less would be a nice goal imho.

We are no down to a patch count of 186. With the new patches that came in the
last two days that makes 100 patches that are gone. Most of them had already
been applied or superseded by other patches and often were just missing a status
update.

For the outstanding patches I see three big groups which need our attention:

1) Core/class patches: It would be great if some people more familiar with the
   core internals of OE could have a look at them and discuss outstanding issues
   or apply them.

2) Stable/2009 patches: We still have patches sitting in patchwork for the
   stable branch. It would be great if they also could get some attention, not
   only patches for master.

3) Outdated patches: We have patches reaching as far back as 2009. This needs
   improvement. Besides making sure that patches are getting review in a timely
   manner and really get applied when already acked we should think about
   patches that do not get and feedback at all.

As a side note the patchwork installation will move to our OSUOSL server. The
new installation will not hold the old patch history we have right now. This
should be taken as motivation to clean up the rest we have in there. :)

I have mixed feeling after this weekend. On the one hand we got rid of quite
some outstanding stuff on the other hand most of the changes have been updates
on the patch status and finding out if they have already been applied. Also only
a handfull people could get motivated to help. For the next incarnation of such
a weekend (I would aim for early december after the first release was tagged) it
would be great if more people could join the fun.

regards
Stefan Schmidt


