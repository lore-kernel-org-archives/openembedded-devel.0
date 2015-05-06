Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id CD8D773EC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 21:41:17 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so7194569igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 14:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=We/7bd7PZXa46o5nvVbmqOjwmvZLVYOQ4tltHWd30EQ=;
	b=bSeiYP+wfuSxw3VtUyCBeGRWA4BV0uWrRLKpRSEK523hvoN+Un44YpqJvoeLUQzYwP
	NX/GO8QwnUlxJxOtxyHqZiAxCAyWFVJSLYh93QVYWH/0Dv6+Bu+cSyx3usCQ8/OVhGWW
	Y+fldk3CfqOeZjVqbaGu2eBSNKXMQCh8rWt7qSfKg2rj7zHlxNZsqxRjtw1fbh5XN044
	2DPt1helN3uI/DsTZqZdZSgrDjtU7RVIT+zbfnQV8d3mPqJIWXZgmggRvAcyVLWxn/NB
	CgHFwzwIdG8NIWjaqR4Wmz6yavYXu5XO3aNYuhV9q8yra+a1+LftNvuPHNodSTlbQqYN
	X+fQ==
X-Received: by 10.107.18.170 with SMTP id 42mr1118820ios.38.1430948478666;
	Wed, 06 May 2015 14:41:18 -0700 (PDT)
Received: from [192.168.141.85] ([66.49.234.10])
	by mx.google.com with ESMTPSA id l3sm298013ige.21.2015.05.06.14.41.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 14:41:18 -0700 (PDT)
Message-ID: <554A8A7A.6030404@gmail.com>
Date: Wed, 06 May 2015 17:41:14 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <55483F50.5020803@gmail.com> <554A76F1.8050407@gmail.com>
	<554A7893.3060701@gmail.com>
In-Reply-To: <554A7893.3060701@gmail.com>
Subject: Re: Odroid-xu3 support
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
X-List-Received-Date: Wed, 06 May 2015 21:41:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/06/15 16:24, akuster808 wrote:
> On 05/06/2015 01:17 PM, Trevor Woerner wrote:
>> It'd be nice if someone could put together one "meta-odroid" that would
>> support them all ;-)
>
> Yep. looking into that.

That's great to hear :-D Which device(s) do you have, just the -xu3? My
-c1 arrived yesterday so I can help with testing that device if you
don't have one.

