Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEjL4-0005uT-Qf
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:02:03 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEjKC-0004il-M3 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 15:00:59 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEjKB-0000Dg-KI
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:00:55 +0100
Date: Sat, 6 Nov 2010 15:00:55 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106140055.GE6691@excalibur.local>
References: <20100322160729.4972.62697.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<201003221733.58036.marcin@juszkiewicz.com.pl>
	<4BA898A8.4040701@ge.com>
MIME-Version: 1.0
In-Reply-To: <4BA898A8.4040701@ge.com>
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
Subject: Re: [RFC][PATCH v2] Alternative to busybox, using "proper tools"
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
X-List-Received-Date: Sat, 06 Nov 2010 14:02:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Tue, 2010-03-23 at 10:32, Martyn Welch wrote:
> Marcin Juszkiewicz wrote:
> > Dnia poniedziałek, 22 marca 2010 o 17:08:20 Martyn Welch napisał(a):
> >
> >   
> >> This patch provides a mechanism to replace busybox by defining a busybox
> >> package which actually just requires a set of other packages.
> >>
> >>     To get it to be used rather than the standard busybox, define:
> >>
> >>     PREFERRED_PROVIDER_busybox = "busybox-alt"
> >> ---
> >>
> >>  Marcin: Something like this you mean?
> >>     
> >
> > Yes, few notes:
> >  
> >   
> 
> No prob.

Martyn, did you sent out a newer version of this patch with the changes
integrated you acknowledged here? I can't find it in the repo only this outdated
version in patchwork.

regards
Stefan Schmidt


