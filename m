Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 85CA36BE26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:32:07 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h9so14702757itl.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I7Q50vcMWfWgRPIeyy/NNNq71bGOuOzcMSk8n2bV350=;
	b=H5CVQORWYiCc+dIhnd70ybSzVCasx1OVRzHbm6/pE+wYD7nPa4sBR8D5rK2WQ1VEAm
	IrUm+VRnvEwRbdFVOYj+oLXeYOvKvFQYE6du3pcOttxbTkw6bDjJ9Vcd0xa4S1JIiV1Q
	yaSQDBPK3i7Lm0vnNago/Gs0+2T4/MuPQwn7guH3hHHnKPNlB+GTZYT718Ac5IQPG69h
	9X8BFhQAjnEnB8XCg9FkgE+XCE/WRbMSYDovoVOD3zwpX8c31NKcUg1gjR01QXl/sT0J
	dG84mKOh8CZ4uhx9OHe4u9M5RV1Le7znmnBUc+1WLiDgi9z5RAwhnJ6inQGLrWPCt4+I
	cztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I7Q50vcMWfWgRPIeyy/NNNq71bGOuOzcMSk8n2bV350=;
	b=Ke8F9za1dh8wRfolZuD8T6uQdSHA7a+oq+vts5Eg/2kEqW33zJlazUeNO8X9uZ4E8r
	lmh2XD7pKREHjp2Fpm1hkbQ6DBFyWA9tH+YCY9+BJE/L1Ffrc6aRJNeLVIzHtToV8qGQ
	j//0IlcvUQ2YPWJpOiLotGgxNaDIXaASxN5xzgemF0PX7oHaWdX+LYqR2SqlscbSDcCz
	/5sNQpyAt/xy2wH1NPP/I9+EOTK0AAyoxOnZm1EworlzFMpb3w+TPr2zArPx9eVDBfi9
	UbX11B6z+WSqMCaU4aJIQYFw3UCQaWza46lEvVGkpd+BnVNQD22HYzjiyB04PYhHEw4R
	BSoA==
X-Gm-Message-State: APjAAAWWad+Ga7q/TkQW/W1lR05pdzohFc3z+AHOfR0QwuHvdC/e4wI2
	ENhAF9VHPBXV09Ti1nBoV5NLsRewbljuWIqzYSU=
X-Google-Smtp-Source: APXvYqxkb0aGURRqHBPVI8d3Z3Robhqd65hj6voixUgt/qhcOii9irBsEr6G1Ae1qFetStiTYe9hl7gnN98NhPmfg7c=
X-Received: by 2002:a05:6638:1a4:: with SMTP id
	b4mr5292597jaq.81.1552728728644; 
	Sat, 16 Mar 2019 02:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190316080428.36688-1-raj.khem@gmail.com>
	<CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
In-Reply-To: <CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 16 Mar 2019 10:31:56 +0100
Message-ID: <CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 09:32:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Sat, Mar 16, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > xfce4-mixer can be replaced with xfce4-pulseaudio-plugin
> >
> NAK - it works perfectly fine and xfce4-pulseaudio-plugin is not a
> replacement because it is sitting on top of pulseaudio. Pulseaudio is
> poison if you want to produce music (alll the jack based  stuff)
>
I am tired of useless discussions - seems the priorities of this
project do not match mine anymore: I'll create a layer for gstreamer /
xfce-mixer and all the music stuff I collected in meta-qt5-extra.

So have fun...

Andreas

