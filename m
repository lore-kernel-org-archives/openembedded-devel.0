Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 095027D3B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 14:30:32 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n7so19406779qtb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2019 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1UFYRxwsD6PgwYjf4rT9WsTSWbVmBQgNztVkdJfOJuQ=;
	b=gv6zKp8/M/U5XGZZRxhLJzt2n4BBGmUuJFegRwUgZWDzlyP25NxnizblmQ/kn8DxMW
	V84od7TJDAbLBg3ImwBXA+yxksUyA6YkajlYI19n80QJ3L9DqVIqCzy5KxXmR6JVQBsQ
	fj2uKKT0LeK+OIpS3Z6/LBga2AQVGspszQB7onFWjYex9L5qpqD37NmYfzUEmEkyT53R
	sYlEaPT+iQ/IU/5S3h+Ts7OXs4LHVyWs+ZgBhpfLwIcZd//LX8A5VHDm+ylZbijAS0RL
	yxpPmNDbDVHxwCmVkWEbbPKFhZzclOw574NlMCgGjrX/zF2PQqsDkY9CFWM5K6SuKySC
	tQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1UFYRxwsD6PgwYjf4rT9WsTSWbVmBQgNztVkdJfOJuQ=;
	b=gJJ+eWZwkMeOzYQnU8vnWauwYcOMw4bqgxlVQm8scRCx8apyD9brGRvbdI9TZhS+1P
	ELzDiNvQkFiHEngCxKs89AVXHIe3zczvzmjY10dIYooQ8JQGX003igjd9w+DOOgB8M/C
	1bmKjxF3nILRIez1Fao5ZkvzI8p4yNnTTvzm1Oue/1hv6fPgTxzrYQRCiZSM3P/gKtda
	4OewMP2R/AAxaNA01HULioTORjkVOT/6Skld9PLeah6Ou73pf+pCczBvve0ZAhlr9dvE
	m6DHvob+lyABMpoZO35XuT27ODdpf+tznhxPBZ1fk15zs8qp3lbOTNg+qVZtBoBXpw0G
	znCQ==
X-Gm-Message-State: APjAAAW05NaQtIwZb8OqtZlHOIrKxEI9VFEJktFhtewRe4uIsAHxEFFs
	qrW6P9Q8YYFoBHQYkSi/3I0+HoCipsfm/k0BirlPKtFD
X-Google-Smtp-Source: APXvYqwJRK/dNkR8TE0MslU2vQljqSKbN4b8uJgN52u+XA8TIiZLBK5n661GImO0fEoYsbmn68gJ0DTSuzH/O02m1Xk=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr30545049qtn.53.1570458633486; 
	Mon, 07 Oct 2019 07:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191001121510.1180695-1-otavio@ossystems.com.br>
	<20191007084435.GB18024@localhost>
In-Reply-To: <20191007084435.GB18024@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2019 07:30:07 -0700
Message-ID: <CAMKF1sqUh6FSsY7bk1MXurE52wYJY1=xSMksi6xCu6yVeFF2Zg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] modemmanager: Upgrade 1.10.2 -> 1.10.6
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
X-List-Received-Date: Mon, 07 Oct 2019 14:30:33 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for letting me know. Somehow this patch series got lost and
never showed up in patchwork

On Mon, Oct 7, 2019 at 1:44 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Hi Khem,
>
> this update got lost somewhere?
>
> Thanks
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

