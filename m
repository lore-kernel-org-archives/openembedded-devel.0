Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 203D370100
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 22:10:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b80so761710wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=/+Pl31TKNKqPGRTpn7NbhONjrybYhzriZbu7Bphzro4=;
	b=IFWj7BX/fA58hIX43Ef3yWwwr/N3A7JFjwqKzqubYRoyF0y9xLC3HJLX0/DNHK6vsm
	ShrVxP36a/D0jvPVWvomn1x9n3NPPpuremA4LIAVQUp2hH3y2IiAsIPzS+7BiSEXvuAZ
	Mlr78pjCDjhlpxWMDLA/O35e+tqqfCDGH9RNrVMjKergy9j8Bt0Py8FYKYbmMcarQgwy
	0H2NQCXHh7Qc8Io8xuE0si5RV1heaU36ziIRmS3G2xmF0zVr/VQiStf6B1pSG0rp7Wiy
	R1JBEpVQBOUdyy2O9EDpnRTIgN0KtWko0UJPwd9XYZatBU3zx3pQNHIJQ17Os7WxJDBd
	d4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=/+Pl31TKNKqPGRTpn7NbhONjrybYhzriZbu7Bphzro4=;
	b=K1AYXSo5thBTAZ81aeufmhtT/FpIQUyLYyRnI8Owuq9c3uvueAV2tqQd9t2aUiH6MN
	TZQbKdkUUMkKgHjiwBRnzJQ5pgEsjxSQ4jz86gHTMG7gSFkui73q9cWGDhJ8v+Bftf01
	126iu34oZ/Y9JrniRh59tNaD7R7b02zJxcinfu/Y12veXXVNV57Dy5EY/uhRUa1s0vKe
	A+ZOq8jx7zVPx8s93N98pThZrBuyMbpARnUr9UyOeSSlT+Z/fDPMi02qDV8aJtlDfE2t
	FRVmnIcnnUNuyI2feaeCFYkifkP5z+xa8A5Lm9yge9QlxC5vzMzpKnLUxbLM+OS4gxWB
	qPWw==
X-Gm-Message-State: AA6/9Rnc7/21rak6mfeGaKtaQGvwu0j6ZSBTIbrQS2ViPcrE98qifg7rlUdtRR8vMjjqSw==
X-Received: by 10.194.68.38 with SMTP id s6mr7172325wjt.130.1476223813906;
	Tue, 11 Oct 2016 15:10:13 -0700 (PDT)
Received: from [10.0.36.7] ([94.186.205.19]) by smtp.gmail.com with ESMTPSA id
	wh3sm9119102wjb.49.2016.10.11.15.10.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Oct 2016 15:10:13 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20161011174809.GA2917@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <21a60c22-9180-5225-4ece-31298a9b7b16@gmail.com>
Date: Tue, 11 Oct 2016 15:10:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161011174809.GA2917@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: morty branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Tue, 11 Oct 2016 22:10:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 10/11/2016 10:48 AM, Martin Jansa wrote:
> Hello,
>
> as every 6 months I'm looking for some volunteer(s) to step-up and
> maintain "morthy" release branch.
count me in.
>
> You can sign-up by replying to this thread and then one of you need to
> send README update like this:

sent patches.

-armin

> https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae
>
> More details in thread searching for daisy maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html
> or dizzy maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html
> or fido maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html
> or jethro maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103810.html
> or krogoth maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/106952.html
>
> Regards,
>
>
>


