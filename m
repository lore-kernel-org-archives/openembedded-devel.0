Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7E46AC33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 03:02:06 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so58428746ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xdZkc4q/iJvTT/3ZGIxlfhBELT7Aob/VALvt8Nihnd4=;
	b=ab5Hdl5zyEayyYkgjMxQTonFI5/35B8z9louLEk9O4jBLiQmQA+EYGQm4GiJcEX+5Z
	U+0c+Pou4EWHdwXL6mZng966RgTTEN5FR21c3LAxEvAUbaw4fKBCwNvEAsvcvmbwYXQr
	3Md3OWlyQhjfujhPiqEv98rbeES6VEczzGnRtXXeDoXAjm4pw+YbdenW7SdwIMnZa041
	6gHv9j6ZkWkF5qn0XsJvEUsKsS6kkf4z7q4zlVswpcopxD/7AFEeQQQDvbD6bSnoKRjz
	pCIP4f3h6cs8+GsGsidge0UovKuKF1ojySy72MsFSkBp6gA7ixm8VKMkv6JIfeEStNn5
	f7WQ==
X-Received: by 10.107.129.88 with SMTP id c85mr3013857iod.81.1427166127585;
	Mon, 23 Mar 2015 20:02:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 23 Mar 2015 20:01:37 -0700 (PDT)
In-Reply-To: <CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Mar 2015 20:01:37 -0700
Message-ID: <CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Tue, 24 Mar 2015 03:02:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 1:00 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>
> Couldn't it reuse the Chromium recipe we use?

Surely and I have thought that for as second iteration after its soaked in
Right now they use different versions of chromium so there are some
issues around.
this will also mean some changes in chromium recipes.

