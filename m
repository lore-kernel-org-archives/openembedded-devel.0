Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DACB86067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 13:52:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so2127394wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wZZ9PrgYh2DhBvT0pFDGH0M5abQvU+Lx9xdzuGOduaY=;
	b=l77V7R9feZ0+MCEHVQOjaiRg9nJUqgR0jZI8HcNmxQa85qDj51G8/KacXlqIIDhEc2
	td4D9OEDEYEQjPNH647PE6oQzeBhYl0oW2UAIEr7uUplrLB8OXYuVz913/ydCs7Ea9/r
	BDrj7BeijL65mRSnPujwgY6ua/RCDTTMEisarblPdD6Jd7kvlHGEvwdXItWgZEUyphLB
	rjLiSS/7x/5c9Nih52FM+3O6SeEPbt25FcbZK6ZVdOrwVAlQIMtidW9Ka0eYy8SWMZd7
	KvKRpLcAmhdhQkPsQaV4fuD41Fssm52VQ7/xxHf/LhSvAieBi9tGr0fiQbunaw7EN6fh
	LoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wZZ9PrgYh2DhBvT0pFDGH0M5abQvU+Lx9xdzuGOduaY=;
	b=WnFnm/vFlzV5iuWgQwEACUPS4JE3OHX7tRQQph0yxsrJR/EvEYn79xdVJxF9shKyWM
	rWctoPss8pWS3tKQSvOK6tuQNhxmt9HH82gJElB68YB6+n2XOyqUBihbIYsorCpn5A+S
	vqG3C84iJvrxzK4RhVvQuPDF1tyAoCZJwbzoHt+EclLyAjxlo6jPtqDWAekIY1V6zxVS
	5wpfwIfcTbuI/76wLnW+NsLKq45ObQmzbkwyY37T1b6WNy/FG4jToJl7lLa9mwsAu3KN
	EqFfw4KPWjnGGTLuM+HR0MUG2mCNAmvJqr5CqLLYb/0w+3vkAZLvocLi3+sbIkF/aeeN
	vmUg==
X-Gm-Message-State: ALyK8tJMg9r3/VScLAeOBlQ34obH7v7OFNp+cy/gLdtQUSoklQsvwIfGKkVFecqKH0X/WA==
X-Received: by 10.28.176.7 with SMTP id z7mr3604028wme.17.1468331560578;
	Tue, 12 Jul 2016 06:52:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id e69sm693368wma.2.2016.07.12.06.52.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jul 2016 06:52:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Jul 2016 15:52:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160712135247.w2bcuhgvtlvyr3hk@jama>
References: <1467976306-4442-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1467976306-4442-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] poco: update to 1.7.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2016 13:52:41 -0000
X-Groupsio-MsgNum: 62132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xmxwl5jakr7f4pk4"
Content-Disposition: inline

--xmxwl5jakr7f4pk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 01:11:46PM +0200, Pascal Bach wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-support/poco/{poco_1.7.1.bb =3D> poco_1.7.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/poco/{poco_1.7.1.bb =3D> poco_1.7.3.bb} (=
96%)
>=20
> diff --git a/meta-oe/recipes-support/poco/poco_1.7.1.bb b/meta-oe/recipes=
-support/poco/poco_1.7.3.bb
> similarity index 96%
> rename from meta-oe/recipes-support/poco/poco_1.7.1.bb
> rename to meta-oe/recipes-support/poco/poco_1.7.3.bb
> index 135d2aa..75e0997 100644
> --- a/meta-oe/recipes-support/poco/poco_1.7.1.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.7.3.bb
> @@ -17,8 +17,8 @@ SRC_URI =3D " \
>      file://run-ptest \
>     "
> =20
> -SRC_URI[md5sum] =3D "a4b755d47303b20a0e2586f281d05a36"
> -SRC_URI[sha256sum] =3D "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd=
04d8e9a2b2d15c05"
> +SRC_URI[md5sum] =3D "6b979d7d9c1751c2e063338cb5ea8977"
> +SRC_URI[sha256sum] =3D "af75f279c9eac35b39fc998d8d20dc45d5bef91eb75851ff=
99d948ca128c7740"

Don't use github archives which don't have stable checksums, this fails
again the same as I've reported when you sent this change last time.

>  S =3D "${WORKDIR}/poco-poco-${PV}-release"
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xmxwl5jakr7f4pk4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleE9i4ACgkQN1Ujt2V2gBz93gCghXXl7Af69HQrLZl1ZrDlQ1E+
hKUAn3oluGguLEjFihG/60AhLGmbUWtU
=0GcN
-----END PGP SIGNATURE-----

--xmxwl5jakr7f4pk4--
