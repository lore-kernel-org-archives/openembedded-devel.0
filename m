Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNlco-0003Ou-ML
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 14:22:02 +0100
Received: by faat2 with SMTP id t2so488727faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jwjflLLVN9dzk+a1WFty3fLHcOp9PvxLxGgLsZibEVY=;
	b=AqvsIwEPTEiAT3XQM8svYfBags+JlzUqNJ810hrIPQJwvyL7t7Y/kWgxu8h5+jGPyF
	UwYv6CV90OXT648y2IZQgm60QvlK0SalwtdWFv1vfIWPUDNTjcV8WMhEjP4QZges8R+o
	hpb2ERV+fc4vZ+dyYE4C6yOJRoprWXcMCqEiw=
Received: by 10.223.77.71 with SMTP id f7mr54574366fak.33.1320758148658;
	Tue, 08 Nov 2011 05:15:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm2121883fag.12.2011.11.08.05.15.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 05:15:47 -0800 (PST)
Date: Tue, 8 Nov 2011 14:15:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111108131535.GB3641@jama.jama.net>
References: <cover.1320757052.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <cover.1320757052.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/2] systemd related fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 13:22:02 -0000
X-Groupsio-MsgNum: 35256
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2011 at 12:57:59PM +0000, Otavio Salvador wrote:
> The following changes since commit bae85652e5fc8e78afe54e593686d5f74c933c=
b9:
>=20
>   udev: update to 175 (2011-11-08 09:13:23 +0100)
>=20
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe master
>   https://github.com/OSSystems/meta-oe/tree/master
>=20
> Otavio Salvador (2):
>   systemd.bbclass: stop using SYSTEMDPN to rdepends addition
>   connman: bump PR due systemd.bbclass fixes

Cannot test, but looks like better fix then mine..

>=20
>  meta-oe/classes/systemd.bbclass                    |   10 ++++++----
>  .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk65K3cACgkQN1Ujt2V2gBxvfQCfTRVgXhxplFjkqMQbsiSl8YEl
jlcAn23zn7nkJtVY8XxP+zJWq8op1SNF
=y8OO
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
