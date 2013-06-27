Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 580BB6A8D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 11:33:45 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so336684eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y2AYTFZ7VKrCWIY4Fh6RIT8NzyUBlLs1rkrCx5r9upU=;
	b=KI/9Szp3EcZelBcNmHsApFe527BwkX+i/xC5JzpBY6nMvHXBCjSWeIYhjT1HM6I9uG
	OTr8wORgfUzt2TNr9TtwyElsnv1M6bH+xFWVhf+u+DAe+3z5LCH1w7VN+iZ/JHAlB5Tl
	aJX5GNFEcHop0MjgKyRNwyPEcKM88tuQqG30XJZF5C6mJnIAWf7B8jCNRjMdUEVcCSmg
	b29SYTThniDzqoM1Z6Ta1mPBafWNIjOqORmqNkmIINjOwWlt62i+LOjOFbj13Hq4B9W0
	qz0mEsbTBzF9bu4179TXpRmmAShRFn3VLXchLLwVO6Ih9lnT49en34PKQYe6ym9O13t8
	9NNw==
X-Received: by 10.14.6.198 with SMTP id 46mr8442062een.121.1372332825036;
	Thu, 27 Jun 2013 04:33:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm3243636eeb.13.2013.06.27.04.33.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 04:33:44 -0700 (PDT)
Date: Thu, 27 Jun 2013 13:34:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: =?iso-8859-1?B?S+VyZSBT5HJz?= <kare.sars@wapice.com>
Message-ID: <20130627113423.GE3261@jama>
References: <2050125.1VFN39bD1d@sars-laptop64>
MIME-Version: 1.0
In-Reply-To: <2050125.1VFN39bD1d@sars-laptop64>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: Yocto meta-toolchain-qt5
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
X-List-Received-Date: Thu, 27 Jun 2013 11:33:45 -0000
X-Groupsio-MsgNum: 45228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 02:18:10PM +0300, K=E5re S=E4rs wrote:
> Hi,

Hi,

> Thanks for your work on meta-qt5!
>=20
> Sorry if this is not the right forum for this question...

Always better to add oe-devel to Cc: so maybe someone else will reply.
Added now.

> Are there any Yocto recipes somewhere to generate a toolchain with Qt5 li=
ke=20
> the one for Qt4 (meta-toolchain-qt)?

I'm not aware about anyone working on this, patches are welcome.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHMIz8ACgkQN1Ujt2V2gByBtwCfVQhEmUc9tTW3EX/nVyj2j/4y
+mgAoIhnXpmVVV4krTCXeYEW2GiyTsrC
=6TSz
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
