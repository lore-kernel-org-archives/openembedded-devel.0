Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOKNY-0000ux-QS
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 05:00:52 +0200
Received: by lagw12 with SMTP id w12so1269143lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 19:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vT/7dqI/lYHu5kUEy8yHmQYlLwP8/RpfdRvjR7OIZFY=;
	b=KaAWici2eFgikV0NHWDKMGAFqJi83YOlSDHaQMCt+l48Iw/xgIzplcXaELYEqoURnE
	g4ykZeREtUfQzeHPSWWjynU11jF4PlhECuJCteNsYlTX9WleSqY4eHgAIyIyaTQkhvcO
	qBHHi05G6+bXsObzernOk/5voBY3SUJBz/aFlfm6ZnUcMi3OWUn2wsl0nra4klHq6p09
	Z5+aj6xArYzm2DqHpt+9wAfagerXQbUcDweNOuJqzVaHylLt4M4z6LJQcfXbWqIQ0dkm
	swv0Zd3xJzKNv9xdu3ho/HJDVdeQwZDAzEJ1/kTSWIgfFrm2cI1q/DA3GJYpIVj8SR4B
	LK3g==
Received: by 10.152.145.228 with SMTP id sx4mr14802759lab.45.1335667872457;
	Sat, 28 Apr 2012 19:51:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 19:50:41 -0700 (PDT)
In-Reply-To: <CAHTvVMcj_ADZxYCBvvcJcsTxXxW3uupq8xvWf-p=7xnrc=_n0Q@mail.gmail.com>
References: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
	<4F871E0E.7080500@windriver.com>
	<CAHTvVMcj_ADZxYCBvvcJcsTxXxW3uupq8xvWf-p=7xnrc=_n0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 19:50:41 -0700
Message-ID: <CAMKF1sp_p2ScBfQxBpTEDYjtXMF0Eo-1AFwBODGBrsJ1Tephkw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Hard floating point support for armv7a wmmx2 processor in oe-core
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
X-List-Received-Date: Sun, 29 Apr 2012 03:00:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 18, 2012 at 3:29 AM, Nicolas Aguirre
<aguirre.nicolas@gmail.com> wrote:
>
> I need to dig more about wmmx2 instructions set, to see how to enable it in gcc
> I will maybe come back with more questions :)

its similar to neon. SIMD instruction set basically I think. Does
Marvell provide gcc patches for it ?


