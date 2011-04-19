Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QC7V9-0000ar-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:45:43 +0200
Received: by qwh5 with SMTP id 5so3037139qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=nXELY3ecq3LKpWiN1ckQy0CryxSsV+05c7NK6a/WcjQ=;
	b=jKMBCU1adN9saz/vbXSwm8ogNMH3DVIwZVW+ITnQCvNCWcKV9yX8aWZqzIRtWcM2DK
	f2u9vtx9RciGF8yo2CiYiSRggmBhs518PGdxQBwAUrMrGEeld1dXjtk0tuaAu1NLpmTa
	aFk+KVJqio6YvEtypkjOQGWA3V46nvcmBr8qk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Jyez1lhO7gw0RTxvD/mNNkUdLt5Tb98zBdAT8OAOBT84MaeW3dZRC0w1tuXmNuPLuS
	67Xq+gAWG+xAjPzIQUsQIvR4c0vKo3VuHylDhZcGSj66YcPuf27/70BVdTiKpu7FQMxJ
	92+QlWs8F31E3q7jmAVmraUkl5pZZIkcEOwwo=
Received: by 10.229.26.131 with SMTP id e3mr4085929qcc.254.1303206200073; Tue,
	19 Apr 2011 02:43:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.46.10 with HTTP; Tue, 19 Apr 2011 02:42:59 -0700 (PDT)
In-Reply-To: <iojkcv$aka$1@dough.gmane.org>
References: <cover.1303154850.git.michael.lippautz@gmail.com>
	<iojkcv$aka$1@dough.gmane.org>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Tue, 19 Apr 2011 11:42:59 +0200
Message-ID: <BANLkTi=Qxc2p2FMrTuA_UcRbGEm0rkUSbA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-meta 0/2] pull request: vim, wget
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
X-List-Received-Date: Tue, 19 Apr 2011 09:45:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/19 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-04-11 21:32, Michael Lippautz wrote:
>> Re-import of vim/gvim/vim-tiny and wget.
>>
>> * Clean vim recipe and update to 7.2.446 (446=3Dpatchset)
>> * Clean wget (ssl check using staging_dir)
>>
>> Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
>> =A0 Branch: master
>> =A0 Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/maste=
r
>
> merged, thanks

Thanks for correcting the space escape ...

I also didn't know that meta-oe doesn't care about distro overrides anymore=
.

-michael

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNrVTfMkyGM64RGpERAvWKAKC42t0l/m7qEQm8Ifp19yyol4OGcACcCKFi
> jvD3xecu+T2cMZoyx+QK1fY=3D
> =3DsFkX
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


