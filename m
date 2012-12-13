Received: from m13-70.163.com ([220.181.13.70])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <huanmateme@163.com>) id 1Tj0B9-0006LL-Sj
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 05:13:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Received:Date:From:To:Subject:In-Reply-To:
	References:Content-Type:MIME-Version:Message-ID; bh=4UdcFHniAkd4
	Av88I6uGyve+fThxb+eTQNHpjB6EWqA=; b=V0Lt0ooiGJYEbVuF+Ftp4aeCqm4m
	5SbB5KCmc8KSvnajV5bFyAF2dYj8st7MKbF2FLC/NV9T1jQQkyhoHILSjnr4HW6P
	vy+n1NdL9cubno/9kYgdV9/8TyhCuEpOgduaD3uTLxw6FZj4BVfJxHn8Np0tGzsb
	bgsO6N0zAU0T7WY=
Received: from huanmateme$163.com ( [61.148.56.138] ) by
	ajax-webmail-wmsvr70 (Coremail) ; Thu, 13 Dec 2012 11:59:08 +0800 (CST)
X-Originating-IP: [61.148.56.138]
Date: Thu, 13 Dec 2012 11:59:08 +0800 (CST)
From: Biao  <huanmateme@163.com>
To: openembedded-devel@lists.openembedded.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20121210(21001.5125.5051) Copyright (c) 2002-2012 www.mailtech.cn
	163com
In-Reply-To: <CA+chaQe-cksdHDfhfyJu7ZDuN_DqrAr-MgcJgJwNasWk=oU9qw@mail.gmail.com>
References: <1c1b83a7.14f97.13b8cef7c19.Coremail.huanmateme@163.com>
	<CA+chaQe-cksdHDfhfyJu7ZDuN_DqrAr-MgcJgJwNasWk=oU9qw@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <491c861e.62ea.13b926a756d.Coremail.huanmateme@163.com>
X-CM-TRANSID: RsGowEApSECNUslQ6pgJAA--.888W
X-CM-SenderInfo: xkxd0z5dwhzvi6rwjhhfrp/1tbiNwKDgE9orJo4SgABsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [OE users] Got errors when building helloworld
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
X-List-Received-Date: Thu, 13 Dec 2012 04:13:48 -0000
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit


At 2012-12-12 19:11:40,"Martin Jansa" <martin.jansa@gmail.com> wrote:
>On Wed, Dec 12, 2012 at 3:26 AM, Biao <huanmateme@163.com> wrote:
>> Hi All,
>>
>>
>> I got some error when trying to build a simple helloworld, can anyone give a brief instruction on how to debug this?
>> BTW. I am trying hard to be OE player, If any of my email style or behavior is wrong, please give a hint or any reference resource, i will correct myself.
>
>yes start with oe-core and layers instead of oe-classic.
>
>For oe-classic you need older bitbake version than what you're using.
>
That helps a lot, thank you very much.
>Cheers,
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

