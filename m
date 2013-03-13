Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFoeE-0006qb-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:35:30 +0100
Received: by mail-gh0-f180.google.com with SMTP id f13so198516ghb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PYX9l1ABDFvraTTRHJHvXB+agdeZ6dYQTqrhdGlJyG4=;
	b=sgFMJsPR5W7ex0ztOZrjXkBS46Q76g47+yOxnJsitBcD7zurfTVbRj+LRP//yzSszx
	zA0xt45gn9OqyeSCEsIlDRYu5W8bBykGXXHqLQ+SdS+RJsu3LkKUkXiEG5iZpPENGXMN
	J6egwnGcMpiwDHQ7uYNZ5D0rXAgk6zKkJIYsclFj8mrCm8BDErbbBONLR5zwNB2AGb3a
	36YrwFroCNfcbxFogPwpp2CW+cn8F4/pc1jNlRGUIDQq+XQK8LAzrhx+MfD75AwnkGps
	73XM9vMd/YCZR/5QaJc7A5chWeaoOQ3EGLo+xWEgak1AL9aj9PtrhqGX5W4SNjGBwIE1
	35Og==
X-Received: by 10.236.84.52 with SMTP id r40mr16310231yhe.94.1363191525741;
	Wed, 13 Mar 2013 09:18:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l24sm36210478yhc.15.2013.03.13.09.18.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:18:44 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:18:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313161837.GL3260@jama>
References: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-xfce/meta-gnome 0/4] updates/bugfix-world
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
X-List-Received-Date: Wed, 13 Mar 2013 16:35:44 -0000
X-Groupsio-MsgNum: 43522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PpocKf6TCvdC9BKE"
Content-Disposition: inline

--PpocKf6TCvdC9BKE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 12:43:29PM +0100, Andreas M=FCller wrote:
> The following changes since commit 230e2171d07815f51d5b6d044627afa0ff13c5=
d4:
>=20
>   gpsd: fix udev rules file (2013-03-06 06:05:35 +0100)

Merged, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PpocKf6TCvdC9BKE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFApt0ACgkQN1Ujt2V2gBxlJQCdH8SF0NU6AfPn0KIBK+8gGw0y
X3kAnA8NU+gsv8IWYlltpSEjVOQNzWvg
=Cv8h
-----END PGP SIGNATURE-----

--PpocKf6TCvdC9BKE--
