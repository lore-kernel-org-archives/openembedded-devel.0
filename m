Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8476F273
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 22:57:16 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so2230241pdb.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=d3hVyQ5hzGRAR03zeH9I0O5ph2rwxEgORdw13WWFA8U=;
	b=dl/IZ5JxZdfr1D9WRKEUrj9M92tZX+Lndw5Xd+oewz8YJmzVAqvSZ3NF1dHsh8OkCX
	hdbH+i74REluT4o+DsXSYFyplIikQingz3G6sYISzAIA3kQKYQkiDoRgtfG7fu6jis56
	RgD/DeeQ0r4vyf85Ny5BmkpcdrrjgcojuCXbqFDagRqEF/3g2saWZQa9sTEPkUa2rs0c
	AbTWDgZO3osVglTpSDTIQE4QthbE+2iT2WLi/n7LFZXsLMRZhOomCVKM3Z3phqOhEFTB
	Gtj/PTZLe/btk357mpCDDAh7IHX+M+uHFqs4yS4xOGkyPSQEtxc4+FANh4Ue2EIwSJGk
	kiOg==
X-Received: by 10.66.122.201 with SMTP id lu9mr11307601pab.40.1393714637780;
	Sat, 01 Mar 2014 14:57:17 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ce15sm47479126pac.0.2014.03.01.14.57.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Mar 2014 14:57:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5621583.lHbqxaxFpZ@peggleto-mobl5.ger.corp.intel.com>
Date: Sat, 1 Mar 2014 14:57:14 -0800
Message-Id: <6B3DF93B-C645-42A0-A36E-4EE3923E3905@gmail.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbSeFKkk0JrEYQAS3Lb2NVAJYuraaBAkNCgT_-LUW+Gdw@mail.gmail.com>
	<5621583.lHbqxaxFpZ@peggleto-mobl5.ger.corp.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1874)
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Sat, 01 Mar 2014 22:57:20 -0000
X-Groupsio-MsgNum: 48475
Content-Type: multipart/signed;
	boundary="Apple-Mail=_15207A19-6501-4969-BA4A-EF62B78B7F33";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_15207A19-6501-4969-BA4A-EF62B78B7F33
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 1, 2014, at 2:48 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Saturday 01 March 2014 20:18:44 Burton, Ross wrote:
>> On 1 March 2014 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> =
wrote:
>>> That would be nice, but since you can't actually distribute a =
product that
>>> connects to the main pool.ntp.org server (you need to register your =
own
>>> NTP
>>> pool [1]) we've elected not to set any default so that you are =
encouraged
>>> to do the right thing and explicitly set your own.
>>=20
>> We should probably put this in the documentation.  I'll file a bug.
>=20
> Whose documentation though? ntp is part of meta-networking rather than =
OE-
> Core.
>=20

README for meta-networking is best place.=20

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_15207A19-6501-4969-BA4A-EF62B78B7F33
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMSZcoACgkQuwUzVZGdMxSVMQCfZB01JTWCAF8pADS9Ixi51RxK
9HAAnRg/V0OmViSMg8wa4wGsHHiEqBuP
=fVL2
-----END PGP SIGNATURE-----

--Apple-Mail=_15207A19-6501-4969-BA4A-EF62B78B7F33--
