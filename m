Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id D6A8D601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 18:24:04 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id f10so8391083yha.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 10:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=2KXWl9SAzSFOBk+lgt1PAGjgXXPOjSOssRJlOZfKZKs=;
	b=mFADjfps39b+px9JVbW/9jFvqtulHHpgfk7m5KNW7zfR3UnG8Pk6dWBgfclhFLV0eI
	CWaozD7XmxKiv9SaOXHo1CV87oOTVKN2aUsQTXnc8YeCWForfzRRI9+hrcMrXYOFVHd8
	SJf601ahf9pXrRtQrcXWqSO2zlojFvbp5av3Lid1pThaKkef/L+1FNFiqZjpLWhrQAHm
	49EIPa392/GG37RqnKpOhTwic/LQohRAZnw0U4hHApXtNTQboyEu9PG/RQ+38nKGVA8P
	2ANjBq+D3l+QQ5YWqCPOzYkkAoOYJYsvtn0koALc6/S3usvmumYkWvsxUK7Np6eTkpzV
	8pvw==
MIME-Version: 1.0
X-Received: by 10.170.130.21 with SMTP id w21mr14261279ykb.22.1417717445048;
	Thu, 04 Dec 2014 10:24:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Thu, 4 Dec 2014 10:24:04 -0800 (PST)
In-Reply-To: <20141204155636.GD2453@jama>
References: <1417697009-9094-1-git-send-email-rapphil@gmail.com>
	<CAENGNheKVaQD13gwSFU-cjm7K_aUAHujZLQMMs=nq=fR6nWxWg@mail.gmail.com>
	<20141204155636.GD2453@jama>
Date: Thu, 4 Dec 2014 16:24:04 -0200
X-Google-Sender-Auth: rUuUgF6R25k3GEpmPZI4btnMstk
Message-ID: <CAP9ODKo=m=3+dVo_Z8FnA0Jzo8=LyFUJoxVzZqnDoE+HxRR0FA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] acpitest: fixing failing recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 18:24:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 4, 2014 at 1:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 04, 2014 at 01:09:18PM -0200, Raphael Philipe wrote:
>> I noticed two typos in my patch. First i didn't use the prefix
>> [meta-oe], and second, in the subject, it is acpitestS the name of the
>> module.
>>
>> It will not happen again :)
>
> Cool, will fix when cherry-picking to master-next.

:-D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

