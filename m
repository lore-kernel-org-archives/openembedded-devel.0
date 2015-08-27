Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 30FCB60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:10:21 +0000 (UTC)
Received: by iods203 with SMTP id s203so60539243iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bvLpIfJX0z2gFlyEDus/j7enkQ+2AaKXaapHoKNc62M=;
	b=D1sOKIWyzgbZGIrUQL7koXPDBCzOennwPip/grLKPWyWVgFlY7FWNvdODL+6O4oWJS
	WZavr5AsU7l4wx7HMJeAkedTklWWSOXI3mUjZ/JJL5MtEcIw3ZJIqB+viAnnaWTh68Ia
	7k4has73f3UXM5QuaoBxGHWLS6YTj0yxm0NtuxhZnlJkVB5pshBUwN6qX5mm0W+C5T4Z
	wy8FDkE7iaLBSi9X+4B/5s1OELOKpfgKCOCNFo0qH9A1sJFD5h8zZDq1VvTZJfbWd6O3
	MxM4XsuAq3XzQql3s5eAQbKREdPfInUmfcnkIxtoaMOXYtZESM4Va+1RnuH4wahimgi9
	BX0A==
MIME-Version: 1.0
X-Received: by 10.107.150.68 with SMTP id y65mr11165899iod.133.1440688221978; 
	Thu, 27 Aug 2015 08:10:21 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 27 Aug 2015 08:10:21 -0700 (PDT)
In-Reply-To: <55DF25BF.4080304@linux.intel.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
	<1440687197-26742-2-git-send-email-schnitzeltony@googlemail.com>
	<55DF25BF.4080304@linux.intel.com>
Date: Thu, 27 Aug 2015 17:10:21 +0200
Message-ID: <CALbNGRTpF_HNK5wzOBQfjwUfXqguciU+9yCfcjOHmonjAc_hZg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] fontforge: update to 20150824
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
X-List-Received-Date: Thu, 27 Aug 2015 15:10:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 4:59 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/27/2015 05:53 PM, Andreas M=C3=BCller wrote:
>>
>> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
>> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
>> @@ -1,9 +1,9 @@
>>   SUMMARY =3D "A font editor"
>>   HOMEPAGE =3D "http://fontforge.github.io/en-US/"
>
>
> Oe-core has liberation-fonts package which apparently can not be updated
> because newer versions depend on fontforge. Would you be interested in
> moving fontforge to oe-core and updating liberation-fonts?
>
>
> Alex
>
LOL: I've tried that long time ago - maybe you should try with your
magic @intel.com

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-February=
/101757.html

Andreas

