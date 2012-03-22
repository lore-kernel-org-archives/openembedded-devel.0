Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAf4g-0008Da-BV
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:16:54 +0100
Received: by wibhj13 with SMTP id hj13so445086wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G11rB303DV0mLVn8ZoNc90ftLOoun53zn2I6SEsDxBg=;
	b=BHNGc+Bui0Y18Gdg/ImnH+fj5ld73BV31Da5WScojGxhks2kVCVecb15gMq52WeBRm
	mqAkIs2Y10vdQhRAqL5zC4ngFZ3xTTRSyevzC6ONTVvhVuTgryb7WkPZbS9+tmk9jUNj
	3ibHRQaHUBSZwavch/ngjm8dFbBWdRHLwYuVOe+x4zBlsi7ns9tajVjzY3ozqMDdDi7O
	P620f4n0EZFKQuc/PnwY4vxzdTjz1FiZ7MQhl9E5t4370zzk6XFARqQ5i9RdPKLbVnzC
	emRk4tFCIuiaW7ekL3VFs80IUl0up8ZqqmEtA4lN8VU733ZbpwEuFvH8unIEsOiinaJv
	ZL1A==
Received: by 10.180.96.228 with SMTP id dv4mr3534664wib.14.1332410879638;
	Thu, 22 Mar 2012 03:07:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm6987440wib.4.2012.03.22.03.07.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 03:07:58 -0700 (PDT)
Date: Thu, 22 Mar 2012 11:07:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322100758.GG4010@jama.jama.net>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:16:54 -0000
X-Groupsio-MsgNum: 37911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline

--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Why not move them?

Or create stub of meta-toolchain in 1st patch for people to add it to
bblayers and then move it in 2nd.

If it was copied just that people doesn't have to=20
update bblayers at the same time as git pull from meta-oe.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9q+f4ACgkQN1Ujt2V2gBw8fQCePOwY0LxXHv8a8hv6G5DgF7Dz
jLwAnimJ9RwM3/15F5jTXOwSuHu+sBxT
=w0oO
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
