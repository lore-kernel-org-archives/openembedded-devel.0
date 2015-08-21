Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E527660557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:24:43 +0000 (UTC)
Received: by iodt126 with SMTP id t126so87427651iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=DDM3+9Ilv/cdD7rxCeg2PL19rZPehoUrXih3b4zNq0I=;
	b=XNeUUd07T18XG2A8FAHU6OstjoSWiTNmQVuwG2qojxMFo7LvXDpzL0f7cgEQdG6Weq
	bhY0wejdvMHNYlj/tXy23CDZGDewfYgOUp7CDpUyY0IfJV+M8p7so6h+rg8IvLe2imwD
	xp70NEqlOFf1DeYhPowX5E2EozzM6BUCeHbbh/aDxTZ3BWWk1zxNXdDI+GwP2x0lWMK1
	etdS5rc73wMIsTVwC04ZoWNWNS9Lp15Xxy2Y8aC571wXnQ8vufPCFQcuqGinigjbutaU
	ui7/Zwu7dxHysHYzUZSKto77lBfOHOrDw7FD2QoxzPLsrj0C5zeAmE+WvLufqemhKNMM
	++SA==
X-Gm-Message-State: ALoCoQkMzdjzJK+/vzWr/EEIQsOZcAR4fTckP1jagwiFXDBzWsWxe3Zt5Dx3TgFIw5G2MPTdZw3w
MIME-Version: 1.0
X-Received: by 10.107.150.145 with SMTP id y139mr7400244iod.128.1440174282899; 
	Fri, 21 Aug 2015 09:24:42 -0700 (PDT)
Received: by 10.79.13.8 with HTTP; Fri, 21 Aug 2015 09:24:42 -0700 (PDT)
In-Reply-To: <20150820164827.GL2446@jama>
References: <1440088125-1120-1-git-send-email-jkrishnanjanappa@mvista.com>
	<20150820164827.GL2446@jama>
Date: Fri, 21 Aug 2015 21:54:42 +0530
Message-ID: <CAD3vsf4xaZHq3n6ZPvNUnNUmDvcB8tNNByMsN+M7gyNx3F88AQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-filesystems][PATCH] xfsdump: add new recipe
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
X-List-Received-Date: Fri, 21 Aug 2015 16:24:44 -0000
Content-Type: text/plain; charset=UTF-8

>
>
> Why don't you use autotools-brokensep?
>
> The same does apply to dmapi recipe.
>
> Ok, inherit autools and B = "${S}" can be replaced by
inherit autotools-brokensep. Will send patch v2.

Thanks,
Jagadeesh

