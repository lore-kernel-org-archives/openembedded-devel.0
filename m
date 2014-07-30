Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5B36ACD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:43:44 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id at20so854171iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=eC5eJcVVjdHGnPU7zAUkIrB7qNWNBRkpDj0rNQ+9KBs=;
	b=qRy2LwWpQnzogwi9S5lFVUJzNArPw2DHA1jnZlB5c5XPrhpEr6g6rV+NZBDNCU5sEH
	z53bwuciTS0U+3IXZLv4qZj0K8GdLlbu5haozVXO9fydGbgeZs1uIg0zacp+7UELvOUB
	NwkGGlsz3vpvNIEfVsyuBRM4dnHjODxCWS7Y12TAFviNfpiRjdnZGRdG5KZvhCVQ/CaW
	IroimwvTFmtNKk/yZ1Rce3ktvGhH0upZgKEB/C01yjEPWhUcmUD3wW8nqjuUBFovgZ+3
	78BIDsPu/4BRi5MYN6kKr3ZJBU8jpD+TiDTIfVuXEZ19gC/KZRTbswCdNC0uG1ZKU/vZ
	zXoQ==
X-Received: by 10.50.134.136 with SMTP id pk8mr50648558igb.20.1406699025454;
	Tue, 29 Jul 2014 22:43:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 22:43:15 -0700 (PDT)
In-Reply-To: <53D855E4.2020005@windriver.com>
References: <53D855E4.2020005@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 22:43:15 -0700
Message-ID: <CAMKF1srsgwfg1dQafnRp6TXL5DVdRNWL+nbbZYtt=t3A__nWSA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] integrate firewalld
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
X-List-Received-Date: Wed, 30 Jul 2014 05:43:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 7:18 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> HI:
>     firewalld is a firewall service daemon that provides a dynamic
> customizable firewall with a D-Bus interface.
>
>     Now, We want to integrate firewalld into meta-networking, what
> is your suggestion?
>

yes thats appropriate layer for it.

