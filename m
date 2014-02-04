Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6B26E8C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 08:41:36 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id k19so6898377igc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Ms+yWSXU9d4vxad4QuqQ+ovpYRBQKVZagd3ZBipyX+I=;
	b=QLWNp228gD90Sge+7VaWAbde0f5sdKw3dnE9Oqybf+xljXspac2znCsYVJYqd9JrG+
	PEWR2MhF/sBcFTmshvaOO97dPvHK6YjNv537yHvx0XIwfOFeanzkM3uGCk9R2qcRQl+g
	ptofD+8WBQeXHdxUJj4R3k1h/FiGJUVm96eMp5nr57Qx5FbOpFlDSgXUGrpM0s9ReJtt
	Kk6Qq58esKXXpY3PDqP8lkwgyu5qVHfGn9SspDnB4BO51Wn7xJWRXCDp0rMGsGtO5Mmp
	9kYKTdWuw9J189g+Ki/u6MVcAoGSrD6xvFYLivQzfHAHW6uf9DU8/gB4FgBxy4CehsQi
	DA6w==
X-Received: by 10.50.79.138 with SMTP id j10mr16423487igx.2.1391503296843;
	Tue, 04 Feb 2014 00:41:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 4 Feb 2014 00:41:05 -0800 (PST)
In-Reply-To: <1391434743-7672-1-git-send-email-Martin.Jansa@gmail.com>
References: <1391434743-7672-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2014 00:41:05 -0800
Message-ID: <CAMKF1srzyzyLiQOv+pYD6+j9PnBNbKXvFaE0czTQVie0Oz9RSA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-systemd][PATCH] busybox: rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2014 08:41:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 3, 2014 at 5:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend}  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/oe-core/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend} (100%)
>
> diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
> similarity index 100%
> rename from meta-systemd/oe-core/recipes-core/busybox/busybox_1.21.1.bbappend
> rename to meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend

Looks good.

> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

