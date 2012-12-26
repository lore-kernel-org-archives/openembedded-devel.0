Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TnowX-00027N-MG
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 12:14:49 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so3402871eaa.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 02:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2sHne1jmL8d0ZHYgor4qmX1Cu3myFghY2rKT9dUfnC0=;
	b=AO97KfsqZbcbcrlBsPnBJRi3/6pXOm+dDHE6e1ZJVElbmYYWU4rM9NkC19MUQ6HBMW
	XI4jJ+b88wn1R1wH64uvdO0HjrwZXMwLTIilBtPZ0dn7Ki3vtuUPyLTNAsH7oYPR18JG
	OG62X5Or4PkU1BF3ipn26uf2fPVQJ+EbgRo0rnrUIiiVYpvg1TDT9njwbV43maZgmlHI
	zPEL3bCxNZykJvERCxVA4bwmuN1wCYClp1axrIc+XFLd++C+56RXaqOIk8RI5cNK43Rz
	J6ywPNxLsmf+tpll2Ueu313Vok282zyWprik4PKI/b91H1bLD3huMS6U6EflPkp+tKor
	EqCQ==
X-Received: by 10.14.194.195 with SMTP id m43mr69440713een.44.1356519585348;
	Wed, 26 Dec 2012 02:59:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm52480674eeo.8.2012.12.26.02.59.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 02:59:44 -0800 (PST)
Date: Wed, 26 Dec 2012 11:59:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121226105945.GZ8988@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20121225085616.GV8988@jama.palm1.palmone.com>
	<2471810.EZLSW9fpny@helios>
MIME-Version: 1.0
In-Reply-To: <2471810.EZLSW9fpny@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Wed, 26 Dec 2012 11:14:49 -0000
X-Groupsio-MsgNum: 42414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FhvelBhrd33NvMcY"
Content-Disposition: inline

--FhvelBhrd33NvMcY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 25, 2012 at 08:04:01PM +0000, Paul Eggleton wrote:
> On Tuesday 25 December 2012 09:56:16 Martin Jansa wrote:
> > And few more issues when building without usable MIRRORs/PREMIRRORs:
> > meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
>=20
> Are you sure this one wasn't transient? I just tried fetching it directly=
 and=20
> it worked...

You're right, it failed few times yesterday, but today it fetched ok.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FhvelBhrd33NvMcY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDa2KEACgkQN1Ujt2V2gByFiACgpfXtNHf/ZxYiBZbSyc+lo2au
vQUAnRpXN3X+GOHg0rXgo13rsGbhRvOO
=qw/B
-----END PGP SIGNATURE-----

--FhvelBhrd33NvMcY--
