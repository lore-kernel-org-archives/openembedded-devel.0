Return-Path: <yisooan@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 55A3E76EBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 00:42:24 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 80-v6so1630922pgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 17:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=6Qww+NMQ6k5wUrYjwKckS31ONqFUgM3kDT6kPfCcvrs=;
	b=b9yR3JGNkQNZ54MNOTUCvPpTOMgJOushu2EMAdquBmmB0pNEUg92klAtZiFHiP2o9e
	BjwUMrWD/V8o1J3BProTg2dL3jY7xzxh2YUG6+WsMMre96mHcT/wV75tKEInTeZOGUxU
	5+zYssYZec/S6/oHc4HbmqywGc5gNhHmEOD2UFdmanpCCWjPkATiGexD5W7nUhf/W2R0
	WUWffaisNi5hDqAfd7BvpOOUJ29XYP50EvrphcARYT0MTZFuL42eto5+rGd5O3R9h2yv
	wRlr3XUCic1oJYjNAGzdJKAkEQiGU4dYJM8SVmVzDzntG2cNFsBn63/cAajIKnyq+z6C
	sI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6Qww+NMQ6k5wUrYjwKckS31ONqFUgM3kDT6kPfCcvrs=;
	b=DpIRwAL7elNcWwKtXbn0s3UMyizYVwomkupeq5be/1s5RiG+m01f/nFEK/J08DQopq
	hluWguuRjIaAe0TLPB3Pr7AArl0JKqR7TPBxFgv66Jei08ZbqMjaq0mubR5KECwr7jyK
	LJo0bQE82m3JHBQNN6vKlk5Jrzqgt473TUkMTDmMdiGftcCGrXAUkkFYQDr8SbVttejq
	i0w8J6M5NXHvQTHRdm0Ed5K7wLYmR1clKkavjIOJa1V7qZERaxVxgl9s6Tyw1a4fBQhI
	p0ye6rQP1KCpDYbk9HiZXqhEo6FWMGayQjkGYllwFFDRVGpL3jnIA6zyC7nCABuoJMle
	iaSA==
X-Gm-Message-State: ABuFfog8AoCr2St9ws/yG/ES7mwQi6WQJb6dveZsbDFv+dAnLeGlgOD4
	5YnubfE1ZIrmThtPY1uVkJ8=
X-Google-Smtp-Source: ACcGV61mE9FCRP4yd5VPUWMsIOy+wEUTon8dWfoA+MqMCJXa4q1qP1Y+0jZiaBW+Mhqb8J8jnlmC2Q==
X-Received: by 2002:a62:830e:: with SMTP id
	h14-v6mr33057437pfe.29.1539132145293; 
	Tue, 09 Oct 2018 17:42:25 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm17493039pgr.11.2018.10.09.17.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 17:42:24 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org, yisooan@gmail.com
References: <20181009085425.18140-1-yisooan@gmail.com>
	<20181009085425.18140-2-yisooan@gmail.com>
From: Yi-Soo An <yisooan@gmail.com>
Message-ID: <b90c2a55-134c-9482-0600-2f3d12ba2bf7@gmail.com>
Date: Wed, 10 Oct 2018 09:42:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181009085425.18140-2-yisooan@gmail.com>
Subject: Re: [meta-networking][PATCH 2/2] babeld: Fix build fail on LICENCE
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
X-List-Received-Date: Wed, 10 Oct 2018 00:42:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This patch is not necessary since [meta-networking,v2][PATCH] babeld: 
Add Babel routing protocol recipe. the v2 patch points to LICENCE 
instead of renaming it to LICENSE.

Best regards,
Yi-Soo

On 10/09/2018 05:54 PM, Yi-Soo An wrote:
> Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> ---
>   .../0001-Rename-LICENCE-to-LICENSE.patch      | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> 
> diff --git a/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> new file mode 100644
> index 000000000..de374ad69
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> @@ -0,0 +1,24 @@
> +From f58103fc6da9a96c11b653eafd4c2ea7eab7ee68 Mon Sep 17 00:00:00 2001
> +From: Yi-Soo An <yisooan@gmail.com>
> +Date: Tue, 9 Oct 2018 16:24:32 +0900
> +Subject: [PATCH] Rename LICENCE to LICENSE
> +
> +Although LICENCE is grammatically correct, the recipe requires
> +only LICENSE file. If the name does not match LICENSE, it fails
> +to build.
> +
> +To fix it, it renames to LICENSE.
> +
> +Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> +---
> + LICENCE => LICENSE | 0
> + 1 file changed, 0 insertions(+), 0 deletions(-)
> + rename LICENCE => LICENSE (100%)
> +
> +diff --git a/LICENCE b/LICENSE
> +similarity index 100%
> +rename from LICENCE
> +rename to LICENSE
> +--
> +2.17.1
> +
> 

