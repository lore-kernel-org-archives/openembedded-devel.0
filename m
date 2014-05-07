Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id D44B8605F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 17:15:55 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id p9so1845326lbv.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=w1B/dwEIo66zLwDfNsuuBLz99LpSouxNHBc0twGHPAg=;
	b=eFPd8EVhSSSaeV8EaBXfDguVlEe0XfiEZD7ltaVyk828IGyDwOdHAQS6O4WT+PJSwU
	64GOpYAd6I+22nI4XT6ll5XjOGHS/WhJ6Xbh06DkjX32XjGroZF5QSBv2XZLGZFB5utj
	3xTIhAz7ElVn9pT+a+Y37Th7jgpx3rNZ6UpANvD1y7/OftZpyhfamM7TOXFsJTgpFltq
	d6TA0UBsnDmeDGWTPQ51al+C14GWU0UYocaNqy4SAwxcWoUF16XZDke/aiXn144AVHvB
	KXWwvM7q/NGo6Ne55r7AUqXQge3ar87iLpWPkjfnIpEWFv10vgc5KAfUJ89GTQnrsdvH
	ajwQ==
X-Received: by 10.112.137.5 with SMTP id qe5mr42060579lbb.16.1399482956333;
	Wed, 07 May 2014 10:15:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 7 May 2014 10:15:36 -0700 (PDT)
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC7@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC7@GBTWK10E001.Technology.local>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 7 May 2014 10:15:36 -0700
X-Google-Sender-Auth: LFzAgG2B0BWE1sp55aw1uc6l_DQ
Message-ID: <CABcZANmxTrixYwKJ78c0wE7Nh0mH2RtcveVx2+JhF0FUuVLQrA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Subject: [PATCH] bitbake/fetch2: Fix refetch of local files when they are read only
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
X-List-Received-Date: Wed, 07 May 2014 17:16:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 6:16 AM, Lewis, Nick <nick.lewis@usa.g4s.com> wrote:

> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International
> Drive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No.
> 2382338.
>
> This communication may contain information which is confidential, personal
> and/or privileged.
>
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any
> distribution, forwarding, copying or use of this communication or the
> information in it is strictly prohibited.
>

This sort of foolishness really doesn't belong on open source mailing lists
:)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

