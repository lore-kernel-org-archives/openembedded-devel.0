Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id C55A871A90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:31:08 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id x23so575344lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Rbyx0igRdu+SeAAyv5NNnECJGI8dzMXoI2KgrL8JlB8=;
	b=IwQtoGTmoKxnjO3SA2d/orccvbPOE1RPMH10tCqT0SshKr8EYSuJFfKQtBG9KXjHK7
	9yAAP9mv8kJYZr3PYXgUD4Zo5h+tgBl59eqjN6th3WMSXbLW+j2/vDCatzclGlnFuGN4
	qpXXk/68jfkiNSsIB8JYR3wam4s14j6lMa1+h6CGRO0lN4utfxM5WCfGKpufPR/gWcC6
	Ds0mRDSFfpaPuf11GS1GMX023MUVayJ26dEdx8f2dpl9Qre3Uc6xLqwa+N9eg77E3R9P
	ffZUWjQhpwnpmkRzcm7QLOsZ9Bm32iv23Fr4HNi63LObtfJKU2021KDgT1ffVJUXO+uh
	k6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Rbyx0igRdu+SeAAyv5NNnECJGI8dzMXoI2KgrL8JlB8=;
	b=hdgqbE7VHuNB4wlihAw2wjLKB2MRRABNzcu2ej24zmZAGZDNBE9+Zh6OVG9E88JTLc
	8YKv+bf1ZivK6mQzxj/iqhz2s9OWwM0k3BFDk5VxXTsnKuf7Uw9E42E7M0TFfo98Bq/Q
	7FqtNU3EIzk3fkr1h1xIB4duqTjagLMk7x3bgrNOd7yHWLn9nQTa+ZGNReY0PDoNzkUk
	4E28hx2US4C/s4Ken5VMQSErMAnPXRmQ9BRKLCvRhmSRX2z6KGXW9d/Bd6R0o7BG1cuz
	+m9O4ZG3j7gneVrUW6rbWD5aTtVtycfaZ8FSGFNuS8atZk9Y2HiSuc2bLMEitRR5Ige1
	v4Pw==
X-Gm-Message-State: ABUngvctks50icPe2AvpOzjYH5h55FyhAgpIlKykUTcDqnJNZmtgX0dwbscrjQu6gpZkPw==
X-Received: by 10.25.195.209 with SMTP id t200mr2983077lff.172.1477503069060; 
	Wed, 26 Oct 2016 10:31:09 -0700 (PDT)
Received: from ?IPv6:2001:14ba:80fe:4000:55d3:44f1:376f:fc7f?
	(dtd-fyyc16qcscq7s-v-t-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:55d3:44f1:376f:fc7f])
	by smtp.googlemail.com with ESMTPSA id
	e38sm562688lji.38.2016.10.26.10.31.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Oct 2016 10:31:08 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1474826085-1209-1-git-send-email-dachaac@gmail.com>
	<20161026143050.GE4096@jama>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <27ac9cf7-aaec-7312-065e-2919763b7f62@gmail.com>
Date: Wed, 26 Oct 2016 20:31:08 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161026143050.GE4096@jama>
Subject: Re: [meta-qt5][krogoth][PATCH] Update Qt's git repositories to match new location
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
X-List-Received-Date: Wed, 26 Oct 2016 17:31:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/2016 17.30, Martin Jansa wrote:

> On Sun, Sep 25, 2016 at 08:54:45PM +0300, Vesa Jääskeläinen wrote:
>> Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
>> ---
>>   conf/layer.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index b7207e6..9220a75 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -27,5 +27,5 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>>   
>>   IMAGE_FEATURES[validitems] += "qtcreator-debug"
>>   
>> -QT_GIT ?= "git://github.com/qtproject"
>> +QT_GIT ?= "git://github.com/qt"
>>   QT_GIT_PROTOCOL ?= "git"
> This isn't in master yet, so it cannot be applied in krogoth and it also
> breaks qt5everywheredemo fetch
> http://errors.yoctoproject.org/Errors/Details/93069/
>
Hmm... It seems that 'qt5-everywhere-demo' has moved to:
git://github.com/qt-labs/qt5-everywhere-demo

I'll play around with it and send V2... I suppose you want it first for 
master then.

Thanks,
Vesa Jääskeläinen

