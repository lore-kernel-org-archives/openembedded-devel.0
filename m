Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id E961C7FA33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:53:12 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id s75so6939291ilc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=keYQ8br5OC2lq1ftLPWTJ+Wr2oHnJlqI9VEI5HP+R9M=;
	b=eAWzf8qwcvTCR1wNx5FpO9jmbr8Uhsr1hTOQ2XML7b30M0H24EqVPUQmTyq7IJIDPR
	0pwOLQzrRpFXPffI4pcpDvorxrH3cnaq2DybQ1rs89IWnCsEEl/Vit3ziIQXN1bUZPl3
	v6pmSTL3mofIxIVLFH7BPVxhzOFqieOkEvOC7MrQ8bub+g8O/WSPJ/QM8lmy+oNonQ1D
	QWr+KuK/7idAqxbSFoxA/S96zCpI4nkiPbHj7re3xm9wWZQwpg4amu7QFyhVmE4/Wtyz
	BbKiElfPl3DvlE6DdNVPfMMn5kyMyD+6Il/CEbTpNFarL0T7yqJVaXDiTktsRqHCgpRe
	JOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=keYQ8br5OC2lq1ftLPWTJ+Wr2oHnJlqI9VEI5HP+R9M=;
	b=XUByhUz7eoomvT/C9+U2ckzhCrWWZBJLvCEnIzfJeGvU6ezXUeefZaKs1KwtXMh1Mk
	0kOn0WCCaLQJg6yaIjVIbkVAKaBbsS1Ck+YFGAhJHBhOUG7UJd+qdtpvMO3ad9nYEb3H
	hP7nrYXH70dlkhnypN8+3bI7a+QqBrcm3FhzBH//JIVfj3kUNnrtVvTDsgj3bmQuPfG0
	n9EyNSTcfDJOIdkfNdim4nJh6N5hNVdhcTWJIr+T6b5+DFIB8Zmm8nAdgSYosCu+gJCv
	M8KG3w7Md1o8+NwDY9+YPiNRahhxzNzcsT4mc6ISARGt2dWtP6wjZWgD9n6VFqXc6+SD
	pSqA==
X-Gm-Message-State: APjAAAVPe3594incnYikqaOf8xhKebJwh9Foopp6a+VrvVBfmPZDxKsp
	ffWv++MV2fFHCbKO+LHwdrQid79cx7echJv7+vw=
X-Google-Smtp-Source: APXvYqy9wHwYxgS2uC3wHSQKmUDTXqdCaEZC9oNdkRxvjx6hFD0Ztdl1KRvEady0DG+3cu9em/eD1tR1nIBEgKE3EuY=
X-Received: by 2002:a02:a38b:: with SMTP id y11mr9790650jak.81.1573771994025; 
	Thu, 14 Nov 2019 14:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-6-schnitzeltony@gmail.com>
	<CAMKF1spx9AWfa2xanQf4bSR5U_4_fo9-0DbBR+AfOTGoEC5cfQ@mail.gmail.com>
In-Reply-To: <CAMKF1spx9AWfa2xanQf4bSR5U_4_fo9-0DbBR+AfOTGoEC5cfQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Nov 2019 23:53:02 +0100
Message-ID: <CALbNGRRtar=mAGx3tLyAzxVsP9imUhxzgTzUWz5hyhd+fUqMkA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/16] gnome-terminal: re-add 3.34.2
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
X-List-Received-Date: Thu, 14 Nov 2019 22:53:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 11:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This fails on musl
>
> https://errors.yoctoproject.org/Errors/Details/275786/
>
> perhaps a patch proposed here will help us ?
> https://gitlab.gnome.org/GNOME/vte/issues/72
Wow that was fast - will look into

Andreas

