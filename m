Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdJBt-00049o-Df
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 12:19:01 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4698125eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=psI5XF0yCqSSPnWO5vbypy4u1a/ZSYcUL+DLeoor1eo=;
	b=Sup1avJnwDW+O6PbFAGz/kSzmyn50PkQJWUf5QvkFTgw1XJiafoY/LIonvK4R2unw3
	NGgetNYCFMKkTCFwGh6khlhgW9F7BhpWFhyC9SdueqSj1RUxRkSW/7SfUY5Q28RLfbub
	KSjnpHbNusSFrkYk7TCzv878SHc52lHCBsNcxDsNwnhU1n1uWlnzctQ94X2OHBDgLV2V
	HbPKfuwO2XgidN60VnOX3s3kkadcYDfDiv9Nj1ux4JWuq94L5Xg+NNEfIBNqdmIaNvax
	IKk09jq/0e/Kq6RePbPcUEsvxPCmfHmZecYh+3ANLreo9RaB9OfXc+9WSR3R3+ZNLqan
	WJhg==
Received: by 10.14.182.70 with SMTP id n46mr56766897eem.5.1354014288589;
	Tue, 27 Nov 2012 03:04:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d44sm40045026eeo.10.2012.11.27.03.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 03:04:47 -0800 (PST)
Date: Tue, 27 Nov 2012 12:04:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121127110442.GA3692@jama.jama.net>
References: <1353947056-2799-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1353947056-2799-1-git-send-email-andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH] dhcp: Sync bbappend version with the one from oe-core
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
X-List-Received-Date: Tue, 27 Nov 2012 11:19:01 -0000
X-Groupsio-MsgNum: 41734
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 06:24:16PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../dhcp/dhcp_4.2.4-P1.bbappend                    |   13 -------------
>  .../dhcp/dhcp_4.2.4-P2.bbappend                    |   13 +++++++++++++
>  2 files changed, 13 insertions(+), 13 deletions(-)
>  delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4=
=2E2.4-P1.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4=
=2E2.4-P2.bbappend

Looks the same as:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/04244=
8.html

except sent without -M and not moving to oe-core prefix like mine does.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC0nkoACgkQN1Ujt2V2gBz/rACfY18g1Rcq5oK8sQ+Qo6YBBEmP
jx8Ani/O9dfjdE+FhN4NgGf16mPYehLw
=939w
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
