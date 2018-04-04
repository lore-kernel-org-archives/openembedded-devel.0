Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 528F672EE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:27:27 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id p126-v6so2365645ybg.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ow8K9ynXCqeXsBa2xvcxy9s1V3Cq4fp4dU7Sy8uqufk=;
	b=UAc0t5jwuv4o8c9LBzSv5SViK/USOukkOV9IHPUXUP50NvCDGj3yrfDzPZED1XfMdk
	8Euo2oAYvrkKD6I8C8A4BwpTeFAQMnR7Sk2udRtaPTU7u/A4/a8LKwPagBV4RaAGEaiD
	+38pNedGglns7MEOS4DrEG4lgGVmwj6BppMmGK5fBKDXO8ZCp/uANBxfqrFaaQEpCRrc
	zNJZmqRtFEOsHd5+jPCGDnp8VehPkxvWa9ZUPvPaM6O3I2kiK1/8DVEGZTZMLsS0Vs1e
	psWrE5KyrUIlaSLwLk/ZbgKuXgahnuUL/6c2bQEzicq/7MjJpTaj1rQIKP9O5nDRe6+8
	TV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ow8K9ynXCqeXsBa2xvcxy9s1V3Cq4fp4dU7Sy8uqufk=;
	b=uKLjOUj2HGgfLnIa9u3Hf53Dkb3yvmiQoGG9VsI7HrVox/0K4y2v03KZOhjVpDdWeb
	hAL73A9Hg+LGh5DIwXQoY4EM8sdr10cXXsvAIZvzgdu947aIdRNA9EWae+16MGsZoDcn
	igEz2gOSqDhQPgiH8rUhxGwczgBLK1EGEoY7sqKf49u7VL5LhnECnCMRV6kxJI+BvoEL
	xVNARCUM1GHXBk+HRqFdWBmpL4cJJydpfln6zjhwVS0894oGb1PRU1S/S2+CixodAR3H
	diQ0XFj8HUIluhM79UZBz5n8zVh7olARAQ69NM2rNNwX5sQ0ntLbh6eAWhF+4DUNGkWL
	sqKw==
X-Gm-Message-State: ALQs6tBY1KQv2ab4xY5Y7s13LQG+HqZiwNng8W53wao1n+5Nd9xcYeMx
	EacAp+VEm8Tm7KH+5mo+jqO/TVFBa0/WUY98Q60=
X-Google-Smtp-Source: AIpwx4+mkr0JnpPOc7FrN/Vs7NyZHuYACxZIxdBAQNTEgHjERIC8nHODTRqdM6NKCx0tXz6frWcxWf9PkFi3ZNzenM4=
X-Received: by 2002:a5b:885:: with SMTP id e5-v6mr9867253ybq.180.1522841248638;
	Wed, 04 Apr 2018 04:27:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 04:27:28 -0700 (PDT)
In-Reply-To: <CA+n--H9LKuLH4frCgjVtz6yUrwZ83HOEsc4ob0gxzVY1Sy7=yw@mail.gmail.com>
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
	<1a96ea45-d89b-a5f8-ff6c-23abcbb96303@gmail.com>
	<CALbNGRTMzpTUAYsjv-EuJAB7aGd=TiJ83-GFGreG09TsxyHZiQ@mail.gmail.com>
	<CA+n--H9LKuLH4frCgjVtz6yUrwZ83HOEsc4ob0gxzVY1Sy7=yw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 13:27:28 +0200
Message-ID: <CALbNGRR5md+Wed1Myh2VmeGKgxr+SK0sTiwsqHJu971dRsJVQg@mail.gmail.com>
To: Bill Randle <bill.randle@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] poppler nightmare
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
X-List-Received-Date: Wed, 04 Apr 2018 11:27:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 6:51 AM, Bill Randle <bill.randle@gmail.com> wrote:
> I recently tried to cross build the current version of poppler for an
> embedded ARM system. This was not under the Yocto/OE build
> environment, but I never could get quite the right cmake config file
> to get the thing to build. Since I just needed it for the pdftoraster
> cups filter, I punted and built ghostscript instead. cmake may be fine
> for native builds, but at least in this case, it was a pain to use for
> cross-compilation.
>
>     -Bill
>
Currently I see two issues:

1. Resetting al compiler flags was never a good idea for cross
compiling. I've sent dozens of patches like this to many projects but
at poppler I had to learn my marketing/skills/patience were not good
enough [1]
2. on some environments (I can build 0.63.0 perfectly fine - but...)
linking poppler-glib does not find libpoppler.

Maybe some CMake experts around willing to help out?

[1] https://bugs.freedesktop.org/show_bug.cgi?id=105852

Regards

Andreas

