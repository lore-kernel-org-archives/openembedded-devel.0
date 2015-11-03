Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2F6607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 14:06:44 +0000 (UTC)
Received: by wijp11 with SMTP id p11so72455868wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 06:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=em0I0Ue5Tr01BP1Cv3bEbfUiUyaMCFQ6CUzvWzNaxqU=;
	b=UyA1IMickqxcPMOxAutDfFVYKhvILt5fpxYrL1q+sJN1DmEoLzT+LPEnsjQV9Wn2La
	vRYnX9P0kZEW9gLy2vn/n7D6g5Xtu28+rTf7GH+/bPz9T889+X8VErNNd74Zct9gIIZc
	4GbdAMLtwtXzRl7GUb9EG5kixohpMosMNHjt9WR1ag3jVe1LkfY4L8up5Euhs4ijm8z8
	3aC3mVizRfPurT3z1foMSRzHBIY/6kwF8rYn259KU700ULazxcoGp8NahSRAXGaapL62
	o+cRnDeZ2rx++8+DS4UAQVsKVIEvUyUkWtqovjzbuRq8BnuQnLWwJP/tKoZBgSJCnWdT
	y9Lw==
X-Received: by 10.194.232.230 with SMTP id tr6mr14563819wjc.21.1446559604393; 
	Tue, 03 Nov 2015 06:06:44 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	c1sm27747491wjf.19.2015.11.03.06.06.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 06:06:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151103122312.GA18881@mail.itconsulting-heinold.de>
Date: Tue, 3 Nov 2015 15:06:42 +0100
Message-Id: <58AB8C94-4CD8-4185-9616-974B42BBFF03@gmail.com>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<20151103122312.GA18881@mail.itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 14:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 03.11.2015 um 13:23 schrieb Henning Heinold =
<henning@itconsulting-heinold.de>:
>=20
> Hi Jens,
>=20
> does the java8-native build do not need any javac? One goal was to =
build
> all the stuff from scratch without the need to install any java =
compiler on
> the host.

Hi Henning,

it uses the javac from icedtea7-native.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


