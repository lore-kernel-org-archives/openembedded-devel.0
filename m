Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UIGff-0004fG-3h
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 11:55:05 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so1396756obb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=F1cdAl1QsNYb0JeQOZ0pzCJ4/KIvV6/lgyLLRvlAja8=;
	b=YP5sWFjirAtfDl6Uj5xd5kgqpKAIknr+3IkQ30tw9jcJJvjeHbD+0t23lpI3MNQYun
	+eSYIH3xV4ju1ntrn2RvnNKFENDlA5Vzs6/6RaXZaDYlvxsHkL59kdMYkVj0XbyXaBbE
	9mY9I6xI9kGdREHwrfL5Q9V5kDd5NdzgvL25Z6IjUHbnqs2hIXdLT+TDDCqFQ3qEqpo6
	59V7m1lZov7ZxUtRLwGDxqM7hWPxFZ3nDwS4PPVHupQyGpO6RO5dMAzpFE/EX1pRGHSU
	57+V2uwcUPrAcYy1ShybpM39qsfQDjSjKhY8cXyZ+ISVenhtMHKqXA1jKWYBIGTkfwf6
	FdSg==
MIME-Version: 1.0
X-Received: by 10.182.127.115 with SMTP id nf19mr3671426obb.49.1363775891866; 
	Wed, 20 Mar 2013 03:38:11 -0700 (PDT)
Received: by 10.60.76.199 with HTTP; Wed, 20 Mar 2013 03:38:11 -0700 (PDT)
In-Reply-To: <5149872D.7090803@linaro.org>
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
	<CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
	<5149872D.7090803@linaro.org>
Date: Wed, 20 Mar 2013 11:38:11 +0100
Message-ID: <CAGiJk9euivOqJU1_LR0cRVgwe9WtYDwbCAwq9WFiPuSd9ZOaZA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 10:55:06 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/20 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>:
> W dniu 20.03.2013 10:32, Samuel Stirtzel pisze:
>> 2013/3/20 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>:
>>> W dniu 20.03.2013 09:51, Khem Raj pisze:
>>>> ERROR: QA Issue:
>>>> /b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.bb:
>>>> Variable pkg_postinst is set as not being package specific, please fix
>>>> this.
>>>
>>> meta-openembedded has 2.1.26 in meta-networking so meta-kde copy should
>>> be removed.
>>>
>>
>> Hi, it seems there are some differences in the recipes, maybe we can
>> work through them.
>>
>> Is BDB 5 working correctly with this version, without the patch [1]?
>
> It built properly against db 5.3.21 - support was added upsteam.
>

Done



--
Regards
Samuel


