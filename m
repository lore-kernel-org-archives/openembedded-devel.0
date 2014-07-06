Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1C00D6AC8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Jul 2014 16:15:33 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so14825684wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jul 2014 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LoX6THUfysut+0yubVx5zpuhn6wc9dd0nqrMwFGXBZk=;
	b=xI52QEaLdd07myYxgrTnJTgeswTFWXPaxxRwWqSxE+7LkbrOT7iGaaySP+GFzHwK04
	GyvAZTQy9haIFB7XekPEyZa/5RjXS1drQ3o3Q1pHqHKFTeDKNzE9grHMpIfXAGfh+K1R
	N8LtOfTKzF3gDnVAybQ5MVe+KpA4VMemvZDPFcKE6fKDdDctLlr+n6mHY/b7qusMPekH
	C4IOgmsKxjxPFI5QIlzZ7rfWk4cogcnAEioZr+I7l1eJp/Bk/fmo4z8LUTL7lEvMphb7
	WW2c2kr2vZV6IfNQh2KZbyrP5UlEfMdaGXOJNhVPCKWdFTjrtt1DVpX3olIzWQCUIoMC
	xClA==
X-Received: by 10.180.105.68 with SMTP id gk4mr30567844wib.24.1404663333754;
	Sun, 06 Jul 2014 09:15:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ec8sm85629381wic.10.2014.07.06.09.15.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jul 2014 09:15:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 6 Jul 2014 18:15:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140706161534.GA2446@jama>
References: <1403706635-12134-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpqRO9Gc7uakKrY8Us8XLE2N4uV061dQiN7WLGBtHYc2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpqRO9Gc7uakKrY8Us8XLE2N4uV061dQiN7WLGBtHYc2A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [meta-browser][PATCHv2] firefox-{l10n, addon}: Drop runtime dependency on TUNE_PKGARCH firefox and keep allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Jul 2014 16:15:35 -0000
X-Groupsio-MsgNum: 50771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 05, 2014 at 07:08:10PM -0300, Otavio Salvador wrote:
> On Wed, Jun 25, 2014 at 11:30 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I think we need to have a better way to address this kind of thing in
> OE. Couldn't the package to 'tell' it is ABI safe?

Yes if you list them all in layer.conf

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO5diYACgkQN1Ujt2V2gBylqgCfcINEZDWE9/cWnhSBTg6vj8kk
+TUAnRHZoSaYJAFD8rQvsSQNVPx6SNzc
=pvzI
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
