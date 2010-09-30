Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1P1Qul-0006U1-3n
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 23:43:43 +0200
Received: (qmail invoked by alias); 30 Sep 2010 21:43:28 -0000
Received: from p50882973.dip.t-dialin.net (EHLO localhost.localdomain)
	[80.136.41.115]
	by mail.gmx.net (mp032) with SMTP; 30 Sep 2010 23:43:28 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19+/SRKX1Z+OXdZp/vfwUk0Q09y5QHtEOk/bMDTNB
	mP37tXhVyFazhS
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 23:38:37 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
	<AANLkTikzbm2zfbDbXc2a6AJTHuvQC9FaZYmw65udiJq-@mail.gmail.com>
	<201009240055.34347.schnitzeltony@gmx.de>
In-Reply-To: <201009240055.34347.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201009302338.38026.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 30 Sep 2010 21:43:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 24 September 2010 00:55:34 you wrote:
> On Thursday 23 September 2010 09:44:30 pm Frans Meulenbroeks wrote:
> > Frans (btw still interested to learn how it is tested)
> 
> My configuration (untouched since I started with OE)
> 
> MACHINE = "overo"
> DISTRO = "angstrom-2008.1"
> #ANGSTROM_MODE = "uclibc" -> glibc
> 
> I did 
> 
> 'bitbake clutter-gtk' with org.openembedded.dev / the *.ipk are installed on overo-machine.
> 
> and 
> 
> a full image on gumstix.overo branches containing all clutter recipes.
> 
> Tested are the example applications shipped with *-examples package. All were working fine. The only application which was working 'weak' was 
> gtk-clutter-multistage mentioning that there was an icon missing in the current theme.
> 
> meanwhile Paul did further build tests - also omap3 based.
> 
> Andreas
> 
The world is not running down without it but could someone take care of this?


