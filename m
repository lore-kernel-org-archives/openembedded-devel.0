Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QpLcr-0007b5-To
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 16:43:50 +0200
Received: by vws2 with SMTP id 2so420345vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7u+a2y5LujNhoef8q0cnnDLYqFqBQTY8db9XS/QxnWI=;
	b=JYbcDj1l/C12T/lVGReuB8Xx1lVzhXKkuJFIwppniY4qBo8dOpStQd8WEprMs6Xz5i
	xMd9bIuCYPAANSiBrbOBTaqN0HTVgXuoOibKPdzcRPkVYXw1hsWp1s/8LNze5d2Vcqsw
	+Gq3YG9jNf2xDNhLVaL5KeZmlXJX5dCkKK3Lc=
MIME-Version: 1.0
Received: by 10.220.168.2 with SMTP id s2mr621007vcy.143.1312555162445; Fri,
	05 Aug 2011 07:39:22 -0700 (PDT)
Received: by 10.220.192.8 with HTTP; Fri, 5 Aug 2011 07:39:21 -0700 (PDT)
In-Reply-To: <j1e83v$73t$1@dough.gmane.org>
References: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
	<j1e83v$73t$1@dough.gmane.org>
Date: Fri, 5 Aug 2011 07:39:21 -0700
Message-ID: <CAG4_upR2Hf+01rHLCEEsZtJx-MARNiw8NcQR1DMhzPKH7pDDow@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] ptpd: added recipe for v1.1.0.
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
X-List-Received-Date: Fri, 05 Aug 2011 14:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Op 04-08-11 15:32, Chris Verges schreef:
> > Signed-off-by: Chris Verges <kg4ysn@gmail.com> ---
> meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb |   19 +++++++++++++++++++
>
> You're missing the 'meta-oe' tag in subject


Hi Koen,

Apologies for missing this.  I was following the patch guidelines at
http://wiki.openembedded.net/index.php/How_to_submit_a_patch_to_OpenEmbedded.
 What should I have done differently?

Does this actually build with LIC_FILES_CHKSUM lacking?
>

It builds in the 2011.03-maintenance branch of openembedded, and just
assumed it would be the same in meta-oe.  This is my first experience with
meta-oe, so this is good feedback.  What is LIC_FILES_CHKSUM and how should
I use it?  I didn't see anything in the OE user manual about it, so am
looking forward to learning.

Thanks,
Chris

