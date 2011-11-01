Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLHEW-00030i-3f
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 17:30:40 +0100
Received: by faas16 with SMTP id s16so7411536faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pz52LaFUtbisp64vusrD7kI9cVC6V3Jj7DgeFUgY07Y=;
	b=JohuiH+i5dlVRPY6iCoTVdpEHE4AwFaHytZCvhJVAaoiKeiiGBUC2u6sgbtm0aoeSG
	krdBkNd3UpC6knUTBAYkHUZkVWGq1H79eqMUESSGyMD0c1WN5IKubXAdGS7kM1wqXjCP
	37Q4UgaTku6vj062U3VIlv1IZErAhg4roNyrg=
Received: by 10.223.7.20 with SMTP id b20mr1654039fab.21.1320164670934;
	Tue, 01 Nov 2011 09:24:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y17sm45750340faf.1.2011.11.01.09.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 09:24:29 -0700 (PDT)
Date: Tue, 1 Nov 2011 17:24:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111101162422.GE4714@jama.jama.net>
References: <CAHELjkPJSKOT7Ttv-XQ1wJf+TsSe_V=R4x4BUkntApSnmW-CsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHELjkPJSKOT7Ttv-XQ1wJf+TsSe_V=R4x4BUkntApSnmW-CsQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: guilt-native-0.33-r1: task do_fetch: Failed
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
X-List-Received-Date: Tue, 01 Nov 2011 16:30:40 -0000
X-Groupsio-MsgNum: 35162
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline

--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 09:20:12AM -0700, Neil MacMunn wrote:
> Hello,
> Does anyone have a working mirror for
> http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz?

first link in google:
http://ftp.sunet.se/pub/Linux/kernels/people/jsipek/guilt/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6wHTYACgkQN1Ujt2V2gBz2SQCgmFpp8ZMAKlMctR6A0COx5hJj
T5QAoIkqHCJZ8yvfbCIvserWrb783GVm
=QouP
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
