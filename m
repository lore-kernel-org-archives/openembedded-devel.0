Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NfpzR-0005nr-AZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 08:31:04 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 690861D360E2; Fri, 12 Feb 2010 08:28:26 +0100 (CET)
Date: Fri, 12 Feb 2010 08:28:26 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100212072826.GN24852@ibawizard.net>
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
	<1265676216-9722-3-git-send-email-ynezz@true.cz>
	<201002091003.19947.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201002091003.19947.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux 2.6.24: moving ts72xx to 2.6.27 as default	kernel so change DEFAULT_PREFERENCE
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
X-List-Received-Date: Fri, 12 Feb 2010 07:31:08 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> [2010-02-09 10:03:19]:

> Dnia wtorek, 9 lutego 2010 o 01:43:32 Petr =A9tetiar napisa=B3(a):
> > -DEFAULT_PREFERENCE_ts72xx =3D "1"
> > +DEFAULT_PREFERENCE_ts72xx =3D "-1"
>=20
> Just drop DEF_PREF, do not set it to default value.
>=20
> > -PR =3D "r34"
> > +PR =3D "r35"
>=20
> Do not bump kernel PR if you do not use it anymore. This part should go=
 to=20
> previous patch as it changes patches.

Hi,

is second version ok for you? If so, would you mind to commit it pls? :-)=
 Thanks.

-- ynezz


