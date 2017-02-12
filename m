Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 190BE731CF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:10:26 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id t8so51268360vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=h+tgaIBeE8k/BGpUD8TN9hSdFbot8aCxlZA1p25URKo=;
	b=BUzV/qeLfyFmM5MIo9ik8lCseUXJvbN1GnuD8I/aM2lPho4/HBkudeAWGAxI6nMTK5
	6ybJFRA5iG0g1LuStj7UDx5mnIethhX8iLbQ0xP+mdJnswgim+InW0K3BC9FCPp2nAA7
	BPfDXcxjmuu+IgJbHhmjrTefFRIS9XF0JKl1e84sFbZe9dlPjcKsaVKPUAg1I+mmKy07
	hwig+CgT3z2tLJV0zR1DIdFqNxvJ9LBAkTKciMu41p1l5OtzTy+79fWXX2s4qboIV5C8
	d3Gh1pxW8hlUeaA1MfXzQs7iomnIplv2crdL63XFxtjcw7paQKeEsH8scX8L+axg8A21
	/twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=h+tgaIBeE8k/BGpUD8TN9hSdFbot8aCxlZA1p25URKo=;
	b=mdz0oYzDyjN4/+FE9V1mzDVEDUXNWt0bAM6qdm+BhjkxPZjIpFdGLBiS0sTSqO4nP4
	1bgzXpdf+ohroVQn2peMRdiZwjrJVc5cWN8WXAAzLWOjuKHqDaGDEgxWlmeYtXkg+6w9
	GQ6gjM/WTIFcyPCoYT68cAq6rxDm4U56xUhTrMUaZDC4BYXuZVchY5RQcfXoVMGz/dZs
	gbQyWifzFbvG+QxAW2Wq2YF9UTnwOgOjGXkX/ZX6N+x7R0L5UWmbHy0Rx8K7yHAB22+T
	JeOBd19cSXBPcX6onHivt+4STggHhu7edNBOfU0Fgv7QGPhlFzVqh8Zl6eQhzigAJ8kk
	BLiQ==
X-Gm-Message-State: AMke39lD7oadGxrAer/NSfVa3GsJctupgXD+BmI5ygL9tgQ+BQt68fk0aXOjJ13KmeEK0PmJlZ3EZjc4+HONww==
X-Received: by 10.31.167.70 with SMTP id q67mr9835153vke.135.1486933826858;
	Sun, 12 Feb 2017 13:10:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Sun, 12 Feb 2017 13:10:26 -0800 (PST)
In-Reply-To: <20170212210216.867-4-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
	<20170212210216.867-4-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 12 Feb 2017 22:10:26 +0100
Message-ID: <CALbNGRR5SdvVDbB5vKvPSEkqj+yuZ5fYkXommM5uG02xGdyoHg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 03/11] glibmm: add dependency on glib-2.0-native
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
X-List-Received-Date: Sun, 12 Feb 2017 21:10:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2017 at 10:02 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
Oops - this one slipped into my series. It is already in master-next
so please ignore.

Andreas

