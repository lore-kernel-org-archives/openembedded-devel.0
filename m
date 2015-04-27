Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2238873D9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:19:54 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so135142272pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ALmEiJgNAjT796dlAn/oYACe2htdQvaJl+Gn0uuSFCo=;
	b=tX6ZGJgDpzTcF0N29PjMwN8Soo4JwFaSyFaXwAbGbpO480AuKVIOa8dtTgyKGhGMkr
	3iH3RBoX8WZRHonauCMBIrYt4h641nXIZYwJsSBUVqvEn4P319WdqryfQU7xWY47lxCF
	wDO36M3oz3VdowSkHYqOszy9qg66xaQ1E6ya4eP8xyyjFGchyfSX2bBUNuc1IC5yTtdx
	4vjaJDMKYkJTTXXFZWOm0+RLWOfDnJSjNX863zR8yT9Bot8aw9isBX7b70TJj5Vor3v9
	kztzi1B7uRmsctrhHjEVGU+Hp0kwMTu+ck9++iD94+Rb/oL+Lz6tqb5le1HvIMzfoHiC
	IlXA==
X-Received: by 10.70.130.198 with SMTP id og6mr23928191pdb.153.1430155195991; 
	Mon, 27 Apr 2015 10:19:55 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c?
	([2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c])
	by mx.google.com with ESMTPSA id
	xo3sm17956926pbb.74.2015.04.27.10.19.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 10:19:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoa9_LoktwP+QWHg9cL8fUCa2s1Tyv_jgXNwQrcQEmRwQ@mail.gmail.com>
Date: Mon, 27 Apr 2015 10:19:54 -0700
Message-Id: <2113F868-AFF9-4461-880B-C4317BCD4B8A@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrO9G9nNyADvRpXG3hhQQDC-=B4okpsL93VLMx7M0i06g@mail.gmail.com>
	<3EA16728-34D3-4FBF-B45B-175AA746104C@gmail.com>
	<CAP9ODKoa9_LoktwP+QWHg9cL8fUCa2s1Tyv_jgXNwQrcQEmRwQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Apr 2015 17:19:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 27, 2015, at 10:18 AM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>=20
> On Mon, Apr 27, 2015 at 2:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Apr 27, 2015, at 9:57 AM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>>=20
>>> - proper patch headers
>>=20
>> can you point to patch header guidelines for meta-browser ?
>=20
> Same as OE in general[1].
>=20

OK then it should reflect in README as well. Thats what I was alluding =
to.

> 1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


