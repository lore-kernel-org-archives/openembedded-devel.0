Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A6EFE601AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 18:08:33 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id j13so371854wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hG+GGGxLyNhAYSk9MO8TtwxS/Vv+XN82U60qTg541kE=;
	b=LEo3Y7cHYiNMujJNOUupLwve/irH43Pc7daiDBZKOMJ7aJ1MLqUBD1eZlzTbqwzlqr
	rNvEqzQsytQETgHJWuOr5WB03X6BEoMEmr3m5F80Gy8cUacwc3aO7IJ/YQsS+3nHYzne
	6JStUTUsB4hrS1WWOg2q0V+obFAoBH7nqUhjYa4PrCkCV6DPbgTi1z+yFdF6+eMq8+AM
	AwtcLUxbr4Ytg7SuW7pxwV7noU1uFJbdMcy/hkrdYKATFYIYsBNC/jfedjYrQ/VcgPXA
	bFLP8lYPazlk3fI55JgZcGmJ+Aj+12N8PemIMuhhpfXEbVKxV5w5uAwaVHysh4l7L1il
	JJGg==
MIME-Version: 1.0
X-Received: by 10.180.90.202 with SMTP id by10mr1950814wib.39.1375553313330;
	Sat, 03 Aug 2013 11:08:33 -0700 (PDT)
Received: by 10.194.16.167 with HTTP; Sat, 3 Aug 2013 11:08:33 -0700 (PDT)
In-Reply-To: <CAP9ODKrrK9w93N76hc3G9yw_6YkeaGKLy2iK-Z=V7smCRM=rWg@mail.gmail.com>
References: <1375526327-16139-1-git-send-email-lpapp@kde.org>
	<CAP9ODKrrK9w93N76hc3G9yw_6YkeaGKLy2iK-Z=V7smCRM=rWg@mail.gmail.com>
Date: Sat, 3 Aug 2013 20:08:33 +0200
Message-ID: <CA+chaQdXv5dueX7V+VJC3S0x1bwFFwa_YpMjPnmrRUApW90dxg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Add QtSerialPort
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
X-List-Received-Date: Sat, 03 Aug 2013 18:08:34 -0000
Content-Type: text/plain; charset=UTF-8

I've already updated commit message and it's in meta-qt5/jansa/test branch,
so no need to resend it.


On Sat, Aug 3, 2013 at 7:50 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sat, Aug 3, 2013 at 7:38 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
>
> Please use the meta-qt5 prefix and rewrite the commit log as:
>
> qtserialport: Add 5.1.0 version
>
> We always put the recipe in question as this makes easier to find it later.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

