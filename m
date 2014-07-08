Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D24A0703F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:47:23 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z60so5118811qgd.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jul 2014 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=k8EUswqFY5uI9szxXUdiDj0KgHUxw/CyvizF9/Grz98=;
	b=t97ll48jI6iVbjE5hz5zXWDFR5fwToWXMRdu9rQboVFoE+jetKzZEiomibJ5eUZ77j
	iYLzWIv3xJS2KEe+4LXrScPqBuaX1Ws2QMXhA8CZuOU2biphVTyLtNZma4LSDCaxADRX
	z352siyK5aIlWlwCjlDuIFIsbDzRot8rBvpFxB0smnapr8UCg1zXApmGY0AQRsc3Kj1m
	s4m09tbDlIp6qiflAddO7ko1dzhNiimnmBVHm8yqOya9TwWMQqL4ir0hbo+i2Mp5QF2R
	OeEGNg7TM6qX71Gu1qZ0Q51/RfgL0kQ9KBS0mIp1kZih9+OFIoSILd4DbwDsbNayxAQO
	J5Nw==
MIME-Version: 1.0
X-Received: by 10.229.38.1 with SMTP id z1mr57642447qcd.18.1404830845043; Tue,
	08 Jul 2014 07:47:25 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.19 with HTTP; Tue, 8 Jul 2014 07:47:25 -0700 (PDT)
In-Reply-To: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
Date: Tue, 8 Jul 2014 10:47:25 -0400
X-Google-Sender-Auth: 4IJ-pjPwcedQhQpESKfWBZa41bo
Message-ID: <CAOd_LFz0hh3kQ3tpdwPJUPYk=p5Z=z0a1NAedjsu0ST=0QFPrA@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: open embedded build issues with beagle board
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
X-List-Received-Date: Tue, 08 Jul 2014 14:47:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 8, 2014 at 2:54 AM, Bryan <just4tech83@gmail.com> wrote:
> Hi All
>  I am trying to build  Openembeeded classic for Beagle board-XM but i am
> getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
> local.conf.   Is this approach  ok? or should i move to openembedded core ??
> Pls suggest.

Yes, openembedded-core (angstrom or poky) is your best bet.  oe
classic is seeing very little maintenance these days.

Cliff

