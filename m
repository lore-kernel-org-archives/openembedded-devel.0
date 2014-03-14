Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3843C60D0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:27:03 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so1517872eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SyG9OCbfh8eknPAVEJK/5kvSYHuPwQUoYRv2UdNjVWQ=;
	b=Ia6rcny+fC9sFIlEnkJsSnUOQSZhrU1Xbm/5uxbeLWbtPROe+U9vjG4CzKLp3II1eN
	mmyrgSVxP03eh4daBF1r2qlfABwZZfRCo9FzL4MoCipda/k+V548DxaPyUQbw1+PPHtv
	XyGazY969E5jvJ7SiALkVyJ7o9cjr2Kuvxrndk1C0K6wuppAMKF0ggcWfpC7LH1SpDPc
	i0LSCgxtcxMbjWRxKw95ZJ/ZILrHOxQgj20ePJbPtMaHq78dDpfrGyv3RqEGuyBTXVP3
	ZguzVrncGQdh5h9xGSkyGVTFW6Um3vlPn82RwNRI8fL3X5qj/YgeGhJ0jx4XFmtPgQ5C
	97yQ==
X-Received: by 10.14.207.193 with SMTP id n41mr8907460eeo.44.1394810824064;
	Fri, 14 Mar 2014 08:27:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm17794045eeg.8.2014.03.14.08.27.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 08:27:01 -0700 (PDT)
Date: Fri, 14 Mar 2014 16:27:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314152717.GF3759@jama>
References: <1394792627-7361-1-git-send-email-raj.khem@gmail.com>
	<1577232.dQug1huf51@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1577232.dQug1huf51@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] licenses: Fix WARNING: qt3d: No generic license file exists for: PREVIEW.COMMERCIAL in any provider
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
X-List-Received-Date: Fri, 14 Mar 2014 15:27:05 -0000
X-Groupsio-MsgNum: 48674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2014 at 02:10:04PM +0000, Paul Eggleton wrote:
> On Friday 14 March 2014 03:23:47 Khem Raj wrote:
> > PREVIEW.COMMERCIAL
>=20
> Surely the license name should be something a bit more obviously related =
to=20
> Nokia / Digia / Qt ?

Agreed, I've used this because that's the name of the file in qt3d repo
which defines it and I haven't found "official" name, but if we're
going to include it by default in layer.conf, then we should rename it
to something better.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMjH9UACgkQN1Ujt2V2gBzAgACgpYcvHq1+5W/k2X1uc3wJKA1m
O94An2MRr7yGQoFjj3AJ08k9H3Dty3gH
=UEE1
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
