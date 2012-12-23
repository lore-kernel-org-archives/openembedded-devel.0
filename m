Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmrj4-0001jV-VF
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:00:47 +0100
Received: by mail-ee0-f45.google.com with SMTP id d49so3221248eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 11:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J94LZoGwmsAPl2B/mkGPp6pw3e+wiOarJA0rnBST6wo=;
	b=VEypOF/kW1Ahf+GhS6f0u8yeBBC6RTZRWWb8GogbCwoS43I8EMXAlVWLv6/RQr0SOe
	CX3z3PqXyEmalxAbc+Fq+P7YB2Yzyu5CT8LQZzVMz5zDISu9H36PSkaGi4r5z/i3zPB3
	fzQ3CzGE2Azffqs5LP50cSjy6aWaoj1Mxvt2V9xDNgWun/Tj+Yb50ZgF0+TivOp9CAL7
	EtZKUkj7vg84KIpYBxBYER7PJ8x9VIelWPACWETGYwg9lPdmfYeheBAm0LApFVbs2CCI
	vkUI9CyQ4GnKJklnh5nv1G5u1CsDS7CwRbwpWGNkOC3aJFLBT66uHFIoJyrAD2YaQeW+
	Y1zQ==
X-Received: by 10.14.215.194 with SMTP id e42mr50080992eep.32.1356291958230;
	Sun, 23 Dec 2012 11:45:58 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm36707302eeo.11.2012.12.23.11.45.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 11:45:57 -0800 (PST)
Date: Sun, 23 Dec 2012 20:45:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121223194558.GL8988@jama.palm1.palmone.com>
References: <kb31gs$u4d$1@ger.gmane.org>
 <3053324.FGHdgGAGGN@helios>
MIME-Version: 1.0
In-Reply-To: <3053324.FGHdgGAGGN@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Ruby and meta-oe?
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
X-List-Received-Date: Sun, 23 Dec 2012 20:00:47 -0000
X-Groupsio-MsgNum: 42382
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jl+DbTnyraiZ/loT"
Content-Disposition: inline

--Jl+DbTnyraiZ/loT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 07:40:51PM +0000, Paul Eggleton wrote:
> On Saturday 22 December 2012 02:14:07 Koen Kooi wrote:
> > What's the status on getting ruby recipes into a meta-ruby or meta-oe? I
> > just had to import it into my working branch to build mkvtoolnix which =
needs
> > ruby-native for its buildsystem (don't ask).
>=20
> The original author never replied to my suggestion about creating a separ=
ate=20
> layer. Unless there are objections I'd suggest just creating a meta-ruby =
and=20
> using the patches from patchwork to add ruby into it.

Agreed,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Jl+DbTnyraiZ/loT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDXX3YACgkQN1Ujt2V2gBwa0QCcDXin3k4GLcr6RnCB+IUx4Wep
cZAAn178qcyjY+nYI6J2APF+ZApt71Sm
=buO8
-----END PGP SIGNATURE-----

--Jl+DbTnyraiZ/loT--
