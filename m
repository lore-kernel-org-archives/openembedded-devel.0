Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E6EF875F3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 16:59:47 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so56036971pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=X45o35cIKhIYWx71NwiLQDs+qvcS2GpPFpvfBqKLmDo=;
	b=AaUvIXY5qhDjUkcjImXLveh4GR+qkiQ+qs9rrplJ24gnRw9zbc2n4hsJg5HFUj+I0G
	dslJO6ZYBz2RMUplFhTE1ZNxE6fPFnFetpMHbVafkronl69XnYfQf5fU1b+/E3NEdmD5
	HNSaJmSD03LNgNtvZA3iDxKlBZxpmcWUA5dMWzcBmWEvNcBg68gDR1jyHQ8XhyZs1OFv
	aK2F+UqznhDPeFof9rynfoFmw6vfFuwEB6crt12Bwj8UzgyHye/v4T6ZzqvQRUOhGgOD
	Uu3eW6cZxszA3C+Q3yKQ2cySGj8GHKl+jHXaBwTxtBgE4L+MAUmuROQXBJlN1yDHlRAO
	Sakg==
X-Received: by 10.67.3.129 with SMTP id bw1mr2793335pad.20.1442595587611;
	Fri, 18 Sep 2015 09:59:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b9e8:8e8a:e8f8:c8bf?
	([2601:202:4000:1239:b9e8:8e8a:e8f8:c8bf])
	by smtp.googlemail.com with ESMTPSA id
	k10sm9964618pbq.78.2015.09.18.09.59.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Sep 2015 09:59:45 -0700 (PDT)
Message-ID: <55FC4300.80503@gmail.com>
Date: Fri, 18 Sep 2015 09:59:44 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
	<20150918120900.GB11095@jama>
In-Reply-To: <20150918120900.GB11095@jama>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Fido backports
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
X-List-Received-Date: Fri, 18 Sep 2015 16:59:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 09/18/2015 05:09 AM, Martin Jansa wrote:
> On Thu, Sep 17, 2015 at 03:08:27PM -0300, Otavio Salvador wrote:
>> Hello Martin,
>> Hello Armin,
>>
>> Please queue following backports for Fido:
>>
>> # Fixes
>> 6ea7ac01
>> 607b114d

Acked-by: Armin Kuster <akuster808@gmail.com>

for the two above.

>>
>> If noone has objections I would like to propose the backport of:
>>
>> # Upgrade
>> 2c57f950a

Is going from 0.9.2 -> 1.2.1 bug or security fixes ? Give me a real good
reason to allow this.

>>
>> # New recipe
>> 2315f412f6
> 

I thought adding new recipes to a maintenance branch was not allowed ?

- armin

> All 4 pushed to fido-next, but I'm still listening for objections.
> 

