Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRmF0-0001gK-L8
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:54:34 +0200
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:41:02 -0700
Received: by mail-ia0-f197.google.com with SMTP id j5so5090899iaf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9AV5moaJNTNXZy7AFaAxgxxedWNMhHOnlgr9W29L0ag=;
	b=Ll6a2KPZtFgZQogT0bv7bjk7Mh5o7rvQmyjSzwr53rWVc355cafd4M9CV4qbwWFJ29
	94fGE0xNX3KlEn9J4tjiv2c3CNHmifeJ5UUx0lIAOV0zXGdgoeOrI/v/Z/3gJ2clsaGu
	g0FfnlJF88Vur262lfF9ccE8LtmcejV/lfY+a2B9M+dbDUHemK/ykph03EfCLSew3sXG
	cDFTowZlmnPInt+Xg7Oepdw/3gDNEnR1gmeXM+/llv4kpP6rbjicPbihk+iZOVul+tzD
	lOn6l6dFXCIK4GnUdc8zbzOg+2c/k1/jh/kxqsAofvvbVvZ1BWLs24WW2XkkBgV26z+T
	Yh/Q==
Received: by 10.182.0.1 with SMTP id 1mr18593027oba.18.1351266061940;
	Fri, 26 Oct 2012 08:41:01 -0700 (PDT)
Received: by 10.182.0.1 with SMTP id 1mr18593018oba.18.1351266061844; Fri, 26
	Oct 2012 08:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 08:40:41 -0700 (PDT)
In-Reply-To: <CAP9ODKoZXu2dbvrhGDegKsH+vDEisgtf7r2u6TcBwYy2ZEPHDA@mail.gmail.com>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<k6e9ht$ra9$1@ger.gmane.org>
	<CAP9ODKoZXu2dbvrhGDegKsH+vDEisgtf7r2u6TcBwYy2ZEPHDA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 16:40:41 +0100
Message-ID: <CAJTo0Lb3_R+=uX-QTE_60pQ4N=xNS0fqCZ3jiQLhAZZaEotFgQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnZ/XRMiUoLNa9PhoK9VtBn4evSZTaQxpw1eUokXRnWFxSYZvaodpm2rMT457NGf9Hh9ve2GyS8piXgJz6PRGH277wozyesUd5ExEcQNctUHxjiYjW4bEA6N2sL/DCC3V4RaCeKFmNHVHHDjYOISLtCK/lvvhkaUxMAz5xg46+59PBGSDuxnvovNvZrtit7xBUqGNMF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Danny stable release branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 15:54:34 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 16:35, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Who's the maintainer for the oe-core danny branch?
>
> I hope there's no delta between oe-core and poky one so Ross is the
> maintainer as far as I know.

Correct. Poky is literally oe-core+bitbake+yocto-docs glued together,
no work happens in the poky repository directly, just the "upstream"
repositories.

Ross


