Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbXSV-0006KS-6B
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 15:08:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4522021eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xBnOI0olVXYZRyPokxtAjPmA7zNSk+1Fld/4bGUTGcc=;
	b=dcTPQNJFbl3olgcqVyS7BGd8ju+F9rD0Xaf4EWDP7+dnNaRs1M2GJZpLqM313HPWBQ
	fcbZPadiGjbfize4i5xYg+E2DgiJ0BHsvbJ9zLfyHv/uBjCmOYgfqdGg++FdcfvzEJl2
	jJY2/okHljvKT+/Z/GRAAk/SVA/28MiMnqgXQrBqWN41Exy6UYflLHV+6pn/AjDL5N93
	NSdbGa4mFYntW3Wbv/NwLFOuRzOpq5o1oIw38y8LrWcw1PrdgZwxdsjmJ3nmryWuEy4T
	NREaFHSEj0z1x0MJ/MMePhjZdLeNIPD/0aatfE39mYQITbqYrlxjkHhOndgVQo5sGkBy
	wAbA==
Received: by 10.14.216.193 with SMTP id g41mr1651118eep.37.1353592485027;
	Thu, 22 Nov 2012 05:54:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 2sm7074291eef.17.2012.11.22.05.54.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 05:54:44 -0800 (PST)
Date: Thu, 22 Nov 2012 14:54:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122135442.GD12637@jama.jama.net>
References: <50AE2633.1030006@nedap.com> <20121122133125.GC12637@jama.jama.net>
	<50AE2A59.4090802@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50AE2A59.4090802@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: kernel image
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
X-List-Received-Date: Thu, 22 Nov 2012 14:08:56 -0000
X-Groupsio-MsgNum: 41641
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mfP1iJBimQeSOP+4"
Content-Disposition: inline

--mfP1iJBimQeSOP+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 02:36:25PM +0100, Jaap de Jong wrote:
>=20
> On 11/22/2012 02:31 PM, Martin Jansa wrote:
> > On Thu, Nov 22, 2012 at 02:18:43PM +0100, Jaap de Jong wrote:
> >> Hi,
> >> does anyone know where the + (in
> >> kernel-2.6.35.14+_2.6.35-r14.6_mymachine.ipk) is added?
> >> It is added on my pc (running ubuntu); it is not added on my debian
> >> buildserver.
> > Check if you have oe-core 56fe5300
> I'm using oe-classic for this...

Then apply it in oe-classic kernel.bbclass or your recipe.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mfP1iJBimQeSOP+4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuLqIACgkQN1Ujt2V2gBwMLACgiv2svd018mngdFQrQK8O7H7/
0tUAnRFxOYPLK4ukbuk07irHetBzNyu9
=FnQf
-----END PGP SIGNATURE-----

--mfP1iJBimQeSOP+4--
