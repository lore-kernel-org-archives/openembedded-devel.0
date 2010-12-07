Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PQ65X-0006R6-AV
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 23:32:48 +0100
Received: by iwn40 with SMTP id 40so225469iwn.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LverG5LSrxpR2ch6Z4WLhCnEdcbdrpWMFvW40RqaJDQ=;
	b=D5GHAqkUyXpZGxfPnp6u6WjXBiH4VL9uAZuk0A6lZSeJ9fDMTY5yy2VGJzPvalypvJ
	EFqIbeqCEnMovLkWej/UUwr12C1/VKe3ELHU8+SJ1z1hfBVm4f5QgC+4BaybCQBJNlyX
	RZxvR/LB8N3mxdCYObkPObBEytUqTYgSLqOB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=w4U9F/vnbN2ayqZ3vzVs6XQN2wzhKSjUNcwBAccFhKHQjTNG3T1JapPZevBfnhOju6
	mPHHWQaVd7r71SwlNHtrBGQLwZtdFBRZDzzR6/t2usuesWJciywquQzugwBrP98yU3KI
	1pqZFD4bW27fHe0t9o4rxYzfZ5+zPrcboD1iw=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr8284467ibc.7.1291761079955; Tue, 07
	Dec 2010 14:31:19 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 7 Dec 2010 14:31:19 -0800 (PST)
In-Reply-To: <4CFEAF1F.70606@zenlinux.com>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
	<4CFEAF1F.70606@zenlinux.com>
Date: Tue, 7 Dec 2010 23:31:19 +0100
Message-ID: <AANLkTi=Fdzno-FEVemtQ6GQGk8XpunYPy-bHSm=cnRBu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libcdaudio license issue
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
X-List-Received-Date: Tue, 07 Dec 2010 22:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/7 Scott Garman <sgarman@zenlinux.com>:
> On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
>>
>> I was checking libcdaudio for LICENSE info.
>> recipe says GPL
>> COPYING file is the GPLv2 one
>> README file says:
>>
>> libcdaudio is distributed under the GNU Library General Public
>> License, included in this package under the top level source directory
>> in the file COPYING
>>
>> C files also mention LGPL. but say v2 or later
>>
>> What to do with this in the LICENSE field? LGPLv2+ ?
>
> Like others I agree with going with what the source files have in them.
>
> Maybe this is obvious, but since I don't think anyone else has mentioned it,
> I think it would also be helpful to notify the upstream folks about this
> ambiguity so they can correct it.

Good remark.
However, the project seems dead. Last post on the users mailing list
is from sep 2008 or so.
There seems also to be an app in the zip (cdcd) maybe the gplv2
applies to that one.
Will peek at it when I have more time, really need to zzz now)

Frans


