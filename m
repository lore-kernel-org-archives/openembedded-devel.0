Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1Tsegh-0000JZ-3S
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 20:18:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r08J33Qh011137
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jan 2013 11:03:03 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 8 Jan 2013 11:03:02 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 7D2077FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2013 14:01:26 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id C45BD24152; Tue,
	8 Jan 2013 14:03:01 -0500 (EST)
Date: Tue, 8 Jan 2013 14:03:01 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130108190301.GH10677@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-3-git-send-email-raj.khem@gmail.com>
	<20130107155808.GE6154@windriver.com>
	<CAMKF1sosuv-y3vkcXC=pfhjEcixH1cfoHHuLGJ6vR_MwNXOmmQ@mail.gmail.com>
	<CAMKF1sp_Qi_G4kkYCJSVLnPC-jAx9Exi73k=uqU-kjdvmnD87g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp_Qi_G4kkYCJSVLnPC-jAx9Exi73k=uqU-kjdvmnD87g@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Tue, 08 Jan 2013 19:18:35 -0000
X-Groupsio-MsgNum: 42579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline

--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7] =
On 13.01.08 (Tue 09:33) Khem Raj wrote:

> On Mon, Jan 7, 2013 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Fair enough. I will remove it in V3 and push it to branch
>=20
> I have now pushed a V3 into the pull branch where the commented do_install
> is removed.

The meta-networking bits look good to me.

--=20
-Joe MacDonald.
:wq

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDsbWUACgkQPN8S4W6ZZnc9LgCeKKki/ef4Bqlb9/3RhnQKd5yR
rQsAn1heNi90vV9TRHFLXmXBnXeeqRn8
=U6yz
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
