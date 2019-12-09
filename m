Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3957F225
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:40:10 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id z23so13789959iog.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZPvBY4u8OIu4QDTg2A1vewztEKtUnFZHHDM7a0J4qtk=;
	b=uToECeufQHQPv75+616raGXFDyRgmR64RI6K5hF31DfoqsyWrva8LCnNX5byAeE5iU
	rq+9SPAn/RQ3/qE/lBpPg9KcT/ufmojauIoajdxEoBzSXf5HfjKpZi7hfyhroJ8Dpkwk
	LoMa4Cx+5PstoLCIhL1r9kM4jLWkKSxNJocd1ca9C2pBsRkb5xJFpwTy3SW4YbHnZKxJ
	YeIdL7yjAnS96IHY2Ecirg6dbRwxOPM2HTOEwJktO8jDzfAX3kjYff4b7a5cJF/29EgI
	0MKEurQ2IaQyx1t/ZJjPXQtXy6DNyjfKMFmJWnkO+lJp1UFs6iuiDo+i5m8CO+TkXzC9
	zH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZPvBY4u8OIu4QDTg2A1vewztEKtUnFZHHDM7a0J4qtk=;
	b=pQEhJYSwXbmOu8OMTr5v5wCDcLpKnIdXjl6Nu3Xp8SvWknL612Ga3wWvAo0/SQbIDq
	3JW6fEeE+MZLa/nbvWeM4g+V/yVu546Fjlvrpv7rY1ygpQmBT4FhRnqq4+d6xkmDctkE
	ZJ5wFIomppMxE4TZXBlxwTswZj+j7cw/zYnOT040QvGgUVZCoO5BwSFPG6EQfwPp0MtO
	179NyJ6mKMbeYwi90YPXCvWHiG8yZeK2E6IzLLqlf1UVioM8gBvjxithPvxEo3GKem+G
	ZjKtOjTp29n7ou/PM0AKjvghkfsVDoQovcRYYLkC3V50yDTWR2RGHalgfflGxShmS8Ba
	Jr4A==
X-Gm-Message-State: APjAAAXHmKVZMB08hyxg16OLHs1CB1vzhxShRAq1A3Kb8MW+ZaUYXmdj
	x40ymlfCmjh7AbsQTsOPH5EC25DSSMMKGHrALriMkA==
X-Google-Smtp-Source: APXvYqyxX6JdJNoFVnSivw5bpj9gt8LpMRpB7MmBhgEhWNxKZyDh0IAsJ0YyYhvLLkeSMwO+4mZWaiuhvM+HKaLPXls=
X-Received: by 2002:a05:6638:151:: with SMTP id
	y17mr4409013jao.124.1575880811404; 
	Mon, 09 Dec 2019 00:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20191118014035.15189-1-kai.kang@windriver.com>
	<CALbNGRT=hGkyD+ht3DfhAKooTo-g9w6v23cyyVJm=HX8XA1zxA@mail.gmail.com>
In-Reply-To: <CALbNGRT=hGkyD+ht3DfhAKooTo-g9w6v23cyyVJm=HX8XA1zxA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Dec 2019 09:40:00 +0100
Message-ID: <CALbNGRS=Nzkq9V9xxHt8HxPzGKwc9oAOYnhOY6WtEojtN+YsPg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch] thunar: 1.8.9 -> 1.8.10
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
X-List-Received-Date: Mon, 09 Dec 2019 08:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 8:55 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Nov 18, 2019 at 2:40 AM <kai.kang@windriver.com> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > The tarball name uses all lower case now, so SRC_URI and S are not
> > needded to be set in the recipe which have been configured in
> > xfce.bbclass already.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> This one seems to have missed patchwork. Nevertheless
>
> Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Does this need a resend?

Andreas

