Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6pcR-0008L6-44
	for openembedded-devel@openembedded.org; Sat, 07 Nov 2009 19:02:38 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 7488A1D36078; Sat,  7 Nov 2009 19:01:18 +0100 (CET)
Date: Sat, 7 Nov 2009 19:01:18 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20091107180118.GD25214@ibawizard.net>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
	<1257536522-11924-2-git-send-email-ynezz@true.cz>
	<1257536522-11924-3-git-send-email-ynezz@true.cz>
	<be7a9f3d0911070843w78f620abtbb4ee96db6e5f6c0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911070843w78f620abtbb4ee96db6e5f6c0@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] xf86-video-geode: update to 2.11.6
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
X-List-Received-Date: Sat, 07 Nov 2009 18:02:38 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio@ossystems.com.br> [2009-11-07 14:43:43]:

> Hello,

Hi,

> On Fri, Nov 6, 2009 at 5:42 PM, Petr =A9tetiar <ynezz@true.cz> wrote:
> > +COMPATIBLE_HOST =3D 'i.86.*-linux'
> > +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> > +
> > +RDEPENDS_append_iei-nanogx-466 +=3D "xserver-xorg-module-libint10 xs=
erver-xorg-module-xaa "
>=20
> IMO it could be added as regular RDEPENDS since the driver depends on
> that when running on GX and exa when on LX (exa might be added here
> too).

Ok. Should I update older packages also? Since I've copy&pasted it from t=
here.

-- ynezz


