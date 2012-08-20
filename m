Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3NOX-0000qT-M9
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:31:33 +0200
Received: by weyr6 with SMTP id r6so3985729wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RjzbujmJxdANusUJc6rj743TPD/FPpiM+Jm1Zm8YsBk=;
	b=qsu8EHMxm8zcLVGX9WpcO9UHNwQ4SnL0QN2ovb7vCWaAZTk9GILvryvamOT1NMmrvR
	dBg3ClMn3zIfujvtHMGiAMtIivlJuiGXMBt4iQlwO0pR2dwhHIZ+NCPGhKy6eq0rJjvr
	1o8dAGUPpn4W5S5d7HEbWqkzlKyDC9S1V1xIvUVzEINaR4YW6gJsUqccQTU69sNfy8Md
	GjtP1gdZ+v1XOWRR1CVLaVJefBq6fLV1/eYefOTUbZlSgI/vPmbMwFBVLRfceJH0Ovbe
	LdhycD1Q8b4MOx4P7a4mUIsx4tz6SXg++OHgB+ZbzBEB5RWuqcGDX2bAYRk6fQE0kPem
	wkGA==
Received: by 10.216.244.203 with SMTP id m53mr7369510wer.46.1345450771769;
	Mon, 20 Aug 2012 01:19:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm39912871wib.8.2012.08.20.01.19.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:19:30 -0700 (PDT)
Date: Mon, 20 Aug 2012 10:19:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120820081933.GB3063@jama.jama.net>
References: <1345373533-14583-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1345373533-14583-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd 1/2] connman: follow oe-core to 1.4 and move to oe-core subfolder
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
X-List-Received-Date: Mon, 20 Aug 2012 08:31:33 -0000
X-Groupsio-MsgNum: 40261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2012 at 12:52:12PM +0200, Andreas M=FCller wrote:
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../connman/connman_1.4.bbappend}                  |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/{meta-oe/recipes-connectivity/connman/connman_1.3.bb=
append =3D> oe-core/recipes-connectivity/connman/connman_1.4.bbappend} (100=
%)
>=20
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.=
3.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.4.=
bbappend
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3=
=2Ebbappend
> rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.4.b=
bappend

weird, this patch didn't make it to patchwork

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAx8xUACgkQN1Ujt2V2gByOoQCeLWZQ4YJEv8w5s3tHDQqA10xs
PKYAn3Vzsoszcf65SlfDKSbvjkhXr8q5
=pKlL
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
