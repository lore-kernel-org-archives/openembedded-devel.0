Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMJeN-0002cR-GU
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 14:45:24 +0200
Received: by fxm19 with SMTP id 19so535011fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=HJCX2elP8EWNn6UQr3lgVo+5uuHe/MwHEH7pWVuFS7g=;
	b=Vrm7jgdG+sKwulzj6fYJECUS67FG4CqVsXGeREYTdVyHWoKPiTpH3Obbu4g8UxtZEu
	WP1xVlqqPrQXiiIFMir/KPrEJcbIwanQRPL1nKHSwG4QvFgxu5vVPOh0uGk8BrT5DvHV
	a3XR5/J/obk2EDc7ysCB+zi7P72KLr8leAjnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dw58PbgkDIWl3++wFTJFoIu9eXUqyE1J/6DR6S0ux2Vfln+36uERKM+3oazQA1GwmS
	Rddas19EiRp3AE8fCKixKY1saWibOQJ1A3qHA20iGH4VU5Mxk+hbvDb4VnvEJpKXaft2
	QepIAPkiGZE1R829XpYPPdlWpKSd6d+ji/MBc=
Received: by 10.223.17.68 with SMTP id r4mr752911faa.62.1305636147998;
	Tue, 17 May 2011 05:42:27 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o10sm206655faa.19.2011.05.17.05.42.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 05:42:26 -0700 (PDT)
Date: Tue, 17 May 2011 14:42:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110517124220.GB11317@jama.jama.net>
References: <1305635011-6171-1-git-send-email-noor_ahsan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1305635011-6171-1-git-send-email-noor_ahsan@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] Add new recipe for 0.5.4 version.
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
X-List-Received-Date: Tue, 17 May 2011 12:45:24 -0000
X-Groupsio-MsgNum: 32145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline

--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 05:23:31PM +0500, Noor Ahsan wrote:
> * Added a new recipe for 0.5.4 version
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

Commit message should start with package_name:

=66rom "Add new recipe for 0.5.4 version." in Subject I have no idea what
are you talking about and have to open e-mail body.. which is not that
bad as displaying whole commit if it gets commited :).

Regards,

> ---
>  recipes/lttng/userspace-rcu_0.5.4.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/lttng/userspace-rcu_0.5.4.bb b/recipes/lttng/userspa=
ce-rcu_0.5.4.bb
> new file mode 100644
> index 0000000..e0d98e5
> --- /dev/null
> +++ b/recipes/lttng/userspace-rcu_0.5.4.bb
> @@ -0,0 +1,3 @@
> +require ${PN}.inc
> +SRC_URI[md5sum] =3D "04147d24749be75200173859839207f7"
> +SRC_URI[sha256sum] =3D "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4e=
b28948e234bd89f1"
> --=20
> 1.6.3.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEUEARECAAYFAk3SbSwACgkQN1Ujt2V2gBwyXgCYu5OzDStDHhfrTCe0dSn2QRkC
5wCdGKz4wobgijxasTJjfiH5QFBVGS8=
=WcVp
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
