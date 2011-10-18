Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RG8At-0000c8-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 13:49:39 +0200
Received: by bkat8 with SMTP id t8so746895bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8xvsyes8cHRPwPOmwsrEbmBq0NQLqulChHQpllQ5ZFE=;
	b=xPS+Wnw3/nx6hghPyZeDzIyVOsmguoWS8HcuFp1RKlKeHFmonWdY29KjKAhOk6F7tP
	+w0GaoF77MTq4BxuzetkpfvFQ4dU+vUJk1R+YMruXtPDOKFDk+dWh5L+9y7rqSPXDg44
	25psFEOzbbO7/st+c0wh19dEEgnAHx2wYH2Cc=
Received: by 10.204.139.87 with SMTP id d23mr1496805bku.67.1318938228557;
	Tue, 18 Oct 2011 04:43:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm1807597bkw.5.2011.10.18.04.43.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 04:43:47 -0700 (PDT)
Date: Tue, 18 Oct 2011 13:43:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018114340.GC20678@jama.jama.net>
References: <1318852253-4171-1-git-send-email-schnitzeltony@gmx.de>
	<j7jma5$kg2$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7jma5$kg2$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][V3] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Tue, 18 Oct 2011 11:49:39 -0000
X-Groupsio-MsgNum: 34851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline

--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 01:01:25PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 17-10-11 13:50, Andreas M=FCller schreef:
> > initial source taken from oe-classic epdfview_0.1.7.bb commit
> > 44985d56bc556786812a0a02d6219afd31a7381d
> >=20
> > run tested on overo
> >=20
> > Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de>
>=20
> Martin, do you want to put this in your next pull request or do you want =
me
> to takes this directly?

I have only webkit-efl and eve changes in my queue and I would like to
get them applied upstream first. So please take this directly, I've
tested it here too and it looks fine.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dZmwACgkQN1Ujt2V2gBz/pwCbBTWytm756B9l8lXP5wWrEmy4
O+EAn1ZauRwheUSntXEVbNyPD/PAAKHf
=tq2O
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
