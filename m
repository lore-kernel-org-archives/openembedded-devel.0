Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QXAqd-0002lm-7U
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 13:34:55 +0200
Received: (qmail invoked by alias); 16 Jun 2011 11:31:27 -0000
Received: from p57963E0B.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.62.11]
	by mail.gmx.net (mp045) with SMTP; 16 Jun 2011 13:31:27 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18Oa8FC+k0O2/IviIMFdI41rG9A4zJWOnE07D87NV
	Zp3kC1tDbTsVZe
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2011 13:32:52 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-91.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
	<201106160954.59066.schnitzeltony@gmx.de>
	<4DF9B7F6.60408@eukrea.com>
In-Reply-To: <4DF9B7F6.60408@eukrea.com>
MIME-Version: 1.0
Message-Id: <201106161332.52786.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH v2 0/2] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Thu, 16 Jun 2011 11:34:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, June 16, 2011 09:59:50 AM Eric B=E9nard wrote:
> Hi Andreas,
>=20
> On 16/06/2011 09:54, Andreas Mueller wrote:
> > On Monday, June 06, 2011 11:25:43 PM Andreas Mueller wrote:
> >> Changes to V1:
> >>=20
> >> * changed commit messages
> >> * split patch
> >>=20
> >> Andreas Mueller (2):
> >>    mx28 SOC: set correct addresses for u-boot
> >>    mx28evk: set valid console
> >>  =20
> >>   conf/machine/include/imx28.inc |    4 ++--
> >>   conf/machine/mx28evk.conf      |    2 +-
> >>   2 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > Can somebody please take care for these harmless 3 lines?
>=20
> done
> Thanks,
>=20
> Eric
>=20
Thanks for committing

Andreas


