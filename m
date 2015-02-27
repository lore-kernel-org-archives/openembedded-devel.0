Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 681B0605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 22:27:06 +0000 (UTC)
Received: by yhl29 with SMTP id 29so9480728yhl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 14:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=PzBTM0Wvutiqa0mp2Dda9An++I81nZ/Xwy/JeKoEX8k=;
	b=FdXTcOnEHYvHnndXifJ705D0lBSM740uO/dy29cOkN2/araUH3v9bYFhGr3qE0y1FX
	eQEih7UQDEfRBMwrwDUSA72CBbMA4gXY90RidlOHLf3krNbWs0TFZsnXulaDD/RyNReQ
	8/y+aNDDACpwZQdKalBswMNIoE0ykHWXAsPP1hvM8nKWXzxX6W98bPRLXUCUPWhhw+Tk
	xsYmvOlMWniIXYSbaHqtdLj5OSGky8jl8uJQrA85mACmNgReeVJJ2WsmaVwdYgv9X3nw
	3Ti8yPTCfjMkQlJINfk2UabAzxV5cXmjtL+ns0bcL3f4ofAhb+3imwoVWp3a05Fwcc6m
	yWCg==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr15252710yha.105.1425076027940;
	Fri, 27 Feb 2015 14:27:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Fri, 27 Feb 2015 14:27:07 -0800 (PST)
In-Reply-To: <1425070398-1602-2-git-send-email-alexandre.belloni@free-electrons.com>
References: <1425070398-1602-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1425070398-1602-2-git-send-email-alexandre.belloni@free-electrons.com>
Date: Fri, 27 Feb 2015 19:27:07 -0300
X-Google-Sender-Auth: G8SJ7FcvXTNxkpI24yze93FJhAM
Message-ID: <CAP9ODKqpo7=a4hN61LMMcAXYmeqoneBFoRhs3PPM6UOQ9z-Vmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtmultimedia: Fix build without opengl
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
X-List-Received-Date: Fri, 27 Feb 2015 22:27:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 5:53 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Backport a patch from 5.4.1 to get qtmultimedia to build without opengl.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

We are in the process of updating to 5.4.1 so I think this can be dropped, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

