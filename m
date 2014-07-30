Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7DF70961
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:29:30 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id at20so1933543iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iYyrbi8Q8PriQW7GwRQmVPfTt/bSUyeoPQJYMfGy0H0=;
	b=Za8WnOfWwEZ68I/QAX/0Xceuc0dH0oqpSZdQvc8nciLcU58rQtGtFuRG59aVYAkuya
	cZLXY0jEKOx/pqdEiv3uu17d/pGOwMA3lam4pS/w4OWc/sjm6MG9XJmXUZN/94thQ2c/
	O6P5lUiAwE88lDSbR+lxPQ7MY+XUz5xwmXS2wU4mo8RtZMZyl1K/+2mt0ztQ2ezbzAXW
	JNdN0OADuryhPh1lY58Eg0e7+tIw0TeqavH4yq87KQg7bJtbxooX4v/lKmSXSqqgC3D/
	IbKI1iPCmq26ktx3DSSl6suOnZTb6xhjFKvjUNRVyjgVXELmvM2N88x83JqWsXMGFWNH
	Pyww==
X-Received: by 10.50.13.102 with SMTP id g6mr9996208igc.20.1406741372173; Wed,
	30 Jul 2014 10:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 10:29:01 -0700 (PDT)
In-Reply-To: <20140730172323.GS16445@jama>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
	<CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
	<CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
	<CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
	<20140730172323.GS16445@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 10:29:01 -0700
Message-ID: <CAMKF1sr+ftWMFsPR_sX0io-ksrwbuYp2WhN9PyfWe6FyVGg6BQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Wed, 30 Jul 2014 17:29:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 10:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> For you yes I understand, do you have say of other folks who use this layer ?
>
> He only adds the option, it even isn't enabled by default, so FWIW I'm
> fine with this.
>

oh its not default. That was an oversight from me. In this case its ok.

