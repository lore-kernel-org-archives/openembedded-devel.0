Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MKMS4-00078Y-KH
	for openembedded-devel@openembedded.org; Sat, 27 Jun 2009 03:11:32 +0200
Received: by rv-out-0708.google.com with SMTP id k29so802996rvb.0
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Jun 2009 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=piEXE3xLuUMzb6xYkl/4NppRqCk8Hykn3TxmsLsYvag=;
	b=PkaC8Azcjetx3pI1C4ojzfwx97xwJB97k7jZ+vko6T8lFngFn38YhKdbF2J/6RoCFe
	IvCniGoqWXeMNrtCMH0oW2k5C989FZnpaGUhZ/2XALp8Z1W6EvhqscGwQuzL7hJQMMtR
	wLpuXGQgWnP7TFDXIwSIgNlNJwAjlGwoz+/l8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:message-id;
	b=Oecs1E1JCurHxPJfC9E4pTlphFXQh6V6xYRX9Gaeyk1QOfXcW2QeG+nPuzbpxN2plv
	IQcMGegYV+6XZkqZKtQdEe9HsodJ+08nZ4Hf431q1GcbaSWyXSpUWah6WlE0CvHRDJ24
	DUnQFBJIG11e4sQ/be2ShEvi+0L2UpMPYdGTc=
Received: by 10.141.13.13 with SMTP id q13mr3535282rvi.170.1246064406031;
	Fri, 26 Jun 2009 18:00:06 -0700 (PDT)
Received: from morpheus (adsl-71-146-23-253.dsl.pltn13.sbcglobal.net
	[71.146.23.253])
	by mx.google.com with ESMTPS id c20sm16960127rvf.49.2009.06.26.18.00.05
	(version=SSLv3 cipher=RC4-MD5); Fri, 26 Jun 2009 18:00:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Home Inc.
To: Matteo Fortini <matteo.fortini@mta.it>
Date: Fri, 26 Jun 2009 17:59:50 -0700
User-Agent: KMail/1.11.90 (Linux/2.6.28-13-generic; KDE/4.2.90; x86_64; ; )
References: <4A365C10.8020307@mta.it> <200906172309.40571.raj.khem@gmail.com>
	<4A3A5A84.6090602@mta.it>
In-Reply-To: <4A3A5A84.6090602@mta.it>
MIME-Version: 1.0
Message-Id: <200906261759.56663.raj.khem@gmail.com>
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Sat, 27 Jun 2009 01:11:35 -0000
X-Groupsio-MsgNum: 11653
Content-Type: multipart/signed; boundary="nextPart1520491.pmeQJIZrFz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1520491.pmeQJIZrFz
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thursday 18 June 2009 08:17:24 am Matteo Fortini wrote:
> Here it is

Thanks. It might be problem in install section of our recipes.
Can you post log.do_compile file=20

Thx

=2DKhem

--nextPart1520491.pmeQJIZrFz
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEABECAAYFAkpFbwcACgkQHnJKy6V6em4/wgCeNpeBKYQ+R3ZAEkPd6OBnBFs/
EXQAmL0RhugkRn6k4VgoSAJqQqSbVgE=
=ELez
-----END PGP SIGNATURE-----

--nextPart1520491.pmeQJIZrFz--
