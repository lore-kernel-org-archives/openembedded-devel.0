Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbX5t-0005H9-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 14:45:29 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4509071eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZGGS8wuFZyyO3OROrqRRzvdrWUAlt+1EWfwgrXgDl+E=;
	b=xYoxjJf50MYnY4HTZGqikbMgdbSR8ofUJobyDpiNaArBUryINq0pUmER5TKN69par/
	k7Dls9qhaRogdhK465Y+TmioQzwIhCsk7xE2JieSOwWEjdrBqOhRmmyE2V4xymQX6m0m
	/wyHltZRWk8tH++IXT6Eui8SY1B9OLhegbk/Jahk0YtfJQItOM58D7nwPkfFnB+WkLUX
	5TCqNgCYJ7cEI77/rNVqMitCq1ykBg3jjMxwQ01CMEEkPBQZfmvpISnzroh3GDktcgkX
	+eutwH9efdrZwjG4bpmU1t4VyyrUdYI1TykY47G6rCLNW2atVyva2JFJPAjEX8XJOcCz
	Tieg==
Received: by 10.14.174.194 with SMTP id x42mr1617442eel.22.1353591082898;
	Thu, 22 Nov 2012 05:31:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 2sm6960612eef.17.2012.11.22.05.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 05:31:22 -0800 (PST)
Date: Thu, 22 Nov 2012 14:31:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122133125.GC12637@jama.jama.net>
References: <50AE2633.1030006@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50AE2633.1030006@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: kernel image
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
X-List-Received-Date: Thu, 22 Nov 2012 13:45:30 -0000
X-Groupsio-MsgNum: 41637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FWV58dOTQOM6W93I"
Content-Disposition: inline

--FWV58dOTQOM6W93I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 02:18:43PM +0100, Jaap de Jong wrote:
> Hi,
> does anyone know where the + (in=20
> kernel-2.6.35.14+_2.6.35-r14.6_mymachine.ipk) is added?
> It is added on my pc (running ubuntu); it is not added on my debian=20
> buildserver.

Check if you have oe-core 56fe5300

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FWV58dOTQOM6W93I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuKS0ACgkQN1Ujt2V2gBwwSwCfTtrujgImRXYYtUBaO2avlRe+
CtsAnRHCdCOwJy2veBCVTxgRXfGNpE+P
=bAxj
-----END PGP SIGNATURE-----

--FWV58dOTQOM6W93I--
