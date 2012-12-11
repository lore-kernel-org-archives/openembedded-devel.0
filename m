Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiLHg-0005Fv-C0
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 09:33:50 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so2074721wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 00:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OT+j4IrXmFaZ3jvPf44/MMGyjknOed2pLVx+yjWY4Oo=;
	b=fqUM0B00QjrtUOYC0OCKNmsAnXL1ONsvyuhGrzJy+nDbXftNOiCs/eCSvgMqg3Qut6
	Sj29X0AXnFxTtkG6efFIHSF5n4JUuryA34XW9TFvOkZEN8MUCwvLqjf1/ZJsuEeeLp9P
	3Gi1Vuxudix+NP+7noUk0HJDCeWF3CTd+xF9HsBaEPHmuSLF8dxChrjhJT1+FNbA9su9
	69vwMeP3vEbQMfT6vidIfV8ebfC0vhFNckVe0Ukit16Gqx7x5pYomDMd4uNKVKQD/l3L
	DptqrS9Y/F8S7cANEM7U4WWitV8FvHsMvTjyZEeD/owPWdLXgeUTBr4RTOuG2JpV9LRm
	rYUw==
Received: by 10.216.216.77 with SMTP id f55mr6343342wep.210.1355213956613;
	Tue, 11 Dec 2012 00:19:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y3sm13286941wix.6.2012.12.11.00.19.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 00:19:16 -0800 (PST)
Date: Tue, 11 Dec 2012 09:19:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121211081930.GA4841@jama.jama.net>
References: <1355137229-16062-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1355137229-16062-1-git-send-email-andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH] lighttpd: Sync bbappend version with the one from oe-core
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
X-List-Received-Date: Tue, 11 Dec 2012 08:33:50 -0000
X-Groupsio-MsgNum: 42076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 01:00:29PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../lighttpd/lighttpd_1.4.31.bbappend              |   10 ----------
>  .../lighttpd/lighttpd_1.4.32.bbappend              |   10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lightt=
pd_1.4.31.bbappend
>  create mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/lightt=
pd_1.4.32.bbappend

Looks the same as
http://patchwork.openembedded.org/patch/40585/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDG7JIACgkQN1Ujt2V2gByUuACeL9uq3SV0/EADRX4C51z7EaRi
u9QAn0vhNksmMmVD07+/N2Nc0p2DZVq+
=rir2
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
