Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TRKGw-00026u-2t; Thu, 25 Oct 2012 12:02:42 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so1233051wib.6
	for <multiple recipients>; Thu, 25 Oct 2012 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XxoVIaeMzr5mTXSxpmMhPPLVckjyhyHflv70ooX1IJI=;
	b=U92CBTbv4bS4SY/6tz8b0XBLuQywGBzuZAUAAAG3sPq6A6ruyPxiUhmmm2L0CNTe9q
	m7V/vq30XLjHMOXANaNTTFGfTHYBFNxA5jQdD+mBiRHGj588CukEZjLjWOl6n7I0/1tD
	+NEaM7QEPdFUSc12qA5Et+FgPkpeJk28QhEfsQuFVlfA99OZsFrShRk31Zi8q6u6fhEW
	gjl1EKrjp3/06To5pwCP7TO/vsXXmw17AaLnU3aKQYjk7BzvGVWjaqtI4KvkLer77aED
	Szuowu6BrN6XMMLz1R1rRwxLRywFUtRS9/zOLkfRvMjpBDzEfZgksfSKh2S6DGg5iIG0
	fXbg==
Received: by 10.180.106.9 with SMTP id gq9mr12532278wib.12.1351158553563;
	Thu, 25 Oct 2012 02:49:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm9100118wiv.11.2012.10.25.02.49.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 02:49:12 -0700 (PDT)
Date: Thu, 25 Oct 2012 11:49:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121025094931.GM3269@jama.jama.net>
References: <20121024063014.5A42E10338@opal>
	<20121025072005.GL3269@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121025072005.GL3269@jama.jama.net>
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
X-List-Received-Date: Thu, 25 Oct 2012 10:02:42 -0000
X-Groupsio-MsgNum: 41284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bEAlbH1hodbw2omC"
Content-Disposition: inline

--bEAlbH1hodbw2omC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2012 at 09:20:05AM +0200, Martin Jansa wrote:
> On Wed, Oct 24, 2012 at 06:30:14AM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: be304441d8a63df14d91c2c8ee79aa126f87d74a
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3Dbe304441d8a63df14d91c2c8ee79aa126f87d74a
> >=20
> > Author: Otavio Salvador <otavio@ossystems.com.br>
> > Date:   Tue Oct 23 19:25:05 2012 +0000
> >=20
> > samba: update to version 3.6.8
> >=20
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Hmm, here it fails to patch:
>=20
> Applying patch documentation2.patch
> patching file docs-xml/manpages-3/nmbd.8.xml
> patching file docs-xml/manpages-3/samba.7.xml
> patching file docs-xml/manpages-3/smb.conf.5.xml
> patching file docs-xml/manpages-3/smbd.8.xml
> patching file docs-xml/using_samba/appd.xml
> patching file docs-xml/using_samba/ch01.xml
> patching file docs-xml/using_samba/ch07.xml
> patching file docs/htmldocs/manpages/nmbd.8.html
> patching file docs/htmldocs/manpages/samba.7.html
> patching file docs/htmldocs/manpages/smb.conf.5.html
> patching file docs/htmldocs/manpages/smbd.8.html
> patching file docs/manpages/nmbd.8
> patching file docs/manpages/samba.7
> patching file docs/manpages/smb.conf.5
> patching file docs/manpages/smbd.8
> patching file examples/tridge/smb.conf
> patching file swat/lang/tr/help/welcome.html
> Hunk #1 FAILED at 40.
> Hunk #2 succeeded at 66 with fuzz 2.
> 1 out of 2 hunks FAILED -- rejects in file swat/lang/tr/help/welcome.html
> Patch documentation2.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: /OE/jansa-test/shr-core/tmp-eglibc/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/samba-3.6.8-r0/temp/log.do_patch.23000
> NOTE: recipe samba-3.6.8-r0: task do_patch: Failed

This one is caused by non-ascii characters (probably mangled by
patchwork) and I have patch for this in jansa/pull, but there is also:

ERROR: Command Error: exit status: 1  Output:
Applying patch waf-as-source.patch
patching file buildtools/README
patching file buildtools/bin/README
patching file buildtools/bin/waf-svn
File buildtools/bin/waf-svn is not empty after patch; not deleting

waf-as-source.patch:
diff --git a/buildtools/bin/waf-svn b/buildtools/bin/waf-svn
deleted file mode 100755
index 6d54d5f..0000000
Binary files a/buildtools/bin/waf-svn and /dev/null differ

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bEAlbH1hodbw2omC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCJCysACgkQN1Ujt2V2gBz1dQCfY9KE0pP/HpiTW1YdpcaBTJOR
Xt8AoJsfKcC/10bqqWX+rG8++qcodrJm
=OdlP
-----END PGP SIGNATURE-----

--bEAlbH1hodbw2omC--
