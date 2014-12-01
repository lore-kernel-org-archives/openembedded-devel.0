Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id D015360E24
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:29:33 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id v1so4990647yhn.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YncOpI5Y4BUf0NIAAs4/idx1elaVCN8a5VLVS2Ndhfk=;
	b=wDJvZYh4su18uI6kNUJOnBv8o2Wgip0EGIFhHRdjC4QfHBeGx1djd8PYT0yAs4WqHJ
	iWkrxGpNkdUyqmue2zbZzemiVpa4917XNbq61SqAzQHLKQD3J/AzQxWPUOOxTP1ZvM+5
	e608TBehwBGznhj5b8kvKcbX2j38z4gCDapl3vBN88UNttWjFnp61QdNHG4lQEqJnvUD
	xPhBsdTkAekfE3k3uCiH/nF3x04SJdgYf5kfedAXQ8IkPVBPDTANw90l4Wk/cqsnXBEh
	LmK4W++ASqSAAX2E8OktEeXTWrqodUJLuX4GOTRkvN00gmljkhueP4Ajm3OTRv6yXh7x
	PTRQ==
MIME-Version: 1.0
X-Received: by 10.170.129.147 with SMTP id v141mr68945439ykb.110.1417447773910;
	Mon, 01 Dec 2014 07:29:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 07:29:33 -0800 (PST)
In-Reply-To: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Date: Mon, 1 Dec 2014 13:29:33 -0200
X-Google-Sender-Auth: xmu9frhnMTIXPRV2dsj8uTyypBA
Message-ID: <CAP9ODKpj=+MZGBRbKw5ruo+5wUJE+oSKkkyHsNVBdiviyFby8w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] logwatch: Add new recipe
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
X-List-Received-Date: Mon, 01 Dec 2014 15:29:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 7:14 AM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> Logwatch is a customizable, pluggable log-monitoring system. It will go
> through your logs for a given period of time and make a report in the areas
> that you wish with the detail that you wish. Easy to use - works right out of
> the package on many systems.
>
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>

Doesn't it have a  'make install' ?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

