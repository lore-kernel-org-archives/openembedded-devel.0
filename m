Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C7C706012C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:19:57 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 4so48984430pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=szyAqVfRylcmpRYWN0Z88KNUR8VAk5ZyZsHPW9Olz9Y=;
	b=AfpxVzKt+XYoV0P633VzW3FeuTPPAoIIWJARh/n4aojfil5Naeo0cJLmFbyTs8Cq7l
	uXEO6XYc+oqVsoiZTLyExULYg0p/siyaeCJj4zEwiIFdbTVxdIN07J+v4HBEkhD7oAZg
	sfrrQVzC4fmskKhMOn/HBOcc0lmVg3D+a7076ukgam3jmY7ONFC74MI4rTQvUCsjLKEE
	PGn8uzs/Em6Qs+lk70Z0UlHWzj9ZKQyDH4ooFPaL++2WHI4ptlCw0X+wjmv8vjaOly2J
	32lCNEaraEnTmriM/ebF3AwnMqwY9ZGRtnP94JAtr8hsYuVQ5/eXjRnVPMHTYGuWPdeO
	GlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=szyAqVfRylcmpRYWN0Z88KNUR8VAk5ZyZsHPW9Olz9Y=;
	b=Hd98z0airuYAkfuHa3aclmE7TA4IZilCdfN9bkLU4epKsk+FJefxadDfwak1iudigD
	AL8wyFTc3GlLEnnC3kZRQTL/WSbPewibemJckeZG4o5NB8J4dP2Y/Q2lemtjL0jXn4cq
	ADAV4BOiChggMWlYJjW2MAJV0P558CMWZnT3ZHBk0yScZQzUEtlMr31gArZcJ+44ZXJy
	j+kfMR40z89R3g8ZubTFNf8Q6bNdxa/A4DXU6Y2PPfhc5wduJhfk0Xm7cucT2+2Qbwcr
	GObUbLwhbX/Sp9cGt5XSWwunfjurkTee7aGoP9Kc5PVIOT2LISxWqwyVVrfTT5cckvPy
	iSnQ==
X-Gm-Message-State: AD7BkJLH1znpwJmIaxiIuRbOT3GWywWE7KlZnhBc3cShhqoQoiuL71P+1rSyKR+WfSI8FQ==
X-Received: by 10.98.17.78 with SMTP id z75mr15640622pfi.40.1459361997924;
	Wed, 30 Mar 2016 11:19:57 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	to9sm7547375pab.27.2016.03.30.11.19.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 11:19:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71WjzNNeYY2pA5-YxtXFZJ01iPR=dgORMoYfCgWDPAA7_RsA@mail.gmail.com>
Date: Wed, 30 Mar 2016 11:19:52 -0700
Message-Id: <1BA327FE-7861-41A7-AB53-A5DBB8EF3FEA@gmail.com>
References: <CAP71WjzNNeYY2pA5-YxtXFZJ01iPR=dgORMoYfCgWDPAA7_RsA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: openbox themes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2016 18:19:58 -0000
X-Groupsio-MsgNum: 60738
Content-Type: multipart/signed;
	boundary="Apple-Mail=_210977A0-64CC-4D8A-BD6F-788F054C94B4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_210977A0-64CC-4D8A-BD6F-788F054C94B4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 30, 2016, at 4:48 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> hi,
>=20
> i am not sure if this is something new or not.. and I believe it used
> to work for me in the past (but I am not 100% sure..).
>=20
> If I only add openbox in my image, it would fail to start with
> something like this:
>=20
> dragonboard-410c:/home/linaro# openbox &
> ObRender-Message: Unable to load the theme 'Clearlooks'
> ObRender-Message: Falling back to the default theme 'Clearlooks'
> ObRender-Message: Unable to load the theme 'Clearlooks'
> Openbox-Message: Unable to load a theme.
>=20
> After I add openbox-theme-clearlooks in my image, openbox would start =
normally.
>=20

Do you have XDG_DATA_DIRS variable set to include /usr/share, try =
something like

export XDG_DATA_DIRS=3D$XDG_DATA_DIRS:/usr/share

before launching openbox, if that works then may be you should add it to =
/etc/profile
via a post processing hook or some such.

> As I said, I am fairly sure I had tried that before, and I don't
> remember adding a theme myself but it might have come as a dependency
> of some sort..
>=20
> Anyways, can someone confirm if openbox is expected to fail when no
> theme is installed? If so, should we gracefully handle this in openbox
> recipe and add a default theme as RDEPENDS?
>=20
> thank!
>=20
> nico
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_210977A0-64CC-4D8A-BD6F-788F054C94B4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8GMwACgkQuwUzVZGdMxThJACfavNhGRv9kYANPNE/BNiBdpex
A8sAn0h++41Nkb44nmi2Nsjssos2Okay
=wl/X
-----END PGP SIGNATURE-----

--Apple-Mail=_210977A0-64CC-4D8A-BD6F-788F054C94B4--
