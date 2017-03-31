Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5CA77DAE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 13:41:12 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id f103so5922766ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=HvpDhiKyOTjY5ywGRnG8+Lv0BMj2Ie32mYB5w14eJ+U=;
	b=ku4QzQ2McSe0YQQ9X66qAKTUtDJhqrMiBp+kDigqf80UCrXjczKOGbew0qo/7ZwVkx
	Ze5Qfyw3BBiEl7M/jPzM/cohVgJlW4S8finYgY3q8BRAizeAQqOLY5dmeSZPFouPq4w6
	7sa0ToBtpdujRxfqLhmyHZEBRpdRMdAdJpClh2Iiqp2Btinz7gqwpaC55Cmf3GcKjuY4
	kPZ4P6Aj5/cPuoK6pVdUloZGMR7jIfyIgoRYAv6B9bAqKNYnxyF1JgLpXqmtq4kXNwlF
	2xLeyTfZ6+tUrVSSuIPbkb20YuniqsNQ8rFupgJDd4sj4wgFXTu1n1w4pyML732+NvTs
	KmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HvpDhiKyOTjY5ywGRnG8+Lv0BMj2Ie32mYB5w14eJ+U=;
	b=HPmELz45GlB0+LVjbBFiRJ9mcCWzq7+5sHA0Uj89CZDbwJygiUUhQfJI3/ohoHq9sP
	s4nR+g4HsNioqcJLafFh3YpVNTSIcdk7JKbAu5BppBRVYmfkd711jpe8Jxfs5lCYWEaw
	0rZU8oqsNaAL2qhpfqM5BdH/qr4Wx4oK0gFJNeL1zLBBYynz5F1/eMWCQDoLIGv2RmjW
	0wYbuT6GQPb8R5l67X2ofx1XSBObg4uzQY+kdo9n5S4jo3/hXUvhIOhtZDIh3pttUE3N
	17BaPWoD8NZneTUq1a5Bgj4limSOeQDvzQZNGzPlynVVMQ2LQAVYjZPZ9JeT7tCV7EVZ
	p+RQ==
X-Gm-Message-State: AFeK/H1/3Oz18n0gj7nBOp41JOxLeldv3MLuUGlDBEa0SQhrCVQm5O1znapx4j3qCaPUiQ==
X-Received: by 10.107.131.211 with SMTP id n80mr3202125ioi.210.1490967673862; 
	Fri, 31 Mar 2017 06:41:13 -0700 (PDT)
Received: from [172.30.15.4] ([67.133.97.100])
	by smtp.gmail.com with ESMTPSA id
	h15sm1258641ita.20.2017.03.31.06.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 06:41:13 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
	<20170331113803.31535-6-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1ce02848-6990-e664-ed17-457ca8b38090@gmail.com>
Date: Fri, 31 Mar 2017 06:41:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170331113803.31535-6-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe][morty 6/7] mailcap: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 13:41:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

not in master

- armin


On 03/31/2017 04:38 AM, Martin Jansa wrote:
> * https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
> index 7d87a5f1d..58b8f029e 100644
> --- a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
> +++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
> @@ -12,12 +12,14 @@ by several applications e.g. to determine MIME types for filenames."
>   
>   SECTION = "System Environment/Base"
>   
> -SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
> -SRC_URI[md5sum] = "eee03824bf86480dc1db20be4f78237f"
> -SRC_URI[sha256sum] = "309059163fa3ef368f8a43fc38f7a45d9345fd725970d5b437ba175a0ee7ebc9"
>   LICENSE = "PD & MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
> -S = "${WORKDIR}/${BPN}-r2-1-46"
> +
> +SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
> +
> +SRC_URI[md5sum] = "d865a1baf574ae5d309f5c1f79315800"
> +SRC_URI[sha256sum] = "c68eb3b531d731476d5980c9b7cc287bd64c2a13bec5a537009a2c4af63f9bb0"
> +
>   do_install() {
>       oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
>   }


