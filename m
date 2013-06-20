Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB99E6ABCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:33:55 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id id13so4771265vcb.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=hzlnB9UUPMpQsgpviMCePdO8Rd2nrfFN3KJbd2O+7cE=;
	b=o1nLmAeu6cmAVHTHIt1SGfkJ+z0GPBQ4eMG5aSh4FZyf8ANr2Mhcyq00eqmdnUUCrU
	qSHJBzA5X3U8MOww91F5QD/j88TNZAeKw3oQIE0Ot+NtWp2qheZXvOgGyEpNiIVCmP4q
	98m0pxMLEsoy3M8y7tEAGqpo7JXAANgZn4Ed+YNhJ18TLCBD6jyqXvsCNsLWQNbV2qrb
	zGFR40Gwke0H/fhlum8Oyb2ok+Ea+cBG9dIOEo+ZVgxKAf+I4EQpwa9HHtKx0zg2HGut
	P4hh5vrBKluJmhqVJ+Z98SVu7rs4wdJ9/9LFDTp61uXz8xtZdU6S87VLliYw4UWk37d9
	1iLA==
X-Received: by 10.52.21.232 with SMTP id y8mr2504842vde.6.1371735236679; Thu,
	20 Jun 2013 06:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 20 Jun 2013 06:33:36 -0700 (PDT)
In-Reply-To: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 14:33:36 +0100
Message-ID: <CAJTo0LZihzaB0VbD6fHoZMgXmCNBLWwQVcgZmBfZ=7-xXmV-iw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQl0jgFlDuMIC6UoJ2NIAlDPBpC9e/UQsyLUwd9fZ2C7mDXTfMBZwGF/3Am4GJPo894eNLmj
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 13:33:56 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 14:15, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> Would you guys consider 'backporting' this patch onto dylan a viable thing?
> I will make the backport, but it would be nice if you can confirm that it
> can be merged in dylan.

One of those patches is actually being debated upstream, but more
importantly this thread should be on openembedded-core@ (cc'ing Paul
Eggleton, who is the Dylan maintainer).

Ross

