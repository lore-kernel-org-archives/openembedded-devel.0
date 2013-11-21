Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3C686A463
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 16:56:47 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so9176oag.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=5nTNgjJ1QA896wYJFviICZo4IL/EICcX79I/Jn6nvM4=;
	b=PVfiNoSgOc5PYwsmITTi0BxR/m7oRJbYKLB/3nz8D/xJfM17QaFBIKc8tVMiR/fpyp
	QbY25U3M8YzddzyQFYHzkoYDqT2H1INe6XZnQxDCIrH5wXsNyBY1tkiTKpjbSkk4Rxvv
	LlsJJJFRuVAE0tQtTDZFPWDEZZOT1fTCMVe1WcRdAOr1rkVYzcx7QtjRgAERL+6jKT5B
	XqG3Zj5EZ6AD1iXDjOTxHGDiujsHXflwXwmSKxWN+cFSxDaLvKkqk+2z0MvCJYKxv8vw
	0ctXdbyZCxhwvCtSLceTnuM5MUAfXaGAapRxTztxnNpUnh6oMQC2QjMdalBrGRQnoJx0
	bbuA==
MIME-Version: 1.0
X-Received: by 10.182.109.230 with SMTP id hv6mr1494470obb.68.1385053006666;
	Thu, 21 Nov 2013 08:56:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 21 Nov 2013 08:56:46 -0800 (PST)
In-Reply-To: <1384556312-14691-1-git-send-email-prabhu.sundararaj@freescale.com>
References: <1384556312-14691-1-git-send-email-prabhu.sundararaj@freescale.com>
Date: Thu, 21 Nov 2013 14:56:46 -0200
X-Google-Sender-Auth: cA0pZvTTzhIVajnSxQ_sFFPpQa8
Message-ID: <CAP9ODKo15qsnTW7_rse0OqVWGeqnv4uvkGCGzgTQ18=mkUxqDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] ninja : update to Version 1.4
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
X-List-Received-Date: Thu, 21 Nov 2013 16:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Prabhu,

On Fri, Nov 15, 2013 at 8:58 PM, Prabhu Sundararaj
<prabhu.sundararaj@freescale.com> wrote:
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Good to see you here ;-)

I applied this to master branch. While on it, I updated the commit log
to refer to the full recipe name.

Thanks.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

