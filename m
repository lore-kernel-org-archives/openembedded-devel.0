Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 528D965CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:52:01 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so142869704pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Vzmj7sCorTxnJPNuHsen2HhQfeks/c7m9MEDoI+5HrM=;
	b=iSeoGIQoV2LvfenCn275Y/t1EPOPATuoWBzrW3o7HkjCjHj1W/uf9Hlb05i3t6/dTO
	eA2nyBs6sM0SrJW1xiQATwq5ANYpU6hMuBkMrbCap4nTm9F+tkOg4IAAwhUIYy2jORXS
	2u9KLd/t5rvzvHvaNoGlo5ke4TGHo2L3eH5fjxYV+4BeLbTJZ5/P0wZ43j9OhL44jPes
	vFdBVFpR4NEXwJ0q0gUnyFgO61yTyuXmfr5VVEKufxTThzPB5FlH/vFXihOUjHUS9Kt4
	LZjpqIyQzltSyayvfxy477P25u1CxIvU8m7oaGNPweIbaIFHEaSGW4HGyrlqsbSL4/bb
	HBaQ==
X-Received: by 10.70.91.104 with SMTP id cd8mr26243173pdb.94.1430171523341;
	Mon, 27 Apr 2015 14:52:03 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:8901:4653:e92:c56a?
	([2601:9:500:ece:8901:4653:e92:c56a])
	by mx.google.com with ESMTPSA id
	qa15sm3160355pab.12.2015.04.27.14.52.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 14:52:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
Date: Mon, 27 Apr 2015 14:52:01 -0700
Message-Id: <8D15DC87-F70B-47A0-BCC7-ECB4AFB2B21D@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
	<CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 21:52:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 27, 2015, at 2:40 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
>> Thanks for bringing it up. I will send a followup to fix it =
incrementally.
>=20
> Please wait for Carlos comments and send a new pathc revision. This is
> not yet merged so fixes are still possible.

sent a V6=

