Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id C42157117E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 23:13:18 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id v63so40810oia.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XdodXLtOo5mxQN2tkL96UoBkF21stlngzRug1kWiDQo=;
	b=QA5SFa9KCKuXei4bay9N6lSB8Pffii8kMkjazHJlTFt36vdyhe/Eue9FvcDt54lKNA
	j58pOhSACFk4nFlDLyUwA3wxmsoyki8CbPvHYfk8YObJ41cQc3XZm8uX2fRqcZy+NPtI
	+XcyRbX+3zznaJhMCc8vBTojoI91Xfc5X/e2s0rN/XsrG2ZcHRitPuJ+rSTcNGTg3d09
	OlM2/qCV7gAJpKSNmAWoKbAM9RG+NZF26vGQMjfrPp/h8jrno+tz8iMhKPA0dlb1Ykl+
	m+x+K3dIEpmIu+hxP7tGv9zACGNmFHzSAlCJ/uK19X5oX/jnm6VytGvk1tDEva3DCXV6
	/baQ==
X-Received: by 10.182.29.101 with SMTP id j5mr565566obh.20.1410995599504; Wed,
	17 Sep 2014 16:13:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.95.213 with HTTP; Wed, 17 Sep 2014 16:12:48 -0700 (PDT)
In-Reply-To: <1410921525-20513-1-git-send-email-b40869@freescale.com>
References: <1410921525-20513-1-git-send-email-b40869@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2014 16:12:48 -0700
Message-ID: <CAMKF1sr34LcpU_EGoG2MFdsSekarU7sGw9KaBiuLFkx9ggrDTQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Wed, 17 Sep 2014 23:13:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 16, 2014 at 7:38 PM, YangHaibo <b40869@freescale.com> wrote:
> +CFLAGS_prepend = "-I ${S}/include "

can you explain this change ?

