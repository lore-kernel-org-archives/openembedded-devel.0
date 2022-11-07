Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48C3C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:51:00 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.1338.1667811051062981705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o32tWWQo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7641240009;
	Mon,  7 Nov 2022 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667811049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3taPkdlF9FJHkBRQrwRVn2MVVTSAHI0wiHwv0OEijIo=;
	b=o32tWWQo+6KozMEa+OiDXYhaCrO3Ndk0EelDDutO0A4xW+ZizG9nqZVT86vyimwQAKs5ED
	izqp4nJ23RS36dDoEY8iLjZCtAJsx0OJLLcfifCpR+4OhPkZnicW3TSsegPHkPgAECYINr
	k0hex8EuZgZx/CL4Fa2vhR9ZQPnC8lEXsE2dDFYw8D7GCz3cf+ype4tqyOtYQTfdvSsGCC
	FwjcO9GVPbBAkTjeOVueO3N3FkF7KatlXqn+jlpime1WbH55+7R9AgY5VR3IGobcZ7BUN/
	l4QdKiY7KTPkTfAZS5Yv+75Uxy9YSUXHJsw+1/dKSPYmVgb5wRMdt7IlqbjDDw==
Message-ID: <a7c21657-6de0-bcec-59ec-e9f5e609e390@bootlin.com>
Date: Mon, 7 Nov 2022 09:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-python] [PATCH V2] add
 meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
Content-Language: en-US
To: cp0613 <cp0613@linux.alibaba.com>,
 openembedded-devel@lists.openembedded.org
References: <CANx9H-C2mOAsEXQRqOj3GgJoTA7eP50GzufyJepfSbS8tEC-NA@mail.gmail.com>
 <20221107031426.381-1-cp0613@linux.alibaba.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221107031426.381-1-cp0613@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99471

Hi Chen,

On 11/7/22 04:14, cp0613 wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>


Many thanks. The commit author and signed-off-by information looks fine now.
Thanks for the patch.
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


