Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id EBB2B73555
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:01:51 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 142so15932847ykq.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=AuwT9PHrq9Bf7gzz9PAbLwbXmsiLgs1eZO23rwfPuls=;
	b=acV2oZ0dV6YMClTlJsOC7mLKULf5B2CDb1tsAQXvo5zPcODykTh9ZEFdacfH28zTe5
	jUNN2PL4rzoCPlkoPYMWo6KacJms7tmHxVqJLRRmdchdhhEMlf7bTWt+GJZXyoKmdo6m
	drsh+NAv+ELP5Nb5JeAVBdjUs4aNgWiU4/j4pxQjZQw0KgGjQ2LRFdHCiSuiR4V5qq44
	TDDnFI9DI7wfxA4cKx8NsfZ4Rnm1VGMQvq38/eYbCtn/MJg+AKvgbkvZuF20SIGQxXWa
	C2H4sl0JismO35H/KqBE8nYHmmAdZ3zgD7ROv9rzCwl49WgaRyVnIVdXCC3qqufR+ydZ
	uOPw==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr19138399yhb.136.1424178113036;
	Tue, 17 Feb 2015 05:01:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 17 Feb 2015 05:01:52 -0800 (PST)
In-Reply-To: <1423744778-13635-1-git-send-email-hugo.saldanha@aker.com.br>
References: <1423744778-13635-1-git-send-email-hugo.saldanha@aker.com.br>
Date: Tue, 17 Feb 2015 11:01:52 -0200
X-Google-Sender-Auth: qy_ICt4t-R042IDMhxuTeOQWxg8
Message-ID: <CAP9ODKpkMNB72LdXf7Zy-F2qi_6FSK7o5XxQP7FTat+y3Vv4ug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH v2] cacao: upgrade m4 macros in source tree
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
X-List-Received-Date: Tue, 17 Feb 2015 13:01:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 12, 2015 at 10:39 AM, Hugo Vasconcelos Saldanha
<hugo.saldanha@aker.com.br> wrote:
> Before configuring package, we upgrade m4 macros with a call to
> libtoolize. Otherwise, compiling would fail with a complain about
> different versions of libtool.
>
> Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>

Applied to master.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

