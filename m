Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtHYe-0004ff-3s
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:48:48 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so227633dal.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wKCZf4JV9AjZVMsjTgztSByZrRUahbVQa482jHCf3hw=;
	b=PhV/G16JFR18q+RI7dSiCwSEjPNLjgmGadil9Dpl6cskvxBy7f9YChQP+kdTNKBvTO
	xyb/X2o2cyVAZ/jE8f59zv2MlsIV5MIGvAtMVhlFB4PdhIiTeNEevAEtNkACXfBfTKS1
	xT6HF3uAD3K5yk6EZBwJ1IRTeGIqWmS/tSNGNyfQjkkygvSmcesusN+6Qh2PKnk+HZyR
	UamADHFKu+YcbMPzEtsPENDLjVSZx84v82BekVkxHEPpi5AdjTuBncL0xdJtpIVWL0Qa
	Zskp0kQUyuG1rfLc13Q3ZgIFr/QGNl4yvWiVVmm6E4cex76GwkCqPa4Nnl1ja4mreHI3
	qwng==
X-Received: by 10.66.86.101 with SMTP id o5mr197615805paz.15.1357821198154;
	Thu, 10 Jan 2013 04:33:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ty4sm741420pbc.57.2013.01.10.04.33.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 04:33:17 -0800 (PST)
Date: Thu, 10 Jan 2013 13:33:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110123323.GF3722@jama.palm1.palmone.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
	<20130110112231.GZ3722@jama.palm1.palmone.com>
	<20130110113445.GC3722@jama.palm1.palmone.com>
	<CALbNGRSoDq0sqrJnur-O7=vT_-qpWZwCPYJUpK46Zc+Yiz5pXA@mail.gmail.com>
	<20130110115617.GD3722@jama.palm1.palmone.com>
	<CALbNGRSyyUc+Pfok66bo_3xQbaTVy47+Q6dgCAsQPhxXW436Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSyyUc+Pfok66bo_3xQbaTVy47+Q6dgCAsQPhxXW436Pw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Thu, 10 Jan 2013 12:48:49 -0000
X-List-Received-Date: Thu, 10 Jan 2013 12:48:49 -0000
X-Groupsio-MsgNum: 42639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H4Dtu32JQD1K2gM0"
Content-Disposition: inline

--H4Dtu32JQD1K2gM0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:59:49PM +0100, Andreas M=FCller wrote:
> On Thu, Jan 10, 2013 at 12:56 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >> Next pull request contains SOB. I don't know how Koen did that but the
> >> pull requests applied contained SOB
> >
> > His SOBs, not yours, right?
> Both AFAICR

Still it's your job to add yours SOBs and having different patches sent
to ML and in repo is worst case as people do review on ML (e.g. I've
checked those SOBs on ML, but then applied them from repo + git diff).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H4Dtu32JQD1K2gM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDutRMACgkQN1Ujt2V2gBz0lACeNhmRyBhPR79bvDFRyvmbU9pk
U4EAn19iMHgwhtpcJ3oYtkGDo4Gw4bpQ
=V2Ul
-----END PGP SIGNATURE-----

--H4Dtu32JQD1K2gM0--
