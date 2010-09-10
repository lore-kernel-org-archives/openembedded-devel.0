Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Ou2h5-0003AQ-7S
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 14:27:04 +0200
Received: by ewy7 with SMTP id 7so1655140ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=VMb6+CAA136DU90EDtJyKAwJ2DQa4pYFY31ekOXuFUs=;
	b=ZWNaJLokVD9B5SkC59NK5yhCqey96KLtSQpneDJ4LvvMeM3G1Rrk3TpbR07ec48dgs
	T1EwMMF+uVAgpM+Fg0fET+h5OwlsH8gRXdD+ALWXD8mDPAaliPK6p0o+SzjjkIIbarel
	twKvmbQT8QRh6/Hh/Atu0Z+HSCf8EhbnnugUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=LI7JaoM93wBrh0LxCY/UOD7FqU2aLJsxR6Y31bwmsBFv7zOg794mhbom3HgfNk/Z+3
	VF/ksJlU91eIDm33iHskQSKWrYNOJXdyzxHWV0lAb8n2Tvr3LajNEcJF2Ef1htLF6XDr
	ElEi5e1uUp87KKY0YITYuOA7CEy9gfbdhnfgA=
Received: by 10.213.34.148 with SMTP id l20mr611205ebd.1.1284121581302;
	Fri, 10 Sep 2010 05:26:21 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([86.57.155.118])
	by mx.google.com with ESMTPS id u9sm3812786eeh.11.2010.09.10.05.26.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 05:26:20 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Sep 2010 15:25:27 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.35-gentoo-r5-anarsoul; KDE/4.4.5; i686; ; )
References: <AANLkTi=cSKF3AwffdKmZcLW=0eRji4U4Y_2cLFRYSh1S@mail.gmail.com>
In-Reply-To: <AANLkTi=cSKF3AwffdKmZcLW=0eRji4U4Y_2cLFRYSh1S@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009101525.32951.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Bill Roberts <robewil1@gmail.com>
Subject: Re: gettext-native build troubles
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
X-List-Received-Date: Fri, 10 Sep 2010 12:27:04 -0000
X-Groupsio-MsgNum: 23419
Content-Type: multipart/signed; boundary="nextPart3591977.BuLtbvzh0K";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3591977.BuLtbvzh0K
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
10 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2010 02:23:37 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Bill Roberts =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:
> Hello,
> I've been trying to make a build from the .dev branch, but I cannot seem =
to
> get past building gettext-native (version 0.18).  It seems to be a similar
> error to one from a past post, where libxml2 from the host was used, but
> libz from the staging.
>=20
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg=
03
> 981.html
>=20
> However, it seems that the fix in that case is in the gettext recipe.  In
> the log it looked like the link was trying to use my host libxml2, and the
> libxml2-native package in OE, but I'm not really sure.
>=20
> I'm wondering if anyone could offer some advice for how to get around or
> fix this error.
> Thanks,
> Bill

I've just sent a patch to fix this issue ([PATCH] gettext-0.18: use include=
d=20
libcroco, not system)

Regards
Vasily

--nextPart3591977.BuLtbvzh0K
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkyKI7wACgkQRM6pQpltKE7MoQCfX+MhhVFGN9zSI3hboxFQLr7r
AJ0AnjOZ+hLV8G5eKNOKIbz8Nrnyabt2
=c3pw
-----END PGP SIGNATURE-----

--nextPart3591977.BuLtbvzh0K--
