Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id EBBD47731D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:56:12 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id 3so43838587pgj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PWzDpctvVKXAIy4MvGSdNiRgVXmOMwfyzDKrkGsodxI=;
	b=n9iGmQ05cDiwnP1EXy44DxrNarh8IspAMqDdv8U/i9h2PAtrbcJnQsxcgfLcs6qjlT
	v8no54/SyFi9LNWBjNxfVirxhDsU27sVt4yQg0j8AQErEugblrPweE0YIz8L4SJNO0OY
	SV6ALJ7HWBk6C3HXAM06areGejglFdJj/AcvZuty3V5vtbxToE/7UeBbifRnwCq52Yu8
	KIry8sD16oOH6heLC077Sl3uoUE9PfyVh9kr9Oxl0pznVrv3j061uRFf8M9k9Q3skiOt
	UZezWCvmLbfnsz1VThfYmZLg1v9AwQrJqlCL756kDIYJ7FxppD73n4Q87YMEiSLsl/KL
	+6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PWzDpctvVKXAIy4MvGSdNiRgVXmOMwfyzDKrkGsodxI=;
	b=F3Z++6+mNiSErgOrv+ydXb/rF2Djv/Z2nXplrZ4fl24y53B4vgoO1CEBGf3n/Mj7Mo
	hv7FFOXK6EytM9reQSPXkGQElh4qthVlghgzMp5LUWo+iYZLVemJs/zg871Bk1GqkmWw
	Kbhyf1RGZ2VaoPrky7/9Xl1kO7Hts/kN1NCR1eAqqmS7vcPPAXGjKVljpD1bDkRUDoSz
	qe8Zu3gh2JHcqmheCphGPmbwMNu1EnmOv8aJhKyM1z0TU237pWKfWtZ5tu+4LW1yzxpg
	rcOVFWHV+Lz8SJUqNknc4oNZdy683YaaBf+rBY+l2qsyUjrIH6pBTULiWFEwnp2a0TeH
	23UA==
X-Gm-Message-State: AIkVDXLjqcSAASO3BiLgz6NA+U/Mt28h9TX5Cy0jInH6a2nfR83Zua/yNtLmqBxdGjWJOw==
X-Received: by 10.99.100.3 with SMTP id y3mr24791071pgb.36.1485795372698;
	Mon, 30 Jan 2017 08:56:12 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:d8f8:ce4a:79c4:7a9d?
	([2601:202:4001:9ea0:d8f8:ce4a:79c4:7a9d])
	by smtp.gmail.com with ESMTPSA id
	m12sm34143139pgc.46.2017.01.30.08.56.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jan 2017 08:56:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20170127142639.24159-1-nicolas.ferre@atmel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e4c57405-7efd-8b06-634e-4a17615ad659@gmail.com>
Date: Mon, 30 Jan 2017 08:56:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170127142639.24159-1-nicolas.ferre@atmel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [meta-oe][morty][PATCH] nbench-byte: fix project URL
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
X-List-Received-Date: Mon, 30 Jan 2017 16:56:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/27/2017 06:26 AM, Nicolas Ferre wrote:
> www.tux.org/~mayer/linux/ location can't be found anymore. It seems that the
> www.math.utah.edu website gives an alternative to reach nbench-byte tool: use
> this one to fix the issue.

In my morty-next

thanks,
Armin
>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>   meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> index 56272d9852ce..4ec1c63751be 100644
> --- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> @@ -1,12 +1,12 @@
>   DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
>   designed to expose the capabilities of a system's CPU, FPU, \
>   and memory system."
> -HOMEPAGE = "http://www.tux.org/~mayer/linux/"
> +HOMEPAGE = "http://www.math.utah.edu/~mayer/linux/"
>   LICENSE = "nbench-byte"
>   LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
>   SECTION = "console/utils"
>   
> -SRC_URI = "http://www.tux.org/~mayer/linux/${BP}.tar.gz \
> +SRC_URI = "http://www.math.utah.edu/~mayer/linux/${BP}.tar.gz \
>              file://nbench_32bits.patch \
>              file://Makefile-add-more-dependencies-to-pointer.h.patch"
>   


