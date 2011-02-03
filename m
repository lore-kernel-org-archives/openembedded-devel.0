Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pl0Oz-0005UC-CU
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:43:17 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pl0O4-0000Ll-GC by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 15:42:23 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pl0O1-0002xC-KK
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:42:17 +0100
Date: Thu, 3 Feb 2011 15:42:17 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110203144217.GO4580@excalibur.local>
References: <1296741831-8096-1-git-send-email-stefan@buglabs.net>
	<1296741831-8096-2-git-send-email-stefan@buglabs.net>
	<4D4ABA94.7080403@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <4D4ABA94.7080403@xora.org.uk>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 02/11] xserver-nodm-init: switch to ndm-init 2.0 to get	a working matchbox session under Xorg
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
X-List-Received-Date: Thu, 03 Feb 2011 14:43:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2011-02-03 at 14:24, Graeme Gregory wrote:
> On 03/02/2011 14:03, Stefan Schmidt wrote:
> > ---
> >  .../include/angstrom-2008-preferred-versions.inc   |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> > index 67d4207..77e5e00 100644
> > --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> > +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> > @@ -65,6 +65,7 @@ PREFERRED_VERSION_wpa-supplicant = "0.7.3"
> >  PREFERRED_VERSION_wget = "1.11.4"
> >  PREFERRED_VERSION_xserver-common = "1.33"
> >  PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
> > +PREFERRED_VERSION_xserver-nodm-init = "2.0"
> >  PREFERRED_VERSION_xserver-xorg = "1.7.4"
> >  
> >  #
> Acked-by: Graeme Gregory <dp@xora.org.uk>

Thanks. Koen acked them both as well in private (firewall mail access problems)

Will stick them in.

regards
Stefan Schmidt


