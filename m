Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 73E426FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:20:45 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b9so14599746wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 23:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ljX9AJCpBQeXmfJKpvulvlZ09Cpr5VTuCNHTYX1mhzg=;
	b=jirxLQ6pLMe+N3Toi0xqUVK0GUVtD/bQ18ChJsB3pZoJBBGp1DjUxV9GzKuxDIZunA
	AVXQX9p48ANW1iS3+m92eAqDC1iIM81IHo4QqeiJjj2C9WjT0cUoLyK2xxD8CWWiMVrG
	AGbaqhSVuH5gQShf6ZS6mq0S3UYItkehXvuYDhskMCN8ALaYy7pLMaT4mBFczobiGpVN
	Qwc1hkDcypz7fHiwAwyRXCu/4vO06qGHU7vIO0sWlEbacfgh607FOpd37FwyBY2OKTta
	qc1CCfADavmy8rvtfCl9FAGiaMOybJ05wD8qzpCA2CeieVipJdgEw4aYyLkW3TKhlB7s
	zALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ljX9AJCpBQeXmfJKpvulvlZ09Cpr5VTuCNHTYX1mhzg=;
	b=Vb+04WJRIfTTT7HsqvaC+32Uu/zgFbCDBEwJEHWjQKEYBlu5UxaZ0vGRy3Z4TIx9VP
	LP4SyO/eoKajbvIGc2fM6Gf2KDBoNnJILHo06SfZGGEoPCctvSYyEBcNv1+XSYR32y7n
	GY4+ppYfYm+YRK6EgokSdZ76k6RvWYgyLFYUqF9mCk0wM7M4TtxS1RWgGZlrTV6VoDeX
	UYOy0xvFKEEPOiOSJZZClqyz4RHwaNr2r5gZs70p+DbzYf8rV0Q/QEN11nCVFZg7goRr
	asqziZFYCT1iKRGBCSLG6ZD0fkxf46lN2u/AYd6BeOpBwPlY/W/bJXKTE9CZdupzpV3V
	2qRQ==
X-Gm-Message-State: AMCzsaUa0UhPVYJWC7CB2A63oSryI6jH9ErKeGZ/QY4DRMbXBIfli5WV
	BDGlIBmxNWtiMzfpuLHZqcSCVFFo7W3VFjTLktI=
X-Google-Smtp-Source: ABhQp+RGhboTpRfPx5wMP8W1ZPObUcFHRYlcEJ6w+b84ZC3MP9j474iLEKrDEMHQDb5k5v8dh7InjsMUSxyjvKFAQ8o=
X-Received: by 10.28.235.18 with SMTP id j18mr590491wmh.50.1508912446158; Tue,
	24 Oct 2017 23:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 24 Oct 2017 23:20:45 -0700 (PDT)
In-Reply-To: <82e2e61c-68ae-1c53-ae70-9b509ee0dfaf@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
	<CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
	<82e2e61c-68ae-1c53-ae70-9b509ee0dfaf@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Oct 2017 08:20:45 +0200
Message-ID: <CA+chaQetSQ6QYP0weCCw6DW2HPB=AuHduAtq8qcJY9YZBLrOaQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 25 Oct 2017 06:20:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 7:46 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/04/2017 07:02 AM, Martin Jansa wrote:
>
> As always, thanks armin!
>
> If there are more people willing to step-up and maintain some layers or
> whole meta-oe for master branch, then I would be happy to share it.
>
>
> After some careful thought, I have decided to help maintain meta-oe and
> beyond.
>
> regards,
> Armin
>

Thank you Armin!

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

Please send your key to Michael and Tom King.

