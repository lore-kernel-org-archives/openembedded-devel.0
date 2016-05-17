Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 275D365CBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 22:17:44 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n62so15476189qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 15:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=32CiAFz/UwX4TuMz+Sgh+hvQyV/Rj6e5gtKyZskGaHw=;
	b=j3622sjYsdB3QbkriKidHwG8rXsN04akXVFwjGW0VY4BOyNquB3eGnTA1J3AnI5ZLL
	kEla0W0EfKa0WoQr+03fNRMUsfGANTg5RDrOCKX53HbcGXwGd5beD5ocr19idIC5Jo78
	fOQ5SFrAWyjNA+igg7OHRdo99zjxxTjY0UUDEK/M3gHe8A9XNPb8+WH/4a5cp1nWb3Ke
	L97e+fJ1sUvSRSwJBxwgFHMzMD2Azx4jdy27jVSgeLCSR6TUFfsRv1LamSKT+RH4Cu+T
	qcFAMr1ACuBK9B8w6QwZkHjDog9QzrJ1pEBxO0ozA4vF8yAbbEJUokvlwdO//1g5Wymc
	jp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=32CiAFz/UwX4TuMz+Sgh+hvQyV/Rj6e5gtKyZskGaHw=;
	b=k50B1ipCbRkPdDg1CdTo6yq0jUlcoKR7Jvvgn4XiwBQ21M7lPIE2tP7tS+PJp0bLS3
	A/GpZry7ZuvTJSREFySz0a4Hci+ts+GJ1dcQ6A+YOafXOUbnjSTN2D6Q1LEJ+Uw81lAk
	pHzzOTJbKgaMv0N8airM7OChteERsgmLZwtYl00i4/pihh2ynNB+U1r1PDQN1xZSiKKV
	/JtdxyEMam4kD2hCUmP7utk84kU3qbV0TnFGt4bnNvHE9bEYen0H7ifusN7oNvLi4b4s
	N+MXVuJ29fLf2VsqYjrdLUKV+7z1E5CZ/k2XMo5E4b/WtDINXKmak7FPB9SV/vyjGcaU
	oQJw==
X-Gm-Message-State: AOPr4FWXZYroYD1gCGkO+c+CrIX9rymHRDBvSG6qVfb2pDT75F6zqb8pR9uMoBKmF27Jaw==
X-Received: by 10.55.19.21 with SMTP id d21mr4672482qkh.118.1463523465142;
	Tue, 17 May 2016 15:17:45 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	k4sm2529888qke.49.2016.05.17.15.17.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2016 15:17:43 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <573B8BD4.10503@gmail.com>
	<CA+chaQere0t5x397taYZspvW=7j9PgepFPgG82X=io-srn0XKw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573B9888.2080403@gmail.com>
Date: Tue, 17 May 2016 15:17:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQere0t5x397taYZspvW=7j9PgepFPgG82X=io-srn0XKw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: jethro-next merge
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 22:17:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/17/2016 02:34 PM, Martin Jansa wrote:
> Just waiting for the request :)

So I have ask twice? Once from my initial pull request and another to
move from next to stable? I will make a note for next time.

thanks,
Armin

> 
> On Tue, May 17, 2016 at 11:23 PM, akuster808 <akuster808@gmail.com> wrote:
> 
>> Any ETA on when jethro-next will be merged to jethro? its been three weeks.
>>
>> regards,
>> Armin
>>
> 

