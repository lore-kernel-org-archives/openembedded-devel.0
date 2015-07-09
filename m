Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2035273F87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:30:40 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so182767407qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 03:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1LsFh3RiEHt1bckoFusM592EjGrugcGgxOSWl/WdnTQ=;
	b=P8IYGaJ6pgE55gu1fV2QNozc4juuZKN7T3SSTA5D+2tloffHpMy6+Ef3BHHblL9GMU
	3llAncFdhs7tnG8GQENbtYr61wd944oicRihL/dhcA57dv1SULSVHKEHGlK5266vXbY9
	awophPg5C70j4TeT7IlyXl8bu3smZcUbWGjOHBHW0RtKGSLc2WbidmJ0NdM6LN9UQNRU
	fvtOq3+ScGfVYLaZNkFhFFzVzj5Fv7ZUDwpwFTqGOaykaBsS9qdcRxAuqqzrHEq5lGXV
	1BDCx6E/mcxcy4XXNhjOwAvSq0DwbbQgA8mGg8mEPQEJKnaRcBZFaRWRQF190metjjTE
	1sdA==
X-Gm-Message-State: ALoCoQkg2LGD56MN5EsC4Ej2qQ35imJcfWqMqRItWhDbcnXuSdFmRAKdt8j/fDwX1wPo6LEl+tnm
X-Received: by 10.140.231.19 with SMTP id b19mr23531645qhc.22.1436437840896;
	Thu, 09 Jul 2015 03:30:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 03:30:21 -0700 (PDT)
In-Reply-To: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 11:30:21 +0100
Message-ID: <CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 10:30:45 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 11:24, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> What do people think? Should we be looking to make the switch back in OE as
> well?
>

I say we switch back to ffmpeg, and do it as soon as possible so we're not
making this change during M3.

Ross

