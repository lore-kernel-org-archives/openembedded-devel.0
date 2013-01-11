Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtmdX-0005Xp-Qw
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 22:59:40 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so953333dak.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=naL2zHFWVZS8RRnxxMEAt4wlg2rfe9Dvj4OOC3CrGjE=;
	b=MSxDVfBgnrVGJWBSSgLtZtyZcbSiCETLlRER0mgdF889+P8x9nloHoND0umvyvlpYP
	46gayA3uqnC76RIX3I47EtPw6Wq2vw6c4Fdf3wH/+LAedmtnpY2BP7i1vVN1Wx9jdnwZ
	FQSe1mzlqwAElr/AnZIX6mQynOu2jjVWt0zh9md3rwzdbP70Gw98o2U1IFbuaQxmAAK2
	cWpeuUSrYpo5UBscXNhkZAjea6ysBpfhXIs/PWgBj5tl8OOjGNpyFH+mX7RpsRgNr0Ar
	q2bHtY9HHN2NAFqqbboGA//x5LZHOuwf11F9RSuJQ+m290HefsFrvsZjrhlrYHqDgh2i
	M/dw==
X-Received: by 10.68.138.229 with SMTP id qt5mr229054257pbb.122.1357940663791; 
	Fri, 11 Jan 2013 13:44:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qt2sm3416314pbb.24.2013.01.11.13.44.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 13:44:22 -0800 (PST)
Date: Fri, 11 Jan 2013 22:44:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130111214432.GE3781@jama.palm1.palmone.com>
References: <20130109101304.99AC11033F@opal>
MIME-Version: 1.0
In-Reply-To: <20130109101304.99AC11033F@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Khem Raj : autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Fri, 11 Jan 2013 21:59:47 -0000
X-Groupsio-MsgNum: 42670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline

--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 10:13:04AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 4c735f36f64476320c130ffe14a5c831f65b9c42
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D4c735f36f64476320c130ffe14a5c831f65b9c42
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sat Jan  5 19:53:10 2013 -0800
>=20
> autofs: Add recipes for 5.0.7
>=20
> Forward port from OE classic
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

There is small QA issue with this patch:
autofs-5.0.7: autofs: Files/directories were installed but not shipped
  /run

Can you please fix it?

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDwh8AACgkQN1Ujt2V2gByALACfXgBkN7ukXvDFNCJE3HcxGt1V
qdkAoI2ACUDUqgTfDrLwZscYzjP5vOuH
=Qlfn
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--
