Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 98EA47FA33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:54:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p20so8706153qtq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mdqUitnSoeHHB+FzpnuIET+X7Wu5qJyvbgMPR1hlNxY=;
	b=F+X2nseZEEd+0Yo9aSYzx4PJZZeNynK2mBsUsiOT3gs5Lpo8crGzA+Ac4H1MJT0ssy
	qNElvq1BHms12MSQr4p4bVsb9RsycSdwtKMin8xVsWnyy9dlMK6/RGhJaJAxTnvGgjDM
	Ujk7xtivRi8B3EGmh4Tl72EramTNqn0Nh2RPHjHERmLKexXIVEvy7/h97XUsopnIUXO1
	03pNaG3B0nqDpoWTgy1Xqb9MZaEPgu0jVtqeVpbW21scTpYNf5H7JV2v4HFX6AEEcAYC
	zAU0ssuImXid6sn6Whb/qixkT6vgq5ImABoJ/4voY64IYilgkDAIwAJBbNFbIl6JyJW8
	W5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mdqUitnSoeHHB+FzpnuIET+X7Wu5qJyvbgMPR1hlNxY=;
	b=rb+oTA1N2G4YXpox8AeKX2fAAlhRSLak5KwLqESVovDwBhu+ofnu4dcgKxpt9fRT4K
	YJzLlP7c3Z0gqdyY0cAOrQk1bXP2z+UuWGFr3Pj4oh5tVv6jZILuvDU2rFyiEAk6iKX+
	rENPH5B65GjUqp+txbH8dQeQ8n3zkP6ZR8NJYu6pd6KuIDl7Rg7s6/K2N7RoC6Hjhl9u
	T0mlTd8hZ3jPcge4DMsjakSaPRxZ3MLoA1z8/oKrq/OdoyaBk+hfWbfkHbtqqLJgP48x
	mQMpnXyZdVN89KKKmQOlWqlNeFXmkksNoC6ecxHMQj6WxwdzyoThkjXi335T/8hU8UvX
	zUhQ==
X-Gm-Message-State: APjAAAXg6qKKkHH7lxmf2d9Hi5upU/FNQvua0MxZ2kl0T672xifLhogX
	5D6uVslKE/EUUlRsi704V95JfXownVn6l3mXAQw=
X-Google-Smtp-Source: APXvYqxtjMT/XIEsrQ9jmIeUPWgb/puvOZvMeUjH5P9fGzHKOUtGULycE3xhYlPpWSnRT1QQhFl2uXDI08MKoYB6MH8=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr10590827qtj.80.1573772069531; 
	Thu, 14 Nov 2019 14:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-6-schnitzeltony@gmail.com>
	<CAMKF1spx9AWfa2xanQf4bSR5U_4_fo9-0DbBR+AfOTGoEC5cfQ@mail.gmail.com>
	<CALbNGRRtar=mAGx3tLyAzxVsP9imUhxzgTzUWz5hyhd+fUqMkA@mail.gmail.com>
In-Reply-To: <CALbNGRRtar=mAGx3tLyAzxVsP9imUhxzgTzUWz5hyhd+fUqMkA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:54:03 -0800
Message-ID: <CAMKF1sqZ6oe6EDZnf02nbqb3C7HmhAOLXCvnG4KLzugBTms1ew@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 22:54:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 2:53 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Nov 14, 2019 at 11:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This fails on musl
> >
> > https://errors.yoctoproject.org/Errors/Details/275786/
> >
> > perhaps a patch proposed here will help us ?
> > https://gitlab.gnome.org/GNOME/vte/issues/72
> Wow that was fast - will look into
>

I have already destroyed one SSD on my home box :)

> Andreas

