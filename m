Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 038526B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:27:46 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so376382wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Rpn6W+YbAxjzQpTvrDFPZUcTM2vPpAxrGvAX2HoTpgU=;
	b=OZ5CkCsffx5GruvpOmKKMrFuKyAC+DamBd8vY/ieqYLu/Q/knKAvFOEKWTubZr8NfY
	MfHNFVO9ilDNPdW06ucgCF/WrcPA4q8l1B3LLczl9J0ABTlbIqGnFkeNSNjEhWwchCH9
	7PXKe10Jf3EoXx+tdpO8o0vrGZKbKQcSDAlEfhqDWBCOPPZxgUnECZ5h/b8jSA0usaB5
	K/4ZT29w/6qSpS8+rlOArX6O7A4p1m2REwTl6yTppPnvW5a+2GlyoBuzVlA2PdneRmkf
	IygQw3NtthA/BtZUk7xxEN5lE8VeDZLPmnNCq9WCaBS4IlM9TLPofk4/RaSiQP9n8kRT
	IM7g==
X-Gm-Message-State: ALoCoQmxejfvKEh1tdNjhHTg1wMtH7sqiJjcvfaXas0GoX1b1TborGTh4WlSYq9d3ukY60czdf1u
X-Received: by 10.180.19.35 with SMTP id b3mr20319044wie.20.1390400866884;
	Wed, 22 Jan 2014 06:27:46 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id po3sm15217728wjc.3.2014.01.22.06.27.45
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 06:27:46 -0800 (PST)
Message-ID: <52DFD561.7030505@linaro.org>
Date: Wed, 22 Jan 2014 15:27:45 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <1389965698-5352-1-git-send-email-ml@communistcode.co.uk>
	<CAP9ODKr63fqJWSAV8DxGySTD+ctjr=yfRbsUDA5H2Ui820AV5Q@mail.gmail.com>
In-Reply-To: <CAP9ODKr63fqJWSAV8DxGySTD+ctjr=yfRbsUDA5H2Ui820AV5Q@mail.gmail.com>
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCHv3] libsoc: update to 0.5
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
X-List-Received-Date: Wed, 22 Jan 2014 14:27:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 03:16 PM, Otavio Salvador wrote:
> On Fri, Jan 17, 2014 at 11:34 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> From: Jack Mitchell <jack@embed.me.uk>
>>
>> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
>
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Could this be backported to Dora branch as well?

That's OK by my, can you send a backport patch so Martin and I have less 
trouble keeping track of the backports?


-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

