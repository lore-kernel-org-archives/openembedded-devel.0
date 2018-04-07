Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC0E75439
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Apr 2018 07:02:03 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id s18so3537076wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nnuRyAHc4Xq9/sKeLh1FtkzRdeWmNQ8XHlr37ocI8nE=;
	b=b1cKqmkHHycZBzUib2gX8eNid219NzXyXt7ORXz6HfOxtkKDfrkq+ygZOP03a6/l2I
	pFk1bvaywy6RVCx6V3sMDNeW3AqwvDVlMNxSg6xW1Qe4bZFMyx6UV090C4D0mEkeC3FW
	BxQy2+Wdg6E13a12ChH/4zv9oXcwI20R2RrIrbRx9ahoWAR1MvPBKANfy/aVL9U73bl4
	C3uYA1IteYfWulbN0Cee+1/Y3qeo7DNjWNnRmq2oPjt+5vRzepB13iQJb06zi4lzQbqb
	M3B0mc6rj//8RD6XssH6s5AedrBoyQJ3Pxfr9PzZqbMGVLBtHEzVF93/oV+zHJJ7cXcF
	OQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nnuRyAHc4Xq9/sKeLh1FtkzRdeWmNQ8XHlr37ocI8nE=;
	b=GQHEzrHU23reGpE3/rs2ejOd9UCYORXlXjmaPZzu5XGDCqJ00eucZ74hvfku1deLkQ
	zJF7sSrJkXdfnRnAZmN2A0uf0cvM/nQ7T8ODBF7rdQ8on3RLsUCJK7vvL1l3nJqWFd/l
	0/dp50T80Q4jkLPhuf/gXqaB9kcLUwCejqg5t+GXEkIlve4LRp7r8ElSHylLfeIFp5VZ
	Hlw6ikUP2oTrRUQzx/cn4HtEmSu2xWAqSbxLWQj2vKECgPdx/Cb5juWRqWLae4UQAAUL
	yWjPQdYXL4jelkey62548KwuNzSDdFDgia6GBKRmqmfhn7uEMlyojnh+tSq9lRbz4MzP
	c80Q==
X-Gm-Message-State: AElRT7Fc1xJ/iFC5XSzsfKHXuMcC41hnTfY5gPEc9fBoqX/Ma0RgKvQv
	1Int6moSZIgkGTlnIAQ6AgJpelPHy8jcvvPuoUw5Uw==
X-Google-Smtp-Source: AIpwx4/RfmuxeEP6oq5E3aMAfsub2QbPtyoE5AWkMko9tAcQXMUqHTDSdUDoDO3rbwo3RO2G1+V5ZcAB5hJZS0yCokA=
X-Received: by 10.223.149.70 with SMTP id 64mr20247646wrs.223.1523084524458;
	Sat, 07 Apr 2018 00:02:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Sat, 7 Apr 2018 00:02:03 -0700 (PDT)
In-Reply-To: <20180406123416.17928-1-Martin.Jansa@gmail.com>
References: <20180406123416.17928-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 7 Apr 2018 09:02:03 +0200
Message-ID: <CA+chaQetNG1HDrL7s5eT+84W==DDu-0BzWjErxw5zUn6N1UroQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH] layer.conf: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Sat, 07 Apr 2018 07:02:04 -0000
Content-Type: text/plain; charset="UTF-8"

You can ignore this one, different version got merged through github PR:
https://github.com/OSSystems/meta-browser/pull/107

On Fri, Apr 6, 2018 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 5275778..37c4160 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -9,3 +9,5 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_browser-layer = "7"
>
>  LAYERVERSION_browser-layer = "1"
> +
> +LAYERSERIES_COMPAT_browser-layer = "sumo"
> --
> 2.15.1
>
>

