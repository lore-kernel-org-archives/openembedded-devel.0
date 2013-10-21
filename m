Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7E16CDCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:32:22 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id 11so1829875vbe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gUDzYHJEv06Cg9l0josF2htpGT7mOJvXxpuRjxeFgDs=;
	b=nG1Iewt9c3W6z9Lf45q6SKvnuyMqdo65BlpFGwKTR0I+ykNcXOWQd1LDMgnamSTD/P
	z+WjzBERoIvJZ3LTMM9J40dOopU1oXCTc23F32Od2G+NbW44/VzbktA3qB0v1tqieccf
	vhn1jiCjPCsNrHL36BSzbcHyKw3cUN3OO55Shaxe11l4OLwMwXdk9cjF1Xfj/fzwGE3T
	jqt7ZVSRpYxndGvfL2G/D+Vze18iR9i9ChNAgSHcNiPd5atWpD5N4X/s7yT5zb+pCeVP
	PnwP1DgGR5nkoT5Ifq3uiByQlH06J+ZeDoqYfwoRIbfWtU8iqvHgRH/llHLMdAJdEPGE
	cvkQ==
X-Gm-Message-State: ALoCoQnGkD0wq3iivZNeX2cmi0SnG3QffLcNU/dXWOCPVdkV45xTYucKG0XQlzAE5amVI68shFEf
X-Received: by 10.220.164.202 with SMTP id f10mr325581vcy.25.1382344343652;
	Mon, 21 Oct 2013 01:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 21 Oct 2013 01:32:02 -0700 (PDT)
In-Reply-To: <20131020194345.GB3709@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Oct 2013 09:32:02 +0100
Message-ID: <CAJTo0LaQoFYc601yo4K+OuPUJa2Cq9McPH2nt+41X+EtZQgkUw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 21 Oct 2013 08:32:23 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2013 20:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> libtool-cross-2.4.2: libtool-cross: configure was passed unrecognised options: --with-sysroot
> libxdmcp-1.1.1: libxdmcp: configure was passed unrecognised options: --without-groff --disable-malloc0returnsnull --without-ps2pdf --disable-specs
> libxau-1.0.8: libxau: configure was passed unrecognised options: --without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --without-fop --disable-specs
[snip many many more lines]

Well at least my QA test works. :)

I thought I'd send patches for a large number of these already that
are in oe-core, but obviously not.  I'll definitely do that shortly.

Ross

