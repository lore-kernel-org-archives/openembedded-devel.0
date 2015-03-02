Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3CD7382E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 14:26:23 +0000 (UTC)
Received: by wevk48 with SMTP id k48so33659204wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 06:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+IqOifOBFSxy0VOf/a9a0ESVtd1Notytvxn3rwPaVDk=;
	b=mgIzUqlmzvRiR68dKUY9mGbne2Hz9mULSi4ztQYV6b3QwcRV19aeTIqbj6GqPBdeLW
	xkgd2m3VHPgninXC/i+gEXwlId5F/RuPE//NKfG3u+3WcIgaljlRS8G8EbC6iyzbm1ji
	MT0kzrSiEoJxeyCiwwhEcpb/HpcRuhjBt5ZLyl0YtJ2zZqDaN62wnRj1aHJtkznF298V
	LuWuxr8DLU8Ie0hG3FKafoRQhv4ID5voMCG4s4kC+nwIl6v0KyOxWKf9YD2uwgR+60bX
	q3APLacu0GpjhRuZ9LmMNWbsUO5ccUAObeDyVcrtb/X4ytu+3uuO6dNcjOsWsuIboqf5
	zB0A==
X-Received: by 10.194.88.131 with SMTP id bg3mr60216396wjb.119.1425306383739; 
	Mon, 02 Mar 2015 06:26:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gz3sm16313008wib.1.2015.03.02.06.26.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 06:26:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 15:26:45 +0100
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20150302142645.GC2309@jama>
References: <54F47045.4080503@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54F47045.4080503@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Discuss: ruby-1.9.x EOL -- someone to add ruby-2.2?
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
X-List-Received-Date: Mon, 02 Mar 2015 14:26:24 -0000
X-Groupsio-MsgNum: 54587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fzZfjcV6kaBgkq89"
Content-Disposition: inline

--fzZfjcV6kaBgkq89
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 09:14:29AM -0500, Randy MacLeod wrote:
>=20
> As stated in the post below, ruby-1.9.3 is no longer supported
> and CVEs will not be released.
>=20
> I'm not a rubyist but I assume we should upgrade to ruby-2.2.0 which
> became the stable version as of December 25, 2014. Comments?
> Martin, you are listed as maintainer of the meta-multimedia,
> do you have any concerns about such an upgrade?

No concerns from me.. I don't use ruby much (mostly ruby-native for
webkit builds) so I would welcome such upgrade.

> If anyone wants to start work on this for meta-oe, that'd be great.
> If no one gets around to it, then a developer from WindRiver will
> likely be able to work on it but not a few months.
>=20
> ../Randy
>=20
> ---
> As of today, all support for Ruby 1.9.3 has ended. Bug and security=20
> fixes from more recent Ruby versions will no longer be backported to 1.9.=
3.
>=20
> This end of life was announced over a year ago.
>=20
> We highly recommend that you upgrade to Ruby 2.0.0 or above as soon as=20
> possible. Please contact us if you=E2=80=99d like to continue maintaining=
 the=20
> 1.9.3 branch or if for some reason you can=E2=80=99t upgrade.
>=20
> Posted by Olivier Lacan on 23 Feb 2015
> ---
> Also see:
> https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering
>=20
> --=20
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario,=20
> Canada K2K 2W5

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fzZfjcV6kaBgkq89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0cyUACgkQN1Ujt2V2gBx20ACgqJi0l7BVKoGmOGrsOkxw+B6u
BZAAnRKE6gwJHz9OuQqoiMJbxolQYXy6
=tXS9
-----END PGP SIGNATURE-----

--fzZfjcV6kaBgkq89--
