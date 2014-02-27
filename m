Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 37CE96EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:15:48 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so2660252pdj.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eWzV+lg3wgRes6leaoQ6De3oJ3kJJ6MBAQDFjz3cZEo=;
	b=s+NazNVfN3vxCbsXE6sIssPga3XDoJe/nyn4jM0lGLNkJ9bfGPaX2PBzkqvwqPxkxz
	Xsrxia4c28Pv0afvVINcWft6iH5sx4EDhoYyWFI3GtnW6x+z/mf9XZs12gww6a3UG0jA
	+nQhl6UrnSZk9PpyB4ti44IrUaO2AHIRMUc1vWamMOrfx39fu7lHzSkV7dE/NHNBzYsO
	2AHdPNzs9dOm+anvX2IvJulPaTvxWjgx0/I7oNbg6prk0vQRMQzlOwFMkKmhRG3O9qS8
	SU57s/f9rRMHV1RRS6UTEFarJPUYQo8+x/oBCh/zcEx0Ru3cSpcVHnEToxKiWvMwwfdG
	BmmA==
X-Received: by 10.66.25.203 with SMTP id e11mr15993804pag.76.1393521349984;
	Thu, 27 Feb 2014 09:15:49 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id y9sm35284184pas.10.2014.02.27.09.15.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:15:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
Date: Thu, 27 Feb 2014 09:15:29 -0800
Message-Id: <90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1827)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 17:15:54 -0000
X-Groupsio-MsgNum: 48411
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4EF4BD9F-4CC6-4277-B4FA-1473326DAC9F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4EF4BD9F-4CC6-4277-B4FA-1473326DAC9F
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On Feb 27, 2014, at 9:11 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:

> +
> +RDEPENDS_${PN} = " \
> +    gdbserver \
> +    openssh \
> +    openssh-sftp-server \
> +    qtdeclarative-plugins \
> +"
> -- 

this hardcoding openssh issue still is unresolved ?

--Apple-Mail=_4EF4BD9F-4CC6-4277-B4FA-1473326DAC9F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMPcrEACgkQuwUzVZGdMxRZygCdEeUnYftekxpjcsg31fAorJ2o
vJ8Anj2pTRz+Bd6OJcPb2xgxixZV0HgA
=3VxC
-----END PGP SIGNATURE-----

--Apple-Mail=_4EF4BD9F-4CC6-4277-B4FA-1473326DAC9F--
