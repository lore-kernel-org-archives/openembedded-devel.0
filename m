Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TikS6-00081O-7z
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:26:29 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so398955wic.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Faq0boiFCV3thSUzJ9/HXezElNHttT/vZ6w5n7QVquc=;
	b=PLYjrJbqfVqDl7+atXcJ4MGYqUaqswIAOJj4ZBSqOzLDYJXXehTCQJH7ixiXRvBjZe
	tCgH9lfKJq80fow7AghKlUY05Te7884Hl298Tdp0CEMGFYTtTwhqQDSSgJKPlBudSeQd
	8vQfV2jQVFtxC9TnAiCyBFifdfCJTkRwvR+1ZES4T3u6f6VpqJQVLfzyLhvdwG/o8Sav
	kPINaLhHi1UHhmXuoLPNsi62eMKc1lsGDRNOA3bpiJ5hhO07z47dL3Ibw23ehYuIY9SI
	AtQxgLTxqGtStf8UKcXBfopxw4iQ5upmbI3wE7mbOeCi7XF4YF+P3oq0yVaSehYnADNp
	SD2w==
MIME-Version: 1.0
Received: by 10.194.76.99 with SMTP id j3mr1209735wjw.47.1355310700969; Wed,
	12 Dec 2012 03:11:40 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 03:11:40 -0800 (PST)
In-Reply-To: <1c1b83a7.14f97.13b8cef7c19.Coremail.huanmateme@163.com>
References: <1c1b83a7.14f97.13b8cef7c19.Coremail.huanmateme@163.com>
Date: Wed, 12 Dec 2012 12:11:40 +0100
Message-ID: <CA+chaQe-cksdHDfhfyJu7ZDuN_DqrAr-MgcJgJwNasWk=oU9qw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 12 Dec 2012 11:26:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 12, 2012 at 3:26 AM, Biao <huanmateme@163.com> wrote:
> Hi All,
>
>
> I got some error when trying to build a simple helloworld, can anyone give a brief instruction on how to debug this?
> BTW. I am trying hard to be OE player, If any of my email style or behavior is wrong, please give a hint or any reference resource, i will correct myself.

yes start with oe-core and layers instead of oe-classic.

For oe-classic you need older bitbake version than what you're using.

Cheers,


