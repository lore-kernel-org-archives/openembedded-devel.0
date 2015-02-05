Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 83CA3605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 20:34:01 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq14so4677256pab.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 12:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eOwRVp9fyLvR/3pJRpRFklDGyExf6i3OqS0wfHhRreE=;
	b=QAy34rcSEUanqJyasGammmkfZP3EJLfK0idEE3lRtLOwYTQF0xLMrOjv4BGhhFPQvU
	0q5IJ/o8ToDx3No3/dzMxMUqlP8tg/vlOgUVFDr9NhQ9/IZfokKO37eQT53Iqx9LBVc9
	AUayuRz0nLcAAQseNQuOq+I9LhwDN4OWDzFAU0wlFnCPFrEsrbLH2iOdKPaak0H91e5z
	Lrt1b7tS4DfGQlR+NlQCSk2SDOGLxvz++VroBMB+pFRgzrOPfIrA/KVZk9sLuw4b7ha1
	w8K9m32TNeGzSLmhUzMFaMRbN8V0XBF9rzER52RSVygTgp7NOBuWE6cNnpe+vpWBQbdt
	kZCQ==
MIME-Version: 1.0
X-Received: by 10.66.197.164 with SMTP id iv4mr6048pac.2.1423168442095; Thu,
	05 Feb 2015 12:34:02 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Thu, 5 Feb 2015 12:34:02 -0800 (PST)
In-Reply-To: <CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
	<CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
	<CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
Date: Thu, 5 Feb 2015 21:34:02 +0100
Message-ID: <CALbNGRT0r612O8Yn+Vsn-3jCXk8i0yqhAc-Df9ukBiLRV5gRhQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Thu, 05 Feb 2015 20:34:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 5, 2015 at 6:22 PM, Raphael Philipe <rapphil@gmail.com> wrote:
> In my local.conf I used:
>
>  PACKAGECONFIG_append_pn-qtbase = "accessibility"
>
> Attached you can find the log.do_compile for qt5-creator
You attached log.do_configure :)

Andreas

