Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC10E70527
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 17:25:15 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id fp1so1584356pdb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jR/VGC0xh/DQkg614WjXzFo8RiSlQIssrFdhIFaFZ2o=;
	b=YK5X6e7QBgKmaWY62RKkIgsBSe4ZvFBZRpF4Cn2WVZzSSalla1w2v6InCtqkfyuvbK
	sNtb4fyM/fYyV++b1XM8D23GfxzXAUlIT880xl1c3ooXcw+Kv4k//ieNsdNXOgR9Hjm1
	zNkl6vin8r7cd98oRiZ3BleoNGUqMLV9gez300XSBKSSDpdpxUnikEbVZemB0kfX8teI
	UjT5DgLy0y+H90iYb3jwwURQuYe6Lh5niuZF+EMUi17plKABnVCC2ED9RdRe+xX7DMTH
	Bgle5gI7GYgABg5rDjqb8zrYA1U+PppsSFOa98nmIBXXwMheK7Fons7RPyFG/in2kN1j
	YdVQ==
X-Received: by 10.66.100.227 with SMTP id fb3mr3672334pab.150.1405531516659;
	Wed, 16 Jul 2014 10:25:16 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id pu5sm17654362pbb.4.2014.07.16.10.25.14
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jul 2014 10:25:15 -0700 (PDT)
Message-ID: <53C6B577.2050909@gmail.com>
Date: Wed, 16 Jul 2014 10:25:11 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <CAP9ODKow7gr1J8_peZJNT4+soQ_vDQP_hi4DYnjx7E0uTCUoBg@mail.gmail.com>
In-Reply-To: <CAP9ODKow7gr1J8_peZJNT4+soQ_vDQP_hi4DYnjx7E0uTCUoBg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [for-daisy][meta-oe] Patches to cherry-pick from master
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
X-List-Received-Date: Wed, 16 Jul 2014 17:25:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/16/2014 08:21 AM, Otavio Salvador wrote:
> Hello,
>
> Please cherry-pick following patches into daisy branch:

who does this?

>
> aa7cccf cpuburn-neon: Upgrade to version 20140626
Signed-off-by: Armin Kuster <akuster808@gmail.com>
> 6006202 v4l-utils: Add virtual/libx11 dependency only if X11 is available
Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> I am adding the other maintainers so they can add other changes to be picked.
>
> Cliff and Armin, please ack those if you have no concerns about them.
>

