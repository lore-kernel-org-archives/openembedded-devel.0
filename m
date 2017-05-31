Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8525E71976
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 23:05:09 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 7so136362354wmo.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k/QVDf3HabrX1nSywhV9Gxe6s3WF2LF/uhdRj91oTZo=;
	b=P8RKuM9OFmfjoBSaKPIDcILEGjQPVyrJ8MBOUXxz0TGhDHRv80ZyKVjj6TwuIAnNTR
	jqqJo1ut3J5lM6EXskn3j2qpFJSOmQbsN8wbSLK8k6xqEPFA0M4kpVpjexQEisDu+gNE
	7zGXqrykPn7/ab257NiR7AvHCwJ2CEgBsCeXWY1aTcg8AcVFCSQSupmqfDFMmUcrFiXK
	THxNY88QwBdhh/wV04yZE+awJS31dx6LKUpL8l209pTYAgaWlffnya5MEq+ag1qaDbCy
	dNJAC0rlB5qfsA9dko4JUD/hipxC80xgIQDN5r/eV4zDdExTh5/XrcpzroUN+bT9Xnyk
	dbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k/QVDf3HabrX1nSywhV9Gxe6s3WF2LF/uhdRj91oTZo=;
	b=oxbBZDMfmmRq3W6Sq/KaOalQKOO174gW8qCQKmeacDZdcEUsNdBOeYeR7TdmcxaBfR
	l2HqaxQdAMJoc957ec9/Ex19Cy/SgkRer/B3XjwwUI9fJI6/YJpoYIPHBSIr0oefJPq8
	wgGEzN6hEJZKRpF4kK4NXsAtqm1Fr/rIONWx1fby7AT3QMbs5irX8OPQe8+QxshZaGox
	CsEn+Yus/T3IRmFEXn56JbVqN7Au50NLGqYuCgrUm5XP1GpdI6NjVO0eysoXDDAuoTCa
	f0mas6mq2cV6qfWIgJZnNv5S3DuTmHU9XsTtNfraxqIKnSYmCaZ073O1Fs9zaSnJOdu+
	csdA==
X-Gm-Message-State: AODbwcD1mGfzOPXE83f527zntuntO30I0qq4f1VaUGGjwiOGQVe/+XEz
	+3E+ghvb5TWi8ARLVVC4B4ITNyK70g==
X-Received: by 10.28.35.8 with SMTP id j8mr6499408wmj.96.1496271910900; Wed,
	31 May 2017 16:05:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Wed, 31 May 2017 16:05:10 -0700 (PDT)
In-Reply-To: <AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>
	<1496243833.26945.66.camel@linux.intel.com>
	<AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 31 May 2017 16:05:10 -0700
Message-ID: <CAJ86T=WKVOKdB5tK2=AqRK_LL-Gnd9JyvikBY+OMFz3USm3hww@mail.gmail.com>
To: Martin Siegumfeldt <mns@gomspace.com>
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: URL of devmem2
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
X-List-Received-Date: Wed, 31 May 2017 23:05:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2017 at 12:15 PM, Martin Siegumfeldt <mns@gomspace.com> wro=
te:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> Sent: Wednesday, May 31, 2017 17:17
> To: Martin Siegumfeldt
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] URL of devmem2
>
> On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
>> Hi,
>>
>>
>> Is there any chance that  http://git.openembedded.org/meta-openembedded/=
commit/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8 and  http://git.opene=
mbedded.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecfc13a6=
7ccf1da1 will be backported to release branches? lartmaker domain seems no =
longer available - AFAICS all branches older than pyro is affected.
>>
>
> without much contexts on these two patches, send the backported patches
> with proper stable releases names as prefixes to the mailing list.
>
> Thanks Leonardo, assuming https://www.openembedded.org/wiki/How_to_submit=
_a_patch_to_OpenEmbedded still applies I will try it out - cheers...
>

Just for reference: the busybox version of devmem may be a suitable
alternative to the original for many projects (and being part of
busybox, it's maintained and isn't going to suddenly disappear or
change URLs).

