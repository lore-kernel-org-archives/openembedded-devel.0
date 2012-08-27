Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T689q-0002uH-K1
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 00:51:46 +0200
Received: by daks35 with SMTP id s35so3069398dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=FYrQo2sdh74dtxamrxzFA+h3DhTXS7bJRTgfzsiFYoU=;
	b=SiauYfIB7r1cE5P9IabHT9cZhKSDeu1ZlUOAGi5t6OHASnboeCkxr8KnL14KRXsiG3
	lzhWXUZwlxj1a5oeKjy0zxnUfDGSKmoiHae4W1qMlNg+BZSyXQLqX9woEyjQNl8QJis0
	w7wkbPdAOefzFXbYFghm9iKpL5Gp3Le+SEArU2baJ8LiQdlWs+j2uCs7qwXx+wwJ8IJp
	UeX1EyQF0WKxFD9KU5nVu6e5Wa2KDxg3EGPM2h+wEDa7chdtQA+rG2H6c2EA4/ePKxlP
	SXY3DcFLwA6M0qFUjbRSuIsVXAJIsiYehBNuzbHgDmh3c52dz2RVhkUY7ZWB9ezi+1Lp
	zRFQ==
Received: by 10.66.88.198 with SMTP id bi6mr33320004pab.23.1346107173760;
	Mon, 27 Aug 2012 15:39:33 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:b13c:8d38:d301:48e3])
	by mx.google.com with ESMTPS id st6sm15557147pbc.58.2012.08.27.15.39.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 15:39:33 -0700 (PDT)
Date: Mon, 27 Aug 2012 15:39:35 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120827223935.GK24666@bill-the-cat>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 1/5] libwnck: Fix build without needing introspection-native
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
X-List-Received-Date: Mon, 27 Aug 2012 22:51:46 -0000
X-Groupsio-MsgNum: 40376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 10:57:01PM -0700, Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Along with the rest of the series, applied, thanks.

--=20
Tom

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlA79ycACgkQdZngf2G4WwMNggCgkCQ1ETpHxAySbxZfeOduKBpz
wlwAnRv0tlX8KUQEpPQY3cSQefAwVIy4
=PUS8
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
