Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 581C673C7E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 13:44:54 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so21440719igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sek5fIV7vKPElwbWxan/zSIoVBuo1Rk7gPTX4/a+mq4=;
	b=Zzxfj+m9tqvj+YudpUMnT4wyj26i2Z9YrQfdQZ6URrE0nDzz1HhTThwwTN0g+qpLxo
	66iQEJg+pZ+b800cyMtqQPt3hasC4Ce6Nb6iUSy6v220YFcgo+aQqw5weQ9VURC2qidG
	jLbUoVBlFTZe9LJgn7qJ//NUmRaX4YKUMRieL4YF0sR0V6Bg9ogUGULfceJNCpPoo9oV
	5qhniuWlh8B7Ec8raRqOl6cQMurVwwmQC6TM6Vug8GwhSaJsjK696CxTZo/IJgJTSEWh
	VwNirREnvHU6a+SLOAfj1uG8x41MovI5UppS0OSPu/Z4uYI82SkTYJDMjfWnEnR8f0Il
	Gxfw==
X-Received: by 10.42.235.83 with SMTP id kf19mr4106541icb.41.1431092695862;
	Fri, 08 May 2015 06:44:55 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id
	j39sm3464472iod.41.2015.05.08.06.44.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 06:44:55 -0700 (PDT)
Message-ID: <554CBDD4.1080004@gmail.com>
Date: Fri, 08 May 2015 09:44:52 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5548E485.6080505@gmail.com>
In-Reply-To: <5548E485.6080505@gmail.com>
Subject: Re: ODROID-C1 support
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
X-List-Received-Date: Fri, 08 May 2015 13:44:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Christian,

Sorry, I missed your announcement before replying to Armin's post about
the -xu3! I was reading through my backlog of Yocto mailing list emails
and hadn't made it to my OE backlog yet ;-)

I hope we can all pull together some sort of common amlogic/odroid
layer(s) together.

Best regards,
    Trevor



On 05/05/15 11:40, Christian Ege wrote:
> Hello,
>
> I've created a BSP Layer for the ODROID-C1 and other Amlogic based
> devices like the Wetek.Play
>
> https://github.com/linux-meson/meta-amlogic
>
> regards,
> Christian


