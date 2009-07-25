Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MUilP-0006kF-Bv
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 17:02:20 +0200
Received: from p5b03667c.dip.t-dialin.net ([91.3.102.124] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MUiXM-0006Au-Hw by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 16:47:51 +0200
Received: from stefan by dodger with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1MUiZU-0005rJ-Mj for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 16:50:00 +0200
Date: Sat, 25 Jul 2009 16:50:00 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090725145000.GD16892@dodger.lab.datenfreihafen.org>
References: <20090722195130.GE5337@dodger.lab.datenfreihafen.org>
	<20090725090719.GA4800@dodger.lab.datenfreihafen.org>
	<be7a9f3d0907250706p451d8f87pd8fca6f6ebb76bfc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0907250706p451d8f87pd8fca6f6ebb76bfc@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [RFC] fakeroot: Add 1.12.4 as 1.12.1 is now longer available on debian mirrors.
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
X-List-Received-Date: Sat, 25 Jul 2009 15:02:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2009-07-25 at 11:06, Otavio Salvador wrote:
> 
> On Sat, Jul 25, 2009 at 6:07 AM, Stefan
> Schmidt<stefan@datenfreihafen.org> wrote:
> >
> > On Wed, 2009-07-22 at 21:51, Stefan Schmidt wrote:
> >>
> >> Fakeroot 1.12.1 fetch fails as the debian mirrors now longer carry that file.
> >> 1.12.4 is still available, use this.
> >>
> >> Comments? Fine to commit?
> >
> > Can be ignored now. No comments, but Otavio commited the same fix.
> 
> I didn't see the commit; I did it while hacking our first ltsp based chroot ;-)

No worries. :)

regards
Stefan Schmidt


