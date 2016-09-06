Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B096077649
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:11:44 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 1so195849477wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gLhp+HyhmqJEmyx75w9cajG4eyz6Kzitl+N25Q+ZKj0=;
	b=WgukC4qEpeiJnLhiunmrP3jodHMxtEBTRs2FH4pJDP35tJGs3FxdeB4RTY4EcWneJM
	yPQb13CBaT0rX2JislObRLkMSdtOnq4huQtRYV5duC1hpzc9k970u2CmZu6e9vEbvuyz
	Smqv/68HBfTlWq0Pldsd1ZKv3IR30YFAx57CgT9aZeHnAR+PQ/yVnkgUViY3oyMb6MYs
	2i7gFIQ+ByxCmZHdXazfXXL1K0rjz/mNreduLGxwvJXjdb5B/v7xPtsTECTeaAUxgEMo
	ZkNMo4NxBXnvzVuLCNTsDQYRW1vreWT17/NbtNhRRsv8zrm7EmUDLpp7oXcfZSj+Zkft
	X4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gLhp+HyhmqJEmyx75w9cajG4eyz6Kzitl+N25Q+ZKj0=;
	b=mwcWQOvIePOgeKs224bTVgoHD1sfFfKYerdaBU+JaiMINFBHWvwEgPDyzjH+DOydjQ
	5xhYy6AOG3xmO1+R30T2kG5ocWTKaVFcziMsJjM5rnWeSh7oayLobIl0aXj7U0I+i6Wp
	KLcd4FZbicL5BG8RJ8DxX/RdswzTh5D/5D03eCH0GtccuF/QyQJfBSdb0bEJcHPtmXQ6
	G0QCNYZw5BSRTete7RYg/dwZbc2ZOuQW6zPrpuUDwusGpXUglCkWedmBwAJX1GkEDriq
	sA8xSzKgi6KyEoi4capdKZVzjZ8xUKo+VzHGHm9KFK+KNhlDwRgO3w+ZgdX+3Nt2iiCa
	w45Q==
X-Gm-Message-State: AE9vXwNkpV3BwOTUSA00F6lTwAlhfFad7f7/pz5e6gkKloBcR6ihsevaYGncluam6YakSQ==
X-Received: by 10.28.16.3 with SMTP id 3mr21605054wmq.58.1473174704099;
	Tue, 06 Sep 2016 08:11:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	g62sm14359825wme.18.2016.09.06.08.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Sep 2016 08:11:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Sep 2016 17:11:42 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160906151142.GB2645@jama>
References: <d16f8d9b-2d69-116c-1eb7-35f871344e65@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d16f8d9b-2d69-116c-1eb7-35f871344e65@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Please merge krogoth-next > krogoth
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
X-List-Received-Date: Tue, 06 Sep 2016 15:11:45 -0000
X-Groupsio-MsgNum: 62980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 07:04:55AM -0700, akuster808 wrote:
> Please merge Kogoth-next to krogoth.
>=20
> TIA,

done

>=20
> Armin
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfO3K4ACgkQN1Ujt2V2gBy0TgCgrdY++3dI+BsRn9gxmiDaTl9V
rh0Amwe/pgBEr1ATGLAQS/dakmf4jS1u
=0S7C
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
