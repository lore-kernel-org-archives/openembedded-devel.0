Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbXTn-0006RE-Os
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 15:10:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4522653eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6rJx8POKkkv0jqcEBeiYf3eGbQHDqCOUWhHh+QclEU8=;
	b=lvsnRXp6SVmAkgzObjMifHc3ip5BcPU7PeMZn7UPTCeooJD8+ux3IUHHMY+iLZkux3
	JoJ294uz5nuUQW4vmfzTtv7GUgnvAzH9KBL+w2yjt3HNhk+en2HovYvEJzT7WKOmN7wc
	J6Oj7tpOKRRK6HszmT7HXOpcEyqq8/PL7qjRZESIKk4t+FDf+Bww7hd2QxmKmPiBa6cA
	V1ejhTihLoSkdx+jWrAjMXeEnNoJ1CXuT7g43GPHFcHp77G2zPMa+yI4VsN8Z19bv4KC
	eXALW0pOPhw4tXpy+UXI9Pj5clkm22m79QS8GaIqLOlg3R0+dCfm+tLBBxHOmA+Xnlch
	z+yg==
Received: by 10.14.214.2 with SMTP id b2mr1698478eep.32.1353592565718;
	Thu, 22 Nov 2012 05:56:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u45sm992263eep.0.2012.11.22.05.56.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 05:56:05 -0800 (PST)
Date: Thu, 22 Nov 2012 14:56:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122135603.GE12637@jama.jama.net>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
	<20121122105331.GX12637@jama.jama.net>
	<CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRus_-OSess+CaMHD++yPr8xrpRryBjnvr9=jw-6gWYgw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmx.de>
Subject: Re: [meta-efl] should epdfview really be under meta-efl?
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
X-List-Received-Date: Thu, 22 Nov 2012 14:10:11 -0000
X-Groupsio-MsgNum: 41642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eGwqSfc1DN4LzNjY"
Content-Disposition: inline

--eGwqSfc1DN4LzNjY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 02:41:34PM +0100, Andreas M=C3=BCller wrote:
> On Thu, Nov 22, 2012 at 11:53 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
> >> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
> >> purpose or did epdfview end up there
> >> due to it's name similarity to epdf ?
> >
> > I think so, CCing Andreas for confirmation.
> >
> > Cheers,
> >
> > --
> 1. Where should be the new location?
> 2. I have no strong opinion on that - I asked here for the location
> before creating the recipe :)

What about meta-gnome?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eGwqSfc1DN4LzNjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuLvMACgkQN1Ujt2V2gBwroQCfWR7vxBPSG7Zmozxdf4ESXDEC
2UMAoK6LG1qsItsV+8NHPR7+DINH0LR8
=J86Z
-----END PGP SIGNATURE-----

--eGwqSfc1DN4LzNjY--
