Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E3FBA73CD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 19:01:07 +0000 (UTC)
Received: by iebmp1 with SMTP id mp1so89464077ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=FxR1Xsnhvle2v0fyZlgvh1+D0i1ZG6U14bfhdY2z6U0=;
	b=id5UqeKHRWcEnduZhHng25BQmy8ul1mctj/TxggPqapG+W45Th2YpQBgSwwX0hlU1N
	Y+3Z3weoJ1wpTjKX0LkaPkKzexFXvBOhoLGqcQKEi3Hsh5ZjqTUDL1Ku6byLm8Fw6K17
	KbdZxSpZcvq3LKYi6xp8OOkQiXgWR7PWSsJeNKcwaPLoW/p0s0450HifQ4HthNMFCB//
	NgAYXYWBH2TSifUueNDV40wQsLeWBo1aC19vBet5fX6sLpaF4Nzgv/k5+dRifialfKcA
	sP9iIuNnQ4JNQsjXwG15LQEpn9TIv7zzJ2MAmr6pjDIiIv9lw1uWdQ/F3iBfjbIQK+tl
	YssA==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr5941515ioi.1.1428087668710;
	Fri, 03 Apr 2015 12:01:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 3 Apr 2015 12:01:08 -0700 (PDT)
In-Reply-To: <1427988182-26274-2-git-send-email-dmitry_eremin@mentor.com>
References: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
	<1427988182-26274-2-git-send-email-dmitry_eremin@mentor.com>
Date: Fri, 3 Apr 2015 16:01:08 -0300
X-Google-Sender-Auth: KwGsh2cCHj5SfJhT9bLsyFrGtns
Message-ID: <CAP9ODKqxBzYOoLAX7+NV+6NgM-FHJfvNcj2Tz8HbfXwt_x2aug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 2/2] initramfs-debug-image: tiny debugging initramfs image
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
X-List-Received-Date: Fri, 03 Apr 2015 19:01:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 2, 2015 at 12:23 PM, Dmitry Eremin-Solenikov
<dmitry_eremin@mentor.com> wrote:
> A tiny initramfs image suitable for initial bringup of the hardware.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

I've been using core-image-minimal for this purpose. What you think is
missing there?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

