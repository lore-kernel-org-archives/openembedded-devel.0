Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 671C56B238
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2013 20:24:32 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so10652327iej.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Nov 2013 12:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QL59mgEYaptEEYOgpsoqsF4TTyTg/shmM/NGHtLORzQ=;
	b=oCXdik+Fb8KJquYN34rRV2rwhpDttlRLfyR0fGOcPQ2SxmWuntO3PDcy1jqlOckqWE
	B6ixIBwYVKCU/spsypjrI3ybC3mW1IJqIX+E4Pq/4ZoVXwn3V8e4Lg6zA6FwRoMfr3AF
	/CWOn5HZpGzoVFrfeUuSDmN+gz/Z3g6hjAc4m1FRe6DPa+v1oJ0Y9IzfmIuCJcPZl/u9
	FWZI0A1WNryw5+ndyr5Nana6L8hrjviLfr6rYiI/mzNuxRxdHQcIQzuAQxdLLbEiW09U
	1778BQb9cbBThSpihaqa5+Q+zyDUCCvpquyOY7qWBvgZdu/zgVWs/2rUteTtEFKm9u+r
	j7dw==
X-Received: by 10.43.152.78 with SMTP id kv14mr7903764icc.13.1383510273801;
	Sun, 03 Nov 2013 12:24:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Sun, 3 Nov 2013 12:24:03 -0800 (PST)
In-Reply-To: <20131103182036.GA3684@jama>
References: <1383491674-13152-1-git-send-email-raj.khem@gmail.com>
	<20131103182036.GA3684@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Nov 2013 12:24:03 -0800
Message-ID: <CAMKF1spnfmrgXj-TpfJ7Npb+NE6BrMNS=kJMzHV4_vrKsVLYvw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] cmake: match bbappend to OE-Core version bump
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
X-List-Received-Date: Sun, 03 Nov 2013 20:24:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 3, 2013 at 10:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Nov 03, 2013 at 07:14:34AM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-devtools/cmake/{cmake_2.8.11.2.bbappend => cmake_2.8.12.bbappend} | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename recipes-devtools/cmake/{cmake_2.8.11.2.bbappend => cmake_2.8.12.bbappend} (100%)
>>
>> diff --git a/recipes-devtools/cmake/cmake_2.8.11.2.bbappend b/recipes-devtools/cmake/cmake_2.8.12.bbappend
>> similarity index 100%
>> rename from recipes-devtools/cmake/cmake_2.8.11.2.bbappend
>> rename to recipes-devtools/cmake/cmake_2.8.12.bbappend
>
> This isn't enough, see
> https://github.com/meta-qt5/meta-qt5/commit/b6df9940324fe8007fbbe7de076075485d50a925
> which I'll push later today.

good for  me. I was just doing the monkey job to get through parse warnings


>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

