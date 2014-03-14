Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B845A6F5D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:45:56 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so2747563ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qR8yrAuP7vWW8x9zvE5tIM/lI7zJbkHSaSfoCDAty8M=;
	b=n/Esi4VGE+hLvbFK/lLUYBzuP4rHtt40R18MKaqNhBJGb+U8GvCA+LGwomtMBM6er/
	APSSD/uFd4Wl7DYEPrB+wHuzf/gDIHssd6f1G10KMvx0WdnOARHqzRsgP+41y410TXZE
	ZIsaSlUFeN6ySgF57pRk/ERlfWidNmuyRudZ+wm3hbQP6BcLeXLcXnDsrLPLmyTICemy
	BEQnOlFhqADAch3zgrHuuuqmQldTpzVUslXJytU1IeWo2Yl9ZHmusFK7of6S2v1r+J7Y
	6qblRTrmMu2G75mbBfSVLIVIjcA/krZQtDs38c5dE1qSt27iMhDDbStnOr7+fUFCay4a
	FPVw==
X-Received: by 10.50.60.103 with SMTP id g7mr8517172igr.20.1394811957179; Fri,
	14 Mar 2014 08:45:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 08:44:31 -0700 (PDT)
In-Reply-To: <20140314152717.GF3759@jama>
References: <1394792627-7361-1-git-send-email-raj.khem@gmail.com>
	<1577232.dQug1huf51@peggleto-mobl5.ger.corp.intel.com>
	<20140314152717.GF3759@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 08:44:31 -0700
Message-ID: <CAMKF1srwWXVMyXZkCi_AWU3AWOET8G9GW2h2VTd3CMQBmRBmKA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] licenses: Fix WARNING: qt3d: No generic license file exists for: PREVIEW.COMMERCIAL in any provider
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
X-List-Received-Date: Fri, 14 Mar 2014 15:45:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 8:27 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 14, 2014 at 02:10:04PM +0000, Paul Eggleton wrote:
>> On Friday 14 March 2014 03:23:47 Khem Raj wrote:
>> > PREVIEW.COMMERCIAL
>>
>> Surely the license name should be something a bit more obviously related to
>> Nokia / Digia / Qt ?
>
> Agreed, I've used this because that's the name of the file in qt3d repo
> which defines it and I haven't found "official" name, but if we're
> going to include it by default in layer.conf, then we should rename it
> to something better.
>

sent a v2,renamed to NOKIA-TPLA-2.4 which should be sufficient to
denote the name of license and version

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

