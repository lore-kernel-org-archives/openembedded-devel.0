Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F83E7021D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 16:04:30 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so1076265wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 09:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JbDrC90S3qVDfpYf6PTFi0zvplbi6Dg61RjpHDPXZG4=;
	b=Oc8Ve62Q3oF2EaAm30O2AyIvYZn45ecXeTVvnfLFXbH0iGTPtb3NNC/9qhSwmQQV4R
	m0Kyg2RE7nN8XYeHiFUoFhKaPzq5QXJdMZZKr6aj6HREzFE7/5UNUf3tBwOqjDoscV9U
	NS0WCrrx/c+DhIuTmz7TSy/WkSpwHIQwsRudQiGR46zd+bL+5i6UNDFX2MMJ4sAFZbbs
	13WdKQ7bB6Z824XwPrIw6gnL+IOXv6kAurj9KlZy0XNsHXUMh9sdZsFPApKdKn9QaGZm
	Sl43eQsQSoKmSJRdvGElyzQjNjhkEC21lPuMPIyI3zorGcwchieuXRJLUjDUfSJZ6Un1
	4M/w==
X-Received: by 10.194.216.162 with SMTP id or2mr5709502wjc.0.1403280270633;
	Fri, 20 Jun 2014 09:04:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o12sm5909583wiw.5.2014.06.20.09.04.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 09:04:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Jun 2014 18:04:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140620160431.GY2117@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Fri, 20 Jun 2014 16:04:35 -0000
X-Groupsio-MsgNum: 50481
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yhqQ34TVR4fE8mPU"
Content-Disposition: inline

--yhqQ34TVR4fE8mPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2a=
cf:
>=20
>   python-efl: add dependency on python-dbus and lua to always build
> edje and elementary bindings (2014-05-12 10:08:28 +0200)
>=20
> are available in the git repository at:
>=20
>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
>=20
> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
>=20
>   live555: fix fetch problem (2014-06-18 13:42:35 -0400)

BTW: there is daisy bundle on patchwork:
http://patchwork.openembedded.org/bundle/jama/daisy/?archive=3Dboth

When I notice some patch in queue marked as for daisy or requesting
backport in text I move it to bundle (and mark it as archived)

Would be great if one of you keeps an eye on this bundle and sort the
patches there (they usually aren't marked as applied automatically and
you need to do it manually).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yhqQ34TVR4fE8mPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOkW48ACgkQN1Ujt2V2gByS/wCeKElJQvpY4PW7umZUJP2OojwR
p3MAn1JTKjGMIS+RN3S46FQDfk7zO3W+
=fZWN
-----END PGP SIGNATURE-----

--yhqQ34TVR4fE8mPU--
