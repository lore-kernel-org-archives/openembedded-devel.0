Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8033A71DDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 08:37:12 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id y9so26243643uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 00:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=o+lNLYRlnYgRjbUaa0PWf59+TmRjDWe5gL4RIb5Vh/I=;
	b=NmZXLR7nTOsb8rDiT+NNKlJjY7jPQjJXx+eMUkM/3Zo4SJyyW8uV6ySaax+80MWv0q
	/dRc2LUKWDHCp6O50UHQSr9MZ6uMtrEup5RF53rFUnc2jUcIWvWsf7P5yygDNm04+cqS
	tdrQBFhchavCe86+pKAVaf3JqeGJbuBel7SaFm0YsJr24hL66VqnttPPzBFFL5ovS1PI
	kTiBICBgH4froF8Ropn0gVPwFMJrBy2RT5vwV9FF84SG15e3R+M7yKVk8+jFlZ1NV5Lv
	8LysD7EyobswzglVJwCtM19Fbvn/Inj4hzfBfM+7CsasrDmVJD2xAomLbs+/h7V+nCRr
	Jhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=o+lNLYRlnYgRjbUaa0PWf59+TmRjDWe5gL4RIb5Vh/I=;
	b=ZJNFw+uog6aJcp/J7EkJWXWtOEONH0qmFqsXP78KDHasqgxo/MDmeSdGYpISx/Cezu
	O+mSSHGu39rI/ocpzQnTytAsNxyOM4nWNJy5NNaZBLvbZ/HJhLd8JDPF4C8ToS2Yy1K2
	cnLM3ChG0jmTmZeIfvPYT2URrzklPL6TENa/uhstHTXXSdWjQv513NzHpaadc52CUCht
	NGQvLKCJsIqP+kIoYKk3fJ+DwN4u0wM1JQpmQBR/sopE9m/rEjGfgEFJ4ArdDg5n9oKZ
	5mrO/6SHmtd/VpAOMCdW6EM7Ly7wDMx9ZoCzsbbV5M29b3i9aAq5VwD30D+AJSXL8zcC
	LlEw==
X-Gm-Message-State: AMke39mX4Q+KMz13aZagXVXR2seV0Q3UMSgp630LcSXxKJ2ZncqCthbGNKOkW73498EAyIFNOsTulcBj5uoTkw==
X-Received: by 10.176.92.26 with SMTP id q26mr2900947uaf.88.1487320632285;
	Fri, 17 Feb 2017 00:37:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 17 Feb 2017 00:37:11 -0800 (PST)
In-Reply-To: <20170206200039.32123-1-schnitzeltony@googlemail.com>
References: <20170206200039.32123-1-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 17 Feb 2017 09:37:11 +0100
Message-ID: <CALbNGRTd+UJdyorVKAMi=FBccmjb0YyXPvZpZwVnWfYiurH7YQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libtdb: fix SRC_URI - http has gone
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
X-List-Received-Date: Fri, 17 Feb 2017 08:37:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2017 at 9:00 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
ping - seems this series got lost - shall I resend?

Andreas

