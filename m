Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Mzwnp-00013b-Po
	for openembedded-devel@openembedded.org; Mon, 19 Oct 2009 20:17:56 +0200
Received: (qmail 20279 invoked by uid 813007); 19 Oct 2009 18:16:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Oct 2009 18:16:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2009 20:18:28 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<19c1b8a90910191052i25ebec10q20e2f045cab3914a@mail.gmail.com>
	<4ADCAB0E.9050607@mwester.net>
In-Reply-To: <4ADCAB0E.9050607@mwester.net>
MIME-Version: 1.0
Message-Id: <200910192018.29300.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 18:17:57 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 19 pa=C5=BAdziernika 2009 o 20:08:14 Mike Westerhof=
 napisa=C5=82(a):
> Khem Raj wrote:

> > You might have to try builds because there could be some backported
> > patches already applied which now are in the new minor release. (I
> > haven't looked myself if there is such a case.)
=20
> There may also be platform-specific patches that won't apply with the
> newer kernel updates, a possibility that is more likely with the
> pressure to have maintainers use the generic kernel recipes instead of
> just creating their own specific recipe.
>=20
> And no, I haven't yet looked to see this will be a problem for the
> ixp4xx kernels; that's not a big concern and I'll fix that myself should
> it be necessary.  I merely mention this to point out that we probably
> need to move carefully on blanket updates to the kernel if we wish to
> encourage use of the generic kernel recipes -- that's all. :)

And those reasons are why I did not pushed any of those this time (before I=
=20
updated .30 and .31). Tomorrow will do some build testing.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




