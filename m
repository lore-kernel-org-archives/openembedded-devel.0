Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEmpp-0001eo-TR
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:45:50 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEmox-0007ok-Fv by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 18:44:58 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEmov-0008G4-Id
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:44:53 +0100
Date: Sat, 6 Nov 2010 18:44:53 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106174453.GN6691@excalibur.local>
References: <1288973274.28481.15978.camel@rex>
	<AANLkTi=9baSJYxwULah-FNS50gaK9bhF=aBG-4-ChrrP@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=9baSJYxwULah-FNS50gaK9bhF=aBG-4-ChrrP@mail.gmail.com>
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
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Sat, 06 Nov 2010 17:45:50 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Sat, 2010-11-06 at 13:26, Cliff Brake wrote:
> On Fri, Nov 5, 2010 at 12:07 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> 
> > So what do I mean by hard? First there are the conversations with your
> > legal department where some questions arise:
> >
> > * How do you ensure license compliance?
> > * When someone makes a change, how do you know the license is still
> >  correct?
> > * You've mixing GPLv2 and v3? How are you ensuring no contamination?
> > <cue a long discussion which I'd bet most companies have>
> 
> Is GPLv3 the issue here with patent, DMC, and Tivoization issues?  Is
> the solution to simply not have GPLv3 software in a device?

At least that is what I hear most of the times. Yocto should be able to build a
GPLv3-free image. Obviously this kinda results in keeping old versions of core
elements of software maintained by the FSF.

> Are there other license issues that companies are worried about?

Well, we have Google who demostrated that they would rather write everything
from scratch, including a libc, instead of using the GPL. :)

But that is not a problem for OE. All other players have realized how to deal
with the GPL.

regards
Stefan Schmidt


