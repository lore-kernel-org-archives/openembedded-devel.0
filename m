Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtSPq-0003Gd-1Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 00:19:38 +0100
Received: by eaal10 with SMTP id l10so908516eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1wLfjY4FUFXTJwYnnaAYGrpd1VhAyYCWxI+4MEY53sg=;
	b=pkuG1fIgW0gABC1FLoeb4+VjmaZq9HM2xRfePpoi1yk1MadAl2LhR3HItmJXM4mMlQ
	S3v6C2uL3tulAS86XIE1TU4ZP9047nSSiH5iCzHXDFxVxtAW0/gxRDjXSmyKEdzvh4d/
	RHgVBkLhU2bLiJBCijWInlfwCpPYU4oet2oy0=
Received: by 10.213.108.212 with SMTP id g20mr1401209ebp.122.1328310700312;
	Fri, 03 Feb 2012 15:11:40 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	n17sm27388535eei.3.2012.02.03.15.11.38 (version=SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:11:38 -0800 (PST)
Message-ID: <4F2C6930.1080606@gmail.com>
Date: Sat, 04 Feb 2012 00:09:36 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
	<1328210526-8694-1-git-send-email-tworaz666@gmail.com>
	<1328291590.4220.8.camel@mattotaupa>
In-Reply-To: <1328291590.4220.8.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] tmux: Add initial recipe for vesion 1.6.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 23:19:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2012 06:53 PM, Paul Menzel wrote:
> Am Donnerstag, den 02.02.2012, 20:22 +0100 schrieb Peter Tworek:
>> From: Piotr Tworek<ptworek@opera.com>
> Some configuration changed in your setup. Please try to avoid that so
> that so that changelog statistics can be more meaningful.
>
> There is the typo ve*r*sion in the summary.
>
Thanks, both issues fixed in v3.
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> Should you resend patches you can add the following.
>
> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>
>> ---
>>   meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
> […]
>
>
> Thanks,
>
> Paul



