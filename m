Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E89E3776B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 18:26:50 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id b2so4726525pat.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=ApAukCqYdlZ3JBRalhFNiIVf+tAkXXj4KKfeFv96u/I=;
	b=coJAMaf9nohRWE1ikYyuXL9e8SXJcd/4H0luL075PU4bjiYpOXhTNFyqQHAH8xEAyA
	wEZzIzG4pPG/Do3IxoFV9JjplJA2EasBS2ewRvjbGSckJw2t3hrrp5UdTfMWz77gumHa
	dobJ19lXwcGUEFXNZceUH//ZUR2WrurTKwmCV/l5D7qXKFY8MpAymQ4UqEc5Bd8QukoF
	lKb0Ha8dvAKV8+9coqrirRqXgcGdsM++rY8ljLVLXUhMG3S/WnfA9fE1AEn7tHznwX55
	YWcwT41RCFNhZCw8X0ND9rjSh00O+bQbQP/WdV9HGVFemF1/FEk8Qce+wc7Qliw8Ca/j
	s/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=ApAukCqYdlZ3JBRalhFNiIVf+tAkXXj4KKfeFv96u/I=;
	b=GZUIP4zCyNpNDsJhPS9QFDd5pGf+0jjEG0ZwsBI1vHBL0eqs9c0tiPGRuII2j6rFRc
	HnkypxFhKKPCVB+vXmXXHXO4vAXX7vBW3T1S8e4LZAjQm3jhU8dRv+A0GHSLipv7Yxp5
	3f9laGqu61n4vPLVkZ6iArT3SitOwsT/JGTN6/lSANkqmZI27kDMZCp0Uh95ByglVGOx
	UDf8C9eNScjw7wdr0UNBXfwzRThWXEskXc4qMdzwMK6g1wNuNv6Y1Ameu2T6IBLB6/ga
	kvr7vqvC6A6DF24+tYpMStElYJYS5srNCCVVleH9RvfICsA6DHfrTLGWQnTleir5R9QI
	qiOQ==
X-Gm-Message-State: AE9vXwP+kW+4xLnQV3k3W6bxPo3vKEceXX8fEhShG8TO9YHgAMW1qaaZUKcLiBBD3fzXpQ==
X-Received: by 10.66.126.131 with SMTP id my3mr67936462pab.115.1473186411048; 
	Tue, 06 Sep 2016 11:26:51 -0700 (PDT)
Received: from [10.0.0.112] ([76.126.209.57]) by smtp.gmail.com with ESMTPSA id
	h66sm19579975pfc.47.2016.09.06.11.26.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 11:26:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAPSYY_TerXvG8TiFfe_cWbzjcAQo-BjtmLVcxgXsOZt7JCPPgg@mail.gmail.com>
Date: Tue, 6 Sep 2016 11:26:51 -0700
Message-Id: <773221E2-E723-47D2-ABA3-874BDE668B7B@gmail.com>
References: <CAPSYY_TerXvG8TiFfe_cWbzjcAQo-BjtmLVcxgXsOZt7JCPPgg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: question about yocto+qt5+qemu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 18:26:56 -0000
X-Groupsio-MsgNum: 62983
Content-Type: multipart/signed;
	boundary="Apple-Mail=_62701A80-DF48-49DB-8097-039D8554B958";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_62701A80-DF48-49DB-8097-039D8554B958
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 5, 2016, at 10:11 PM, milad hasanvand =
<hasanvand.milad@gmail.com> wrote:
>=20
> Dear all,
>=20
> please correct me if it not the right place to ask this question.
> has anyone built qt5 using meta-qt5 and yocto(krogoth) for qemux8?
>=20
> I have tested every possible hint I found on the internet but none of =
led
> to a concrete solution.
> sometimes the build process completes but it couldn't find or load =
eglfs.
> linuxfb doesn't show the sample program and sometimes leads to system
> freeze.
> other situation it fails in qt5 do_compile or do_configure stage.


most folks use real hardware, so Qemu solutions may be tested for =
building it
but hardly for runtime testing. So you might be not finding lot of pre =
existing
solutions. I would suggest to compare the build with say a real target =
build and
see where all missing gaps are for emulator.

>=20
> isn't there a solid solution to that? for example a reference =
local.conf
> file or something similar such as the one in the following link:
> =
http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
>=20
> which also didn't work out for my case.
>=20
>=20
>=20
> I will be thankful if anyone can help get passed this stage.
>=20
>=20
>=20
> Regards;
>=20
> *Milad Hasanvand*
>=20
> *Connected Car System Designer @ AIRIC-SAIPA*
>=20
> =
--------------------------------------------------------------------------=
-----------------
>=20
> <http://airic-ir.com/>
>=20
> Automotive Industries Research & Innovation Center (AIRIC)
> SAIPA Group
>=20
> 15th Km Karadj Makhsoos Rd., Tehran, Iran.
> P.O. Box 13445/967
> hasanvand.milad@airic-ir.com
> Mobile:   +98 938 510 0152
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_62701A80-DF48-49DB-8097-039D8554B958
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfPCmsACgkQuwUzVZGdMxQkzQCdGUUMgJFEpiEY4avkxUVWHkPe
wuIAnRD2X/8SODCzhWgk2DGqttQt4lmu
=d5O6
-----END PGP SIGNATURE-----

--Apple-Mail=_62701A80-DF48-49DB-8097-039D8554B958--
