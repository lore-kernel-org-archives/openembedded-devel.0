Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 83E1673895
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 20:13:40 +0000 (UTC)
Received: by yhot59 with SMTP id t59so19659330yho.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iamtgbcn/CVmLQoLT49DSELOblDWeSqhzUg8SLflS0Q=;
	b=ygO81VA4SnaZFa7w9DsEyzz7G+FRE9yB+156W+uXXjP8O6I7uXwViaj2U/RuVF0L0c
	Da6Z++6LF6JRuI2lAYgXkR5/dqgyBgcGfV5bXIPqYES1EYq8xyVywPtP8m/+YroiyxYO
	8+W1OQnVsfsvOuozAB1mCRaBhnMBzTBHCsLIw+yxaiBRTZAiY3XLEQJ/NWYve393ohs2
	DrDGk5YsTdCtv8lnT1a4Ux0GYmI3YDJWMwgVqU4fimBYAtnw8eZPTUvbV7H1sqvtyfX4
	YlBh0T+26puhGNpC72UZwdyT66iHXKsWYoGEiqluxa9a+L2yzzshKZI2Yd79A0F8o6fh
	KTrQ==
MIME-Version: 1.0
X-Received: by 10.236.36.65 with SMTP id v41mr452951yha.102.1425413621798;
	Tue, 03 Mar 2015 12:13:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 3 Mar 2015 12:13:41 -0800 (PST)
In-Reply-To: <54F41044.4070206@dresearch-fe.de>
References: <1425041152-21513-1-git-send-email-sledz@dresearch-fe.de>
	<1425041152-21513-2-git-send-email-sledz@dresearch-fe.de>
	<54F41044.4070206@dresearch-fe.de>
Date: Tue, 3 Mar 2015 17:13:41 -0300
X-Google-Sender-Auth: 24-8CO-sHp3UgHO4Y05d9JwciFE
Message-ID: <CAP9ODKqQxe_QpxvFWvO=nuug1oc7YpOo-2j__DFrd=5aSF+D3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][dizzy][PATCH] rsyslog: fix name of syslogd ua group
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
X-List-Received-Date: Tue, 03 Mar 2015 20:13:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 2, 2015 at 4:24 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> On 27.02.2015 13:45, Steffen Sledz wrote:
>> (backport from master)
>>
>> All the other syslogd implementations use 'syslogd' as update alternatives
>> group name. So rsyslogd should use this too.
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

OE: 4151e38933865d9306d027aca0c045d788ca52f3

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

