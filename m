Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NXLJS-000306-8U
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 22:08:37 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 794CA1D3607A; Tue, 19 Jan 2010 22:06:16 +0100 (CET)
Date: Tue, 19 Jan 2010 22:06:16 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100119210616.GH18793@ibawizard.net>
References: <20100119135245.GF18793@ibawizard.net>
	<1263926326-31162-1-git-send-email-ynezz@true.cz>
	<hj5604$1g6$1@ger.gmane.org> <20100119205933.GG18793@ibawizard.net>
MIME-Version: 1.0
In-Reply-To: <20100119205933.GG18793@ibawizard.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] xinput_calibrator: switch to autotools
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
X-List-Received-Date: Tue, 19 Jan 2010 21:08:37 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Petr =A9tetiar <ynezz@true.cz> [2010-01-19 21:59:33]:

> Rolf Leggewie <no2spam@nospam.arcornews.de> [2010-01-19 21:51:16]:
>=20
> > Petr =A9tetiar wrote:
> > > Signed-off-by: Petr =A9tetiar <ynezz@true.cz>
> > > ---
> > >  ...01-switch-to-autotools-based-build-system.patch |  162 ++++++++=
++++++++++++
> > >  .../use-proper-compiler.patch                      |   20 ---
> > >  .../xinput-calibrator/xinput-calibrator_0.5.0.bb   |    7 +-
> > >  3 files changed, 166 insertions(+), 23 deletions(-)
> > >  create mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5=
.0/0001-switch-to-autotools-based-build-system.patch
> > >  delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5=
.0/use-proper-compiler.patch
> >=20
> > something's wrong with that patch.  I can't apply it locally :-(
>=20
> Hi,
>=20
> please can you tell me the reason, error message? Thanks.

Found it and send v2 of this patch. Sorry for the noise, but it was done =
against my
private branch :(

-- ynezz


