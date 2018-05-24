Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9717458E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 08:16:53 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id 11-v6so669988ois.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vj3uRJk+JKDAsxGyKoGgcQKINNj6cFx6D1e95tXQwPg=;
	b=j7iNhC337Nl8E/4hV5d4DP8MFW4u09o0dWzrjmm4U+HxkiWJgzeZFY/DxbakeFpBOm
	WyKYU9PHEMLxKbNH9rSJyTP+ZoDS52/+jbtkkK1doZ0oXF9nKcYBU8aXtWhz7PeTOfXp
	3o4WAL9Lmn8lECl5mGdoS6GPvg0HoAXLM5W7GuCZH1eZ+OyobYwanwzrX+Qzrp0M1wCM
	zl7/lB/gZu1TprVoXFgvWVQBuOse2y/uHhtGqfOaYfsyLaSBxccXjkEGUyVOv8wQhVps
	EDPx+bV3fxX21xoxfW7sKQ4nRyc6QrMAOnGj/OafV11ddfepOOI+nH+Kh8inxTMVi82K
	O2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vj3uRJk+JKDAsxGyKoGgcQKINNj6cFx6D1e95tXQwPg=;
	b=MKlrA3kF/6qCWwZAXcr1BL4p6WY+/KThd+T2GcDFw05I/1abUa3aKg29jcAa2utw0n
	J83CHZsk5pbHFTo50m/EkhHvmH/DkFwAHE3FmMs7JzllHiD1cAgMKcXBiVwIbL+fe36J
	/4ET2HZ4bjE/BX1/gs4La+TdPH81lmQTqejR37R+E8YgGl2Ha9uDiqR0s0wPgbIbY/m1
	3F39Tjwukr64B76SlPPf6+kBrLpkZ0ofU/19PuEQlTalBkDQDCnw+NPBIcFWA3Cr4xFr
	6u2+SUoOwF6pdF/d7Wr9vrShtAOqsvAEFAUF8hdlKjjLqgHzmjOlQ2/stglqkWyIGqY1
	dcMg==
X-Gm-Message-State: ALKqPwdnsLP8fJBuf5PWpyvKP5fD+c9NjJML1W9pNyWxH/gzafEzA7lG
	ITE7g/IMqn/aIqvo3ugIkHDZSX8x6N+dy0q3BKE=
X-Google-Smtp-Source: AB8JxZpqhZKJqEnEKN3CzorheMRLKVylHsHU8I6qNmTloOnnlswHjFJx5XXBuL7QT2fRfxnPd464sVRXuj6XvFz1joI=
X-Received: by 2002:aca:af13:: with SMTP id
	y19-v6mr3566207oie.224.1527149814908; 
	Thu, 24 May 2018 01:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490b:0:0:0:0:0 with HTTP; Thu, 24 May 2018 01:16:54
	-0700 (PDT)
In-Reply-To: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
References: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 24 May 2018 10:16:54 +0200
Message-ID: <CALbNGRSBrQT7F0HwgozhZEscYL=BUti7ch+Ox_2qhVPmZx7vsA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] metacity: fix version number typo 3.38.0 -> 3.28.0
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
X-List-Received-Date: Thu, 24 May 2018 08:16:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 9:39 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-gnome/recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb} (100%)
>
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
> similarity index 100%
> rename from meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
> rename to meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
> --
> 2.7.4
>
This causes version going backwards. How about adding (incrementing) PE?

Andreas

