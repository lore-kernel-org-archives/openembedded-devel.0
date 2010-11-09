Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PFjQr-0008KK-4S
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 09:19:57 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PFjPv-0000qV-NN by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 09:19:02 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PFjPv-0004Ow-7V
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 09:18:59 +0100
Date: Tue, 9 Nov 2010 09:18:59 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101109081859.GE19935@excalibur.local>
References: <20101104082759.GG19934@excalibur.local>
	<20101107182029.GP6691@excalibur.local>
	<4CD8083D.5080806@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CD8083D.5080806@mentor.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
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
X-List-Received-Date: Tue, 09 Nov 2010 08:19:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-11-08 at 07:25, Tom Rini wrote:
> Stefan Schmidt wrote:
> >
> >On Thu, 2010-11-04 at 09:27, Stefan Schmidt wrote:
> >>Its time for some house-keeping again. I know many people are working on
> >>patchwork on-going, thanks for that.
> >>
> >>Looking throught it during OEDEM did still show up way to many entries. Some are
> >>still from 2009. Next Saturday and Sunday I would like to reduce our  current
> >>count from 273 patches. 100 or less would be a nice goal imho.
> >
> >We are no down to a patch count of 186. With the new patches that came in the
> >last two days that makes 100 patches that are gone. Most of them had already
> >been applied or superseded by other patches and often were just missing a status
> >update.
> >
> >For the outstanding patches I see three big groups which need our attention:
> >
> >1) Core/class patches: It would be great if some people more familiar with the
> >   core internals of OE could have a look at them and discuss outstanding issues
> >   or apply them.
> >
> >2) Stable/2009 patches: We still have patches sitting in patchwork for the
> >   stable branch. It would be great if they also could get some attention, not
> >   only patches for master.
> 
> Would it be possible to get a list of patches that the folks (thanks
> a lot for doing it, everyone!) who did the cleanup felt fit into
> these areas?

Let me try. Stable is easy to identify as it has a stable prefix in the patch.
:)

Stable:
http://patchwork.openembedded.org/patch/2251/
http://patchwork.openembedded.org/patch/2250/
http://patchwork.openembedded.org/patch/2193/
http://patchwork.openembedded.org/patch/1924/
http://patchwork.openembedded.org/patch/1842/
http://patchwork.openembedded.org/patch/1839/

Core:
http://patchwork.openembedded.org/patch/691/
http://patchwork.openembedded.org/patch/972/
http://patchwork.openembedded.org/patch/1067/
http://patchwork.openembedded.org/patch/3446/
http://patchwork.openembedded.org/patch/3427/
http://patchwork.openembedded.org/patch/3428/
http://patchwork.openembedded.org/patch/3406/
http://patchwork.openembedded.org/patch/3382/
http://patchwork.openembedded.org/patch/3235/
http://patchwork.openembedded.org/patch/3201/
http://patchwork.openembedded.org/patch/3196/
http://patchwork.openembedded.org/patch/3139/
http://patchwork.openembedded.org/patch/2933/
http://patchwork.openembedded.org/patch/2592/
http://patchwork.openembedded.org/patch/2563/
http://patchwork.openembedded.org/patch/2558/
http://patchwork.openembedded.org/patch/2555/
http://patchwork.openembedded.org/patch/2526/
http://patchwork.openembedded.org/patch/2248/
http://patchwork.openembedded.org/patch/2200/
http://patchwork.openembedded.org/patch/2171/
http://patchwork.openembedded.org/patch/2491/
http://patchwork.openembedded.org/patch/2487/
http://patchwork.openembedded.org/patch/2094/
http://patchwork.openembedded.org/patch/1978/
http://patchwork.openembedded.org/patch/1926/
http://patchwork.openembedded.org/patch/1907/
http://patchwork.openembedded.org/patch/1858/
http://patchwork.openembedded.org/patch/1828/
http://patchwork.openembedded.org/patch/1741/
http://patchwork.openembedded.org/patch/1631/

I'm pretty sure that I have forgotten some. Many of them have already been
discussed and often the outcome is unclear.

regards
Stefan Schmidt


