Return-Path: <jc@vtkloud.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id E210C6CC8C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:51:55 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id 1so6614762qec.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 08:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:in-reply-to
	:references:from:to:cc:subject:content-type;
	bh=2h5hkeqlyHoylYPnEmraMusHJIonSF+7CCqAqhIbYVg=;
	b=JJjANTjkw27n0/IaGmW9LjDgcp6F6g9PNfvFMGMpk4O5EpPx4UfpRvkPPMtnwzrBed
	OjhBkLCYofX4w+UP4idHECVtEsotjLnvkbHp61eHX68kFBpoe0b99bYsqROK8DNa2KcI
	xn5iGAmqhwTg6yMOITShclB1B7Ff6CK13Nb5K+w04hTm35bAfXE/uZO0Cf0f/7ZArVm9
	1Fhk837kWaXxy5ejOhk/nlZGMf7fwHvwqdyH/rLwyjPUxTId7mSvaf89ZXYT1+PLOELq
	bxfg8ZoYp+w2NGFK7dzYO0clrXHmSMTPQbV5DoBUtdKcptpSRzn1ItrP/fnapFp3ql+n
	/6UQ==
X-Gm-Message-State: ALoCoQk/XCHias67cDW7PRZYf2hKyve2YjuO44xZS4mx61U9L+VL/7aj1tW0kAogr6MjdcI/6mCl
X-Received: by 10.224.157.14 with SMTP id z14mr11384009qaw.90.1381852317533;
	Tue, 15 Oct 2013 08:51:57 -0700 (PDT)
Received: from [127.0.0.1] (ec2-54-235-159-142.compute-1.amazonaws.com.
	[54.235.159.142])
	by mx.google.com with ESMTPSA id i4sm156865069qan.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 08:51:56 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.5.0; +http://www.nodemailer.com/)
Date: Tue, 15 Oct 2013 08:51:56 -0700 (PDT)
Message-Id: <1381852315214.3233b184@Nodemailer>
In-Reply-To: <CAP9ODKpPYV+DisUEqVH1T_n0P5aJyqjZYLOjnco==9LOtnWY5A@mail.gmail.com>
References: <CAP9ODKpPYV+DisUEqVH1T_n0P5aJyqjZYLOjnco==9LOtnWY5A@mail.gmail.com>
X-Orchestra-Oid: 68E79EF6-F1BE-4312-983D-03AC430A0228
X-Orchestra-Sig: 9a3864c78127e01d4a38eae03fc6e1096eb65ea5
X-Orchestra-Thrid: TDF50CD80-D5BE-4DE9-9446-44DAF41E57D4_1448962123978983631
X-Orchestra-Thrid-Sig: 83b1d1903d93d67273a5ba9b8b729b43ef1ddc18
X-Orchestra-Account: 5a99a25d8b0e8b8b22e1be4c7170f58667263fa6
From: "Jay See" <jc@vtkloud.com>
To: openembedded-devel@lists.openembedded.org
Cc: "OpenEmbedded Devel List" <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Dora maintainer wanted
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
X-List-Received-Date: Tue, 15 Oct 2013 15:51:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar., oct. 15, 2013 at 2:51 PM, Otavio Salvador <otavio@ossystems.com.br=
=
=3D"mailto:otavio@ossystems.com.br">> wrote:
On Tue, Oct 15, 2013 at 9:07 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:

> -----BEGIN PGP SIGNED MESSAGE-----

> Hash: SHA1

>

> Op 15-10-13 13:52, Martin Jansa schreef:

>> Hi,

>>

>> we have first few patches which should be applied only for master branc=
h.

>> I've created dora branch from current master, but I assume we'll backpo=
rt

>> few more changes to dora soon.

>>

>> Any volunteer?

>

> I think I can help out with that, but I'm away on travel the next few we=
eks

> (ELC-E + Connect USA).


I can help as well.




=E2=80=8B

Albeit I'm quite new to yocto is be happy to take a part of the work. I'm =
not sure how many (gross-guesstimate) patches we're talking about here ?=C2=
=
=A0




Jay






--=20

Otavio Salvador                             O.S. Systems

http://www.ossystems.com.br        http://code.ossystems.com.br

Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

_______________________________________________

Openembedded-devel mailing list

Openembedded-devel@lists.openembedded.org

http://lists.openembedded.org/mailman/listinfo/openembedded-devel
From andrea.adami@gmail.com  Tue Oct 15 20:51:17 2013
Return-Path: <andrea.adami@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 463DE6CBA4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 20:51:17 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so4165458eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:51:18 -0700 (PDT)
DKIM-Signature: v
