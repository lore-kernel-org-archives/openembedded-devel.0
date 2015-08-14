Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B4D4472A78
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:08:28 +0000 (UTC)
Received: by iodt126 with SMTP id t126so85934827iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OULHADuIRcQvAsyqj0jgvaEQsYXIdbskvDlQJSHyqi0=;
	b=HCelS6wW+8YKyPGwWFLB2sXIxYi03Q7AfYVeYLJsCeFH48Xwmjm9yfQ3+X65dbe2mZ
	xO0qTGb0nU8axtkZnmVyhHsNfZ2539JXFSF2FefqKPwhgfozJ61PsApr+bywXg7qhZYu
	23gtVMi5/9h7iwN9FNmO8mecJ5hnEMmRuIz2DPdPiYmJV3T/cM87MmcwZfaYgy8pP5pc
	GDBbWIHksoXK/TtBmc86QWUE+2vkm2XkD6s/LaVZDk/cINnDqkLyOPntIAnHkutUxU2/
	Ey2zVSmiA1udxbuQD1ISHFILTqevyOoYUboZLmqUTe9Z/cs+O+4KQv60uVhy9peGVIUI
	7zaQ==
X-Received: by 10.107.168.214 with SMTP id e83mr9641390ioj.112.1439561308763; 
	Fri, 14 Aug 2015 07:08:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 14 Aug 2015 07:07:59 -0700 (PDT)
In-Reply-To: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
References: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Aug 2015 07:07:59 -0700
Message-ID: <CAMKF1srog+Uqq604pm1NgZW6veG9yg5rv5ZSe+GabyF0mo_FPQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] collectd: upgrade to 5.5.0
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
X-List-Received-Date: Fri, 14 Aug 2015 14:08:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 14, 2015 at 2:28 AM,  <rongqing.li@windriver.com> wrote:
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
>

what changed in License ? Please add that info  to commit msg

