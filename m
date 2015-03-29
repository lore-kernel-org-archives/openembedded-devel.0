Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 77CA573C73
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 22:48:41 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so45750909wgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DmlO0hL3RWM1redQ8fmMLxTVUlPx0GyaZFnDFazEd5g=;
	b=cFl0a5oVpYmfpWKu2MXzHjRe8B/Z/4Z0kGHkpL2it94aYCFeHy5P9/NMDLQIjaCVEv
	/uJ8Brbho3fbZEi0oVrYgxPmGLTcQ0nJturkOOWuUeDc2X/Xmx+dvUmXmhlcemGp4UHE
	sEtaC3PG5HOzHfcWcRPCMbiZhICNdOTQAiNhgWi3HWW3CJ/TTPStsPZU3guifDK+HjLf
	f0LKkRff9oIOvnOmlU8XmqLEX65uOKX4QFboHXO2oaN40sLMKT/QehqIRpSty472r4r/
	mFy+3AEoDnwb/erlKpChwMDU6qv4BMEfAgH53x0e+MqbDjAz3M5Vm0Pp1Hx+MgrUEAQu
	caRA==
X-Received: by 10.180.96.197 with SMTP id du5mr16905424wib.68.1427669322980;
	Sun, 29 Mar 2015 15:48:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hn8sm12999258wib.18.2015.03.29.15.48.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Mar 2015 15:48:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 00:49:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150329224904.GG2343@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: fido branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Sun, 29 Mar 2015 22:48:42 -0000
X-Groupsio-MsgNum: 54895
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

as every 6 months I'm looking for some volunteer(s) to step-up and
maintain "fido" release branch.

You can sign-up by replying to this thread and then one of you need to
send README update like this:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098=
458.html
squashed with
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098=
481.html

More details in thread searching for daisy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/09560=
1.html
http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.=
html
or dizzy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098=
441.html

Thanks,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUYgWAACgkQN1Ujt2V2gBxQDACfSEnt+8X9WkKxJATSe6FKsEf8
iDMAoILZjEMrBBNQjaIhMmdqAZx5zQxp
=x8Ub
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
