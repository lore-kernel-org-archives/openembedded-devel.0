Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB2B737AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 11:10:50 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so12366528wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pyWEQhRwBKdnp82Yaz+sxVCQnaj5jaGgMR6AoYe+w9I=;
	b=u4bPTkmrrr0xm+UA2M3oUxa9cr/+s6uXw3FMoD74X+V8GGLqqj4WcRQO7WGUbQzhab
	xQQwhKHYWICDX3Fvly7/WYNzOwnq7MwHcj2OjXLfGHwFeva/lXvKUxTodai6NxwqWXk3
	oOg71iSmM2bbWfXOson93s82aTgovUsP3I7mdMurZm7iM0r1MwRk9OYPlqpXE//zaxs2
	YrX6/u61wRk2ldeFp/YzHwfvusNkbhE9OlIlS8rIUaedmR5YtcntbpAecC82h0P1+354
	yiJ+zZF2ayEGxqq+OimO9375+cn1SYlRktemnBuQaHHrPyQn1zmt5X9g/pDFdsDzgwxP
	/w+w==
MIME-Version: 1.0
X-Received: by 10.180.108.230 with SMTP id hn6mr3873310wib.87.1435317051387;
	Fri, 26 Jun 2015 04:10:51 -0700 (PDT)
Received: by 10.27.128.68 with HTTP; Fri, 26 Jun 2015 04:10:51 -0700 (PDT)
In-Reply-To: <CA+chaQdXT-dmhjoi+UtwKvjFnzAUpjGo2YwW3yGJixu8PEy7GQ@mail.gmail.com>
References: <CAHvQdo0+mDR0Gq8DuuMgCp3j40ALA3T5xOd=6E=85uXUWZtaaQ@mail.gmail.com>
	<CA+chaQdXT-dmhjoi+UtwKvjFnzAUpjGo2YwW3yGJixu8PEy7GQ@mail.gmail.com>
Date: Fri, 26 Jun 2015 13:10:51 +0200
Message-ID: <CAHvQdo25wEBw5jj0tdcmPHQxaG=jS+o5j+9V+w3Wvmp5OAPKMw@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qt5.5 test with branch jansa/master-5.5
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
X-List-Received-Date: Fri, 26 Jun 2015 11:10:51 -0000
Content-Type: text/plain; charset=UTF-8

Thx for the quick reply.
I tried it anyway and got stuck at qtbase configure "makespec for
platform 'linux-oe-g++' " with a Syntax error.
Can I somehow support you in this task?

2015-06-26 12:19 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Not yet, it's just WIP (I've sent the same patch to ML a while ago, but
> didn't have time to finish it yet).
>
> On Fri, Jun 26, 2015 at 10:55 AM, Johannes Pointner <h4nn35.work@gmail.com>
> wrote:
>>
>> Hello Martin,
>>
>> I discovered our qt5.5 branch and I am curious if it's useable to test
>> qt 5.5 rc?
>>
>> Thx,
>> Hannes
>
>

