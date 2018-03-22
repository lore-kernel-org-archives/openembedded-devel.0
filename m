Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 66B0678862
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 07:34:42 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id r145so2515360ywe.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=wI4FCeNi8azWFUyh8T8ptCBu24rcfUUF84tVuSzzBzc=;
	b=PWlSAh89iT3GHDv/ygwQkLHKyXi+zsF6d/HoCVm5eIoPg9QFDxwgVBuzJhqLJlg8xQ
	AQ8nTYnz2h5lmzlaVh1yPG0WhLqDjsR9PdX69EaJ+0mMjMtlXA0zCA7DB00QLAUwBfx9
	aJAJfB7z8EAhWC70f5/KJB+QEnCJxVZ5BCISgWoSzOg44LJi4h75hA8O4DGUFsNYJSG6
	z8qgEJnhXbkPFm2TV2zTPgIJdfNDwZ8GixBGmhLQUtXI70xfyWdczNzwWqKqEXl6Yd68
	mbZuIF/WWjozdju2nC3QQbmpqUQ2DuK1Chg5vfCeiBx/q3Hsvmk+7z4XPjzlRDNmegrf
	DW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=wI4FCeNi8azWFUyh8T8ptCBu24rcfUUF84tVuSzzBzc=;
	b=Vm24qeDXHQ0DUMgwONYEhSloNKnq6Y5iHEHIWXHysTsQ35xAZPd/JE+zG9uJCgcQnH
	kwECP6s7tyoP0z3nupFzocjmjNx21Y6LXyQWCZp1FOsGkppy941qtUvHOaS1qi7wUPeS
	K9d/q9GbC0ZgtRU0uTkX+0qX46wcDydoAFqi7XiiDGqyj7RJrJ7r1Nlvv8hSHaONcSy0
	oglHkFtYxMCnNNBMnwg6PSFeWHFrvUJjTeBDM+OPbNykzz+gakMC59ftmxICH6FjDBKU
	FcIDmi1o4QybY46QtN8eUYwCsUqW8rhBA6XLhRXg6jv19lmAKmQKdzXUwBxZqzKyyuDl
	TbDA==
X-Gm-Message-State: AElRT7Gei/dyeqMVLcP5wAQCPSvXl6G63JSHomtO+yj7zwgcBpCvXE6W
	qBShadltgdUdRthpSW52qMM5uWZLLVDhzd1xyDI=
X-Google-Smtp-Source: AG47ELvBKW5n3sRPJqMdysfUkDF2EuUBc7VPaOSsl9DXzgMFnDkNlNWEkIdOsCxM76RR2mKjCu41B5mOSRrkAHN+8Aw=
X-Received: by 10.129.108.137 with SMTP id h131mr13422649ywc.180.1521704083248;
	Thu, 22 Mar 2018 00:34:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 00:34:42
	-0700 (PDT)
In-Reply-To: <20180318190833.1393-9-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
	<20180318190833.1393-9-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Mar 2018 08:34:42 +0100
Message-ID: <CALbNGRQzeYw6crWUC9vigqBK=m1x1=Jhz121-0Do0hjg1Ug6rQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/8] poppler: update 0.57.0 -> 0.62.0
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
X-List-Received-Date: Thu, 22 Mar 2018 07:34:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 18, 2018 at 8:08 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> * poppler moved from autotools to cmake
> * qt4 backend was removed
> * build tested with all and none in packageconfig
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 +++++++++
>  ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 91 ----------------=
------
>  .../0002-fix-gcc-6-math-ambiguous-errors.patch     | 11 ---
>  meta-oe/recipes-support/poppler/poppler_0.57.0.bb  | 55 -------------
>  meta-oe/recipes-support/poppler/poppler_0.62.0.bb  | 55 +++++++++++++
>  5 files changed, 91 insertions(+), 157 deletions(-)
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Do-not-o=
verwrite-all-our-build-flags.patch
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-mana=
datory-options-to-find-qt4-qt5-moc.patch
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-=
6-math-ambiguous-errors.patch
>  delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.57.0.bb
>  create mode 100644 meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>
Something wrong with this one or did it slip through? I am asking
because the other patches of this series were applied in master.

Andreas

