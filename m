Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id CC8736ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:21:00 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id b6so4989201yha.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=O9Uhiqt3xIZFpd8wgUdLgk6Dc10hXgjlP7rbLddnrD4=;
	b=XDu3nQmzFcyIISj7Wjk3qHJrtu79wfVHwYJx7UbIOPAKx/w9zBZXotRWApLY0c0Y+w
	5Ehgt2VJilX9cAmjyazmO/AOBed8KAdEGyjc9jvhyHu/cwTt4998aPp/772Ld15tPAb/
	plJ/x6oQ2dl3PivGeeHPYPExa6zcJTisUqoDJC7xaoRSQzePvcTz4wOzk9wVQJ/+WDJP
	ST1z6EQAa63EQts4l65W7mDRCH/g3BUbcFxYDj3VqXpcsG4IyBUu89p6sVSPPOewxnRC
	h6N2AfFhAbMwOj/pWyuw0nncBOBbxq/jQJJqCJW3Fxx3+jPIkInS32Yfd9vMCI9vxK57
	LEzQ==
MIME-Version: 1.0
X-Received: by 10.236.207.225 with SMTP id n61mr3617349yho.148.1403529661242; 
	Mon, 23 Jun 2014 06:21:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Mon, 23 Jun 2014 06:21:01 -0700 (PDT)
In-Reply-To: <20140619115701.GP2117@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
	<20140619115701.GP2117@jama>
Date: Mon, 23 Jun 2014 10:21:01 -0300
X-Google-Sender-Auth: Aw5JdHpgx4GAPggYOtNIta7UqJk
Message-ID: <CAP9ODKp3AEoFrbuaE2x1pPe+5zcEM3Ep_9gSjSOpyKwNbF6T4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Mon, 23 Jun 2014 13:21:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 19, 2014 at 8:57 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
>> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2acf:
>>
>>   python-efl: add dependency on python-dbus and lua to always build
>> edje and elementary bindings (2014-05-12 10:08:28 +0200)
>>
>> are available in the git repository at:
>>
>>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
>>
>> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
>>
>>   live555: fix fetch problem (2014-06-18 13:42:35 -0400)
>
> Thank you!
>
> Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

