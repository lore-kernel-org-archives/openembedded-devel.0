Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE6CC71993
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 14:20:42 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b186so1959818vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nKY3BoxVTBYYMh3U9fYcazqTeMFaZZBUuBwnkZKN128=;
	b=0c9V0x0+eCtJAxZHZr3khMEkgI8mv6dLp6/lKD9R+QJjyV/m1Tx+vlfEa6ku3u7BYM
	7b2rgAM0sKEwtMQhQV6hfKSFlRqz3i2XKbOVtc16lW7y20uuc0v6XLR/LvH1/jTzP6ml
	spQh6nPJ3Y/L2HBs/J2c0WhcbdoUBi6Lul541W0alWCPcTxgZ281sZSEKGGGCKulUda/
	EZ11huuW/hbGn+ooyXi0FRqZxkwcXqomk8fzlyWvDg4ets48FhSxVILHaIriNn49b9QP
	wNoE+JaBcMNCwQxsF+LBImGUxhUME9rn5OZBFgGqpUSjoknoKFUGNu6lKLxq6HRlWn7+
	JWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nKY3BoxVTBYYMh3U9fYcazqTeMFaZZBUuBwnkZKN128=;
	b=ZpmcxVcDxuSZzRh9ciJMVmxcyhZAxXYnsT85ZU0P4/FqfQkSBD91Wi3/q4rMb8pItr
	EMIyzULpZ5nJRAB3XRRv6IHlVIUr8jLdbRK/VCdHMZzNRDJOOeEx+8RGMo4Eube5RdBh
	geSxVoCopCymNt31LIkCQoNqJMDmnl0Ow5N2RvsqjMJ1+k7fZ9pdMt7JhZQVm3Xh723Z
	aHZbhe3QtJ1diM6aG98UC3qcI2gG20s1boHfOaEdmv05cciaVOyoVwzCe/QKRKptQu0D
	I7d5enMJNzsKRVjE3GmCEyaDLPnjcCO9ltCHK2eUiZozRmzwgcGAtbVvXu8w+CbrddG5
	1Bkg==
X-Gm-Message-State: AA6/9RmCsy5JGjOztU2Ph+A6CjOnIS2N0iW7hCziggGeZ/jJQACUS40S+DjZAmh4+Q0NPj0JPAzf2X+1+BTP4w==
X-Received: by 10.31.128.2 with SMTP id b2mr2792013vkd.81.1475850043747; Fri,
	07 Oct 2016 07:20:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Fri, 7 Oct 2016 07:20:43 -0700 (PDT)
In-Reply-To: <1475841300.2264.14.camel@gmail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
	<1475831964-1993-4-git-send-email-schnitzeltony@googlemail.com>
	<1475841300.2264.14.camel@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 7 Oct 2016 16:20:43 +0200
Message-ID: <CALbNGRTPWXSFgYajNvGbvXXb-qY4A1yT=6W3-QUwS1JQ5o2=oA@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/5] florence: update 0.6.3
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
X-List-Received-Date: Fri, 07 Oct 2016 14:20:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 7, 2016 at 1:55 PM, Max Krummenacher <max.oss.09@gmail.com> wro=
te:
> Resent, this time from the correct account.
>
> Hi
>
> Am Freitag, den 07.10.2016, 11:19 +0200 schrieb Andreas M=C3=BCller:
>> * patches were either leftovers or do not match the code
>> * DESCRIPTION -> shortened SUMMARY
>
> 0.5.x requires gtk 2 and gstreamer 0.10 while 0.6.x requires gtk 3 and
> gstreamer 1.0.
> Would be nice to see this in the commit message. I guess gtk+3 also
> needs do go into DEPENDS, see below.
I did not see that there was a warning dragging in gtk3 - patch would
need update
>
> Maybe the move from gtk 2 to 3 would even justify to add a new recipe
> florence3 while keeping the existing one?
1. I updated florence because 0.5.4 is completely useless for me: It
moves around after each hide / buttons are improperly painted.
2. I don't like the idea of keeping around different versions. By this
we stick on unmaintained versions for reasons out of my interest.
3. After further tests I saw that 0.6.3's has other strange bugs

=3D> I suggest we forget this patch

Andreas

