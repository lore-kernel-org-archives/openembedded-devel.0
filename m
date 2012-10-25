Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TRHwL-00071J-TL; Thu, 25 Oct 2012 09:33:17 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so683839wey.6
	for <multiple recipients>; Thu, 25 Oct 2012 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OAhhwiFKIELdopK1X8e2pvDPjDjKTOcP+KPZFXbdrkA=;
	b=O2sq+gQIjmsW2r5YZsEI7BkMSQZiYx6oLqm/LGuhjz389LEvj7esnc0WNDwSxr80pH
	FfK+lc1g8UJB+WOndMddBA2BEW+/dNLQoR+3lxnJfcpUbrw1daqZrzlCgf88P/1txWNd
	NaO/Gqxz/wZv1/+weQj8I8L0IGsDDOCRJ6H3pCOiol2AhlAivwGFVtxIE7rvapQ5V9+j
	Cr71HXkz5CZoaD80XA7T9R1PDLDbddL5q8uu6u1JxYW+cTOSmboPcEOX+rV0tF68EIHc
	N1SDg8XI6ot/sI3HbO0H+j6pPsJLobfxIwMzz4ToB7d24/48MKUoy6KFi35ZpSPf4D0E
	Jzcw==
Received: by 10.180.100.101 with SMTP id ex5mr8176669wib.16.1351149589432;
	Thu, 25 Oct 2012 00:19:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fp6sm8586290wib.0.2012.10.25.00.19.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 00:19:47 -0700 (PDT)
Date: Thu, 25 Oct 2012 09:20:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121025072005.GL3269@jama.jama.net>
References: <20121024063014.5A42E10338@opal>
MIME-Version: 1.0
In-Reply-To: <20121024063014.5A42E10338@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : samba: update to version 3.6.8
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
X-List-Received-Date: Thu, 25 Oct 2012 07:33:17 -0000
X-Groupsio-MsgNum: 41283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6T2vOV0TokPza8xG"
Content-Disposition: inline

--6T2vOV0TokPza8xG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 06:30:14AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: be304441d8a63df14d91c2c8ee79aa126f87d74a
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dbe304441d8a63df14d91c2c8ee79aa126f87d74a
>=20
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Oct 23 19:25:05 2012 +0000
>=20
> samba: update to version 3.6.8
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Hmm, here it fails to patch:

Applying patch documentation2.patch
patching file docs-xml/manpages-3/nmbd.8.xml
patching file docs-xml/manpages-3/samba.7.xml
patching file docs-xml/manpages-3/smb.conf.5.xml
patching file docs-xml/manpages-3/smbd.8.xml
patching file docs-xml/using_samba/appd.xml
patching file docs-xml/using_samba/ch01.xml
patching file docs-xml/using_samba/ch07.xml
patching file docs/htmldocs/manpages/nmbd.8.html
patching file docs/htmldocs/manpages/samba.7.html
patching file docs/htmldocs/manpages/smb.conf.5.html
patching file docs/htmldocs/manpages/smbd.8.html
patching file docs/manpages/nmbd.8
patching file docs/manpages/samba.7
patching file docs/manpages/smb.conf.5
patching file docs/manpages/smbd.8
patching file examples/tridge/smb.conf
patching file swat/lang/tr/help/welcome.html
Hunk #1 FAILED at 40.
Hunk #2 succeeded at 66 with fuzz 2.
1 out of 2 hunks FAILED -- rejects in file swat/lang/tr/help/welcome.html
Patch documentation2.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /OE/jansa-test/shr-core/tmp-eglibc/wor=
k/armv7a-vfp-neon-oe-linux-gnueabi/samba-3.6.8-r0/temp/log.do_patch.23000
NOTE: recipe samba-3.6.8-r0: task do_patch: Failed


--6T2vOV0TokPza8xG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCI6CUACgkQN1Ujt2V2gBypaQCcD98uFT40z8P/Lr8KwWRnBO30
nt8AnRGgk+FUUydGBzhZtwMihBXVYlyD
=7kjV
-----END PGP SIGNATURE-----

--6T2vOV0TokPza8xG--
