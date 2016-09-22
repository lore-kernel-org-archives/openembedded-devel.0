Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 197C56093A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:19:29 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o3so152881099ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HiEbfZzzwvuwIKrvadELqLDBZYTkxXZYGnZ7iNjglJw=;
	b=Denp6cpu1QzMjyoSwbhdpIxKCAuBLyhxsFSPFaaUHoYrUCUvbTN10FncDxz/v7fBsy
	MSqdPF5gtoslBKRQQhSEvtJk0ymol1qXBDjUlKxw4Uf30jDk0zaOKzGIw3JtC6F8hVTy
	DMkgCkHUHhYqWo82cdZrh8szjyX1fpfrdcZqamjr7q/w7ON5R8xid0tCe5CqUaGtmid5
	FQPYzBy2GLdBLJiJRmo9j8GuOht4IPWmH14X4kliwOr48GgsHIU5Yf4hy5JgwAvMRQam
	crc21VpyNCcruobBevh9okolvq+xwOh0ZnsolK1KeNqkJtATGXdx1CTixVeQLriyHouA
	QIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HiEbfZzzwvuwIKrvadELqLDBZYTkxXZYGnZ7iNjglJw=;
	b=O1kOCfys2AqzD4/1iEPNKahybHNprNAsnK16xrJv4O3ObCDlObe73YdBQq9JEcE1oy
	Es6CMA0zHGlO1veVcuawttdHiIVmY4xJVvMqGxfZmA5yXfmBNV2xhYqn3U8YJ2rkapDK
	V0aqjDgSyuGKPaP75D+wqUJmxJHsYy1ZNwc88Fy3L1vvl9ol9zmGjzDvN1GJCwgoI/RO
	plPgq6Wz4t2EdwdcEUZ32HdYxB2x+DU6NxKyuqlzQoNqYXDRj51ApQQC1aAClFSjhgjr
	1Dji83jYlQMdPM5DR7cBeGdAVWWTLtP+arS7tgG8Em9aWKd11qnQSmjaHSyUYnZLoq+i
	1vog==
X-Gm-Message-State: AE9vXwM1te1frQmi5R1bD/hXxakbfMuro0zhqNAFegQ2Qsb3h8UozNhT6ua1opNlf52WRqZPZiqMJZu1JxwPBxB1
X-Received: by 10.36.208.71 with SMTP id m68mr1819001itg.104.1474539571119;
	Thu, 22 Sep 2016 03:19:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 22 Sep 2016 03:19:10 -0700 (PDT)
In-Reply-To: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Sep 2016 11:19:10 +0100
Message-ID: <CAJTo0Lbfvn2UbvYU8vH6WZEzJTv0JLsKMT5H9bjZqjCH02zP9g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] portaudio: has MIT license
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
X-List-Received-Date: Thu, 22 Sep 2016 10:19:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 September 2016 at 21:38, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
wrote:

> -LICENSE =3D "PortAudio"
> +LICENSE =3D "MIT"
>

FWIW my upgrade patch last week incorporates this change.

Ross

