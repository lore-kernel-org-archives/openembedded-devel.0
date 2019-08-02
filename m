Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6A08760291
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 01:14:49 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id l9so72261530qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2019 18:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3oN6p9mtDT6kLHwTVIr0UN3W5LwPtKBXiQXaGH32pfA=;
	b=PqYFXJ8pR5YvXbTSj6X8gA4FqlanQ3sKPwhRo/XC6CGpn/+T9NlAeNqHYaRlZJdvlA
	lWCqWdwJ9l2MInSdFlW3w5/fx2O71mB3nlZyqZdmnrbe+4bXd/dkLH3srIWkDqIfI2Ev
	bUqhie7Ap/POZkgePW2Y2GVqVJjvYq2EsM+aUh3FV3Dga9ykRW6vH8ZKPiGuaHba1Spl
	0iN31HE9hRBOkGUMCeH/v7mqM4Y8QZBbUMVkSPI4TRo+P7cHUg2tcXUhhCSLxR6NAPDe
	XnAw/cBU0uOcFRVI6fqlbSUF1tm8FjkWUbr1VFyeaW1OJoE+ir6rMeFvRDY7Mp5cYZuY
	w4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3oN6p9mtDT6kLHwTVIr0UN3W5LwPtKBXiQXaGH32pfA=;
	b=ud14bXWdInjp7nqAQIlGRm9/piBB/e9YYNY+siVtlcTh3lLmAfLK0RALip6dzFua8f
	aO3CmCbsX/PR6HVPoUH6khmLFF3hvW2rh4e2x4/YJPehTzWjFhihssygLwbTXcMUJ56T
	583nUTuExvVNe7wWQEEn5LTu0fA7RhOs7EXe5NizPiGPDiTCLsCBmA4tnn7cdPUlcp2Y
	b09VRI6krEIqFQmCgIBuq9uNnb/xwALKu6qtkQh4yu9U54x1OeIva2zZbo6Abfkj8r/8
	SQ/fZMRKS8IK4jem4cOISG9TkOXpBHMGCJwyq5F7OAnSEAwVeLjy9m52jxgG9jYzIScf
	s3/Q==
X-Gm-Message-State: APjAAAUUXH0KvWjbRaBIhKQTDm2+jQvrmLWEE9lMoDsKKYYtglKR8cfZ
	9mzVk1QmmCe6Khla48pK9gpFQLSuFDeNNK6VZrlS2esh
X-Google-Smtp-Source: APXvYqwSToQjK9Ak1U4kqyHGVzgym9Oy/P52vdw1J8zP1oF6bcma2T7zmW+TZEGWa4oYZw89HeuNB6Im2s7QHp8AFUU=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr92849029qtn.378.1564708490064;
	Thu, 01 Aug 2019 18:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8B602@dor-sms-xch01.digi.com>
In-Reply-To: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8B602@dor-sms-xch01.digi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Aug 2019 18:14:23 -0700
Message-ID: <CAMKF1sqBCN8D_dk_s6GL2-5EXKRsyZLgDzS8KxH3STSd8TiHHw@mail.gmail.com>
To: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Fri, 02 Aug 2019 01:14:49 -0000
Content-Type: text/plain; charset="UTF-8"

I dont see the patch anymore, can you resend it?

On Thu, Aug 1, 2019 at 1:08 AM Buzarra, Arturo <Arturo.Buzarra@digi.com> wrote:
>
> Hi,
>
> Any feedback about this patch?
>
> Thanks in advance,
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

