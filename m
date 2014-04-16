Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id D1BAA65D7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 14:42:34 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id o6so12304564oag.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=fSqVOx5UgSW0wGvGaXiL/nlqXZnawhTR4UgOA0KiWBc=;
	b=l3JFSWST0Nr9F6Y9Dwev7IBX25VZG27TAirGcgroR6V5QRHtGy4D2GO2NF037PEmoZ
	IuO5H0Q6dfvRgEn7MHhNyraou1TUNlY2uSf8nlqrPj4OSOVT61ac+R5VWrnA1ITx6D7x
	IHXpQmoJGIwe4zOVEW+ORQLwvblHgHFXbEAyn2TuIJqPRGoNDjJJKQH5XgjAx1HACXYp
	GPrH6m2SOvBdWiIvUv+jfwAjLOozGqz2ocqhOFvyRoCEPAJSwW5WYrikigHYP+S8MOCu
	25fHTO3ECyfMNrDIIo1tUkAaubxQdpfpMnSoKV5BMx/htmdG3ireCrMHayfix08SqubV
	nj0Q==
X-Gm-Message-State: ALoCoQlXfR7P3erR4LWq+kI49gJOSsexCElw6QFk5kIbQok6KbyL5RzLGqU5i5/oqM5S30V7mFTV
X-Received: by 10.60.155.72 with SMTP id vu8mr2114805oeb.60.1397659355748;
	Wed, 16 Apr 2014 07:42:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.110.9 with HTTP; Wed, 16 Apr 2014 07:42:15 -0700 (PDT)
In-Reply-To: <534E7151.5030504@balister.org>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
	<534E7151.5030504@balister.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 16 Apr 2014 16:42:15 +0200
Message-ID: <CAP71WjzyBZ6ZhbaeOvYiqbuvbux8jYRXDMeg_K27LCrVHcUyJg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 14:42:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 2:02 PM, Philip Balister <philip@balister.org> wrote:
>>
>> I found this from the git remote url of my surce code. It is
>>   git://codeaurora.org/quic/le/openembedded/openembedded-core
>>

this tree is just a fork of oe-core (upstream) which is stuck at a
2-year old commit. if this is what you are calling "OE for MSM" well
then it's just a 2-year old OE. You might be calling that "for MSM"
because it comes from QCOM Code Aurora git tree.. but there is no
vendor change in [1]

[1] https://www.codeaurora.org/cgit/quic/le/openembedded/openembedded-core/

