Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlM63-0005cE-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 15:57:44 +0100
Received: by eekd17 with SMTP id d17so590349eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 06:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sB4Gtwn/2BUTlZ5xiA+nRcaVSbYoYES/NSjdzppOfH8=;
	b=gCX0n/37Ob2NOAYD/nIHA97NHalVNwv5InlHq4LvFxrVeTKsczR/kGfEEVlOp8ocVj
	33DHyIEwrbdmyMECzVKAuta5sDKT18iO7Abp/hz9zLM0faHXK9WkXtDuqvulfawsdANZ
	5uu4emGu1NEGD2UatGQUwCqvlbf4pxPygSFl8=
Received: by 10.14.32.20 with SMTP id n20mr1490611eea.42.1326379812928;
	Thu, 12 Jan 2012 06:50:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm20338700eeb.3.2012.01.12.06.50.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 06:50:11 -0800 (PST)
Date: Thu, 12 Jan 2012 15:49:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120112144959.GE3452@jama.jama.net>
References: <jemqcg$1q0$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jemqcg$1q0$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Thu, 12 Jan 2012 14:57:44 -0000
X-Groupsio-MsgNum: 36485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 03:23:08PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> tl;dr version: get your subject-prefix right
>=20
> Hi,
>=20
> I've cleaned up patchwork by marking every meta-oe patch as archived, min=
us
> the one Martin just sent.
>=20
> This means all the pending patches for meta-oe are listed here:
>=20
> http://patches.openembedded.org/project/oe/list/?q=3Dmeta-oe
>=20
> If your patches are missing, resend them using the method outlined in the
> README of the respective meta-openembedded layer.

I've checked mine and for some reason
http://patchwork.openembedded.org/patch/19153/
wasn't marked as Accepted by git hook (done that manually)

and [meta-oe] gpsd: disable xmlto
http://patches.openembedded.org/patch/19165/
was sent only few minutes before this email, so I guess it's still in
queue.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8O8xcACgkQN1Ujt2V2gBzzUQCfbJHFIpbYsSihBEI/3TihWGhT
+uYAmgNuBomLsOoa70Go0dtoSwZSyY2w
=LiN2
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
