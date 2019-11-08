Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id A0D367F99E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 13:58:41 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id o18so5185838ils.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2019 05:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vW76M6ExSo/o+N/LPk7VFexYE3klmVtvkAUP+BwlO4o=;
	b=A3DdtLwKVKTmrl2xm1dlj2imD4csy4lBd7pWuVeoA/g9LugKgqmeq7t4RWpcxg0hdj
	s2h7yqIoqUgzyCbw9Adca1IcdDJdxT1zrTljGVtShLCC9GY+Y0gdrerzc/ssFqY1DZwA
	8Smejde4P12cPddqM8BtaGdpyZ6ezd1MLNxOzNmDtZlfNs9Kk94pXun3mrbrgsD6KhNW
	eCW5HuYKoHP3OedBRuCOjw5ENDr7PWAYCznTm0TiHoVYZd4VSOJyL+pXY2ZCA8xv5O+Z
	1SZHuyqiv5zXVPSpZ3LSmeILtcmvfSKy2XmeZWMwUyomzAfTld34eOMjNqJFRgkXm8iC
	xYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vW76M6ExSo/o+N/LPk7VFexYE3klmVtvkAUP+BwlO4o=;
	b=SwJSs0UaFGLFpAwfVWcqVox/ZcQEiKmTpH/BfOYhre8PDL72NW9Jy/UfWARqL1/QYr
	ZhQ59KfdDwrNZhwfK8tTZbcOcl/ZKuV+SJXlMvKqw9CPlTaWXuYh8mINzgivYta15emk
	I81X954enlMDFXzS5gOr0/sFvYKm2R0Dh6wpiIwSCHxB/XPmLJjcfS5XfbtbgW0I3Obd
	rAxZ6Z80r7GAlZSdU/sEOrxV00Ubafl4FPMPNUYtIlp/7kZxAuE73IdeMWRJEKMr7SJF
	aW8wgck5sImfuBwq0NDpL9QVu7zs6s+7sYq5Eg8hPsdoq/Z6dKu2ZTXVSQb4TgzAWHkc
	fwaw==
X-Gm-Message-State: APjAAAVI2TlxBjpDvvgif9BBKCd/35XpU1HA0MjVQJJRn9bsnUO5CQTT
	ijecaplie7+xJlSDLZ2p+naGVy7UlLAA+dcphT8=
X-Google-Smtp-Source: APXvYqxEnDKvTEswBqCb+6yK7tWMea3wjIOhC6ShGaQuN7oAYPD6DXsbgKgoZS9cxz+79B22AwqLX3sCGJslpdRKmIg=
X-Received: by 2002:a92:d80e:: with SMTP id y14mr13081260ilm.267.1573221522348;
	Fri, 08 Nov 2019 05:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20191108102237.34824-1-kai.kang@windriver.com>
In-Reply-To: <20191108102237.34824-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 8 Nov 2019 14:58:30 +0100
Message-ID: <CALbNGRTfR7peFiRnfyGUkgeDf+5R-zHg0Q8+-Y4uHSvbBpOeBQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch 0/4] Update 3 packages
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
X-List-Received-Date: Fri, 08 Nov 2019 13:58:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2019 at 11:22 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
>
Acked-By: : Andreas M=C3=BCller <schnitzeltony@gmail.com>

