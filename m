Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 74B8A6F45F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:34:21 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so4719735ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=MceakyLow5Oq2yxWW4fIf8B3+LOzT8ATOkO8lzRBUK0=;
	b=t0OYs3ls0fIPQzYGHTi1aHRKXgW9uNj35zsc7KyZtNfNzGdWXq6pTNrkXLmQH8Qz3V
	cXyLjzm2lsF1t+tOgGFqGaZRuK3oppM1nyIBOOP92Dy/+QDW90t/6sc2oe4ZMGY3yMbx
	jvGSWro+BmKVup23emQE6pKRgpR0f5GlOdIHpYt3FBgc2BLA4ioyvNPgJcD/BiYq1uwH
	WakTBqSGgwhPGwI3EryGr6Ul9iUlr/5WKegFTY98bw3ZVL8/lfA062jcvslde3urWKUC
	XFJpqKsLxXJ8XytbWTE8OPmlUkVLlbF6MIJQbMLTQaKVBbSiTIfHpsDzKgFm1ZFhXTnU
	iMKg==
MIME-Version: 1.0
X-Received: by 10.236.124.104 with SMTP id w68mr11849482yhh.2.1393706062149;
	Sat, 01 Mar 2014 12:34:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Sat, 1 Mar 2014 12:34:22 -0800 (PST)
In-Reply-To: <1393640395-9737-2-git-send-email-net147@gmail.com>
References: <1393640395-9737-1-git-send-email-net147@gmail.com>
	<1393640395-9737-2-git-send-email-net147@gmail.com>
Date: Sat, 1 Mar 2014 17:34:22 -0300
X-Google-Sender-Auth: urvIqFYq8QcYdMVcTwuFOcAY_IM
Message-ID: <CAP9ODKoiySoue8v5eQ4=MtV9gWXaGkmXndH3MxAXOfjPu7DbVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sat, 01 Mar 2014 20:34:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 11:19 PM, Jonathan Liu <net147@gmail.com> wrote:

> This adds the necessary target packages for development with all of the
> Qt 5 modules.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
>

I like it :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

