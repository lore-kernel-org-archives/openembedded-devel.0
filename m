Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F08D1759B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2015 00:42:26 +0000 (UTC)
Received: by pasz6 with SMTP id z6so88274717pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 17:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=p6qgNVffc6RIgvthEMpUNAXOrvR12PMVR1qT6z4dO3M=;
	b=PBehthadvCxJ9vEe9LErxjaNyS/r8COymt7/Ou/IaW0H+qLMDKzVZDfTe00UBG92mJ
	361O1v8i3e6LlmedvDiuedu+i6odLN5BwXBHuh51BXjdgUWiO0d5Sqbh0bOF0dmbDfsV
	GWzB9ApWdYT8C+h34PW6wni2oHvXUsEYr0K301azGNMFpznXL0rNQvUZSGg6hR0Tez/i
	cRwx4jvqvh35J3k3CkT7h9xohlW+rsjBVof8vTIoipZnk6rqtF9qGcw1sl8nKpFdUVQK
	Rjzj6FPLeqigN6DK2EbNNIun4CRLv9PX5GPbd4bkUvdIdcIM3BrS/l6mlNZ4mSqlz/+N
	BA7A==
X-Received: by 10.66.102.101 with SMTP id fn5mr11704806pab.111.1446252147045; 
	Fri, 30 Oct 2015 17:42:27 -0700 (PDT)
Received: from ?IPv6:2601:641:c000:1d0:9139:22be:56a:125d?
	([2601:641:c000:1d0:9139:22be:56a:125d])
	by smtp.gmail.com with ESMTPSA id
	eg5sm10408102pac.30.2015.10.30.17.42.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Oct 2015 17:42:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <562DFDAA.5080805@teseo.com>
Date: Fri, 30 Oct 2015 17:42:27 -0700
Message-Id: <F273661B-C0F3-4041-8B90-09369FF0BF32@gmail.com>
References: <562DFDAA.5080805@teseo.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.5)
Subject: Re: initramfs
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
X-List-Received-Date: Sat, 31 Oct 2015 00:42:27 -0000
X-Groupsio-MsgNum: 58232
Content-Type: multipart/signed;
	boundary="Apple-Mail=_98676AFF-64E0-4251-B92C-17DA0FEA67E1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_98676AFF-64E0-4251-B92C-17DA0FEA67E1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 26, 2015, at 3:17 AM, Andrea Di Chiara =
<andrea.dichiara@teseo.com> wrote:
>=20
> Hi,
> I need to create ad initramfs image for an i.MX6 board. does it exist =
a
> suitable recipe?
> core-image-minimal-initramfs doesn't seem to fit ARM boards. am i =
wrong?

its a template, you can drive your own image using this infra

> thank you for the attention
> Andrea
>=20
> Software Department
> software@teseo.com
>=20
> =
--------------------------------------------------------------------------=
-----------------------------------
> TESEO spa            via Agnelli, 49              63023 FERMO (FM) =
ITALY
> Tel. +39 0734 628818   --    Fax. +39 0734 628816
>=20
> Disclaimer: This electronic mail transmission may contain legally =
privileged and/or confidential information. Do not read this if you are =
not the person(s) named. Any use, distribution, copying or disclosure by =
any other person is strictly prohibited. If you receive this =
transmission by mistake destroy the original transmission and its =
attachments without reading or saving in any manner.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_98676AFF-64E0-4251-B92C-17DA0FEA67E1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY0DnMACgkQuwUzVZGdMxQRhQCgiLXyVzlmDrCgbt5FxNbi+A96
SVwAn0mjCiiCoqxd6iEIW6cWCVr6WGpF
=PhNc
-----END PGP SIGNATURE-----

--Apple-Mail=_98676AFF-64E0-4251-B92C-17DA0FEA67E1--
