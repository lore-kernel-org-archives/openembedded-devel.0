Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C57165D47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:06:28 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2851592eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CFGY5h28FL3uihjJim43Fpt76qWu3rXMiHs4OWpYMk8=;
	b=TOBO10Qf53SpGU1U49b6HhHhdkTUkvimMDUqFod0Pb6rJx0BVQfJl4QSOQLMUnHb1q
	fArtf9JV0OTuWoOmQkDsLPDaqSHsVGTYATTVK3WtMAByYfP7aKMNpO+NvX5MjffqhIGz
	2Wm2syq1x2s+kRn2+EKPhbrek8qIMiDFlWGGvIixkgTnF4L/KqLKKSrAcr/9HRSLqyaD
	QREZeH+PRbo/TzMvKz0gLdu82sDkJ3Ji0AQQkoszOYBiTi+lE8tGJ0vQ7WXkDKe3FKOE
	/86/rRxLvzYLQH4Cf2p3iiz9xxI7lZj67nTFLnnPQQmTG3XcQ9X4AFojXhopBpq693/A
	uaDQ==
X-Received: by 10.15.32.206 with SMTP id a54mr36995779eev.51.1397984789807;
	Sun, 20 Apr 2014 02:06:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm92856313eew.25.2014.04.20.02.06.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:06:28 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:06:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420090633.GR2486@jama>
References: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 1/2] gd: added upstream license file and fixed configure warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 09:06:29 -0000
X-Groupsio-MsgNum: 49299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ZpWocbG2H/Vq+uQ"
Content-Disposition: inline

--0ZpWocbG2H/Vq+uQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 01, 2014 at 08:47:44PM -0700, Stephen Arnold wrote:
> This fixes QA warnings about missing license file and stale configure options,
> (includes updates for freetype libpath and disables hardcoded rpaths).

Merged thanks!

Please check
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095288.html

--0ZpWocbG2H/Vq+uQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTjhkACgkQN1Ujt2V2gBw8XQCeIMVZmnrnAQSJY8hLT9HyhXRj
4SoAn25aE2ZZ0Z1tpXtr49NmGFlo6MAA
=hphl
-----END PGP SIGNATURE-----

--0ZpWocbG2H/Vq+uQ--
