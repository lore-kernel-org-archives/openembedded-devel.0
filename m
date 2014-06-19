Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id CA0016FD27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 21:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 8A1723A08734
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:34:36 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id WeK2neYHrKIY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:34:30 -0400 (EDT)
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 072943A08724
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:34:29 -0400 (EDT)
Received: by mail-vc0-f180.google.com with SMTP id im17so2797092vcb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:34:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.220.9.201 with SMTP id m9mr6008493vcm.5.1403213669355; Thu,
	19 Jun 2014 14:34:29 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 14:34:29 -0700 (PDT)
In-Reply-To: <20140619210847.GT2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
Date: Thu, 19 Jun 2014 17:34:29 -0400
Message-ID: <CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Thu, 19 Jun 2014 21:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 5:08 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 19, 2014 at 04:32:17PM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
>> Hi Martin,
>>
>> On Thu, Jun 19, 2014 at 3:26 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>
...
>> or use bitbake -e qtbase | grep PACKAGES=3D
>>
>> Other solutions?
>
> buildhistory is great tool
>

k reading:
http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#maintai=
ning-build-output-quality

thx!

-KA

