Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id B0B6B6B7E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 12:16:09 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so708623obc.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tonlaXMFNGJolqNpmsopvDvfPCjFfpMUJwN6BPINPeo=;
	b=uPkoNmJAj+DveEzRXQLNGwg0M16k1/rQeTVvVfmLxzN8tsChz7C+mQO2bxXvdLuuhv
	5zB4IxLbEv8pj2UE2bu24LZY/la2vYsu5Rmg416gvqNHAUKlYdPMAWUQkkB8Q6ioeina
	vD+GA3T9YSiqlGD42TlUWve2mPTARwaKzCXWAGzUQkAMzsMkRCRJjDsOaBHJTSk3sZTR
	VM0yGuC8uYAfYs9ipYpe5RKrbyl/jAu1VZ75JwgOvmacTBokYugceJoFJAe56BS8E6oc
	ZO/OEGD0PhvrseCLpmqgq3FchsXwf+oKm4xUJQprNi0+TAFvJgAdGXPGlccCkMsKWfo/
	oZEA==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr889167oeb.57.1376568970130;
	Thu, 15 Aug 2013 05:16:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 15 Aug 2013 05:16:10 -0700 (PDT)
In-Reply-To: <a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
Date: Thu, 15 Aug 2013 09:16:10 -0300
X-Google-Sender-Auth: WTaeBVAyFYwO_im2LbRUwLDd2Yg
Message-ID: <CAP9ODKpWjyYz7RhBAj-E1arD3q9FEV_JE+HzOG82MkU29G7rdA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Thu, 15 Aug 2013 12:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 3:30 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> This layer contains filesystem related recipes.
>
> [YOCTO #4178]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

