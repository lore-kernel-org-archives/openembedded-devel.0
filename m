Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31ADF744EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 21:21:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r82so794644wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WOSFx+O5JiadjT7znL5OEIjIpUhoqHXcnW+VZjU525s=;
	b=CcePbVkx/KKr9QKBwEUUM6+aJ8U7HppFLXFgF+ix8lmlPbMzb3vQ5I9cIQxUtih/eM
	iR5OWcUpFegpJYeMU8nVVfofOk7Wj2GIwRhY2VgEQqOB6eVg6du+Kgvi2TKeZd7rYHTx
	b4d87I/MzxVaZi7rZeyYHCzKeQoZ/yiLqtlxV0PHiIcuNlyPP9SSGKwdhDzIyfuCZIpJ
	8sqjufmPS+cTRrfqcj3qC+rHdvSCqE5hzYbtVYeA+s1RCyZnZH35Fm8wz+tAdZp9GUT1
	bHvPwm9ZXnJv/65PpG88oKAnLGYohHkRPCrhByfX1akaA4bE6Hx/AU2PbDnEGWjv7Llh
	G5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WOSFx+O5JiadjT7znL5OEIjIpUhoqHXcnW+VZjU525s=;
	b=RLTnK4Va+6hsjMzjUcvnycPeyErIVY5CVoVkxjUjbbm5LjwPtPcJro9o+sG2trTi0u
	WSs4BwiivopSvHHyudK7XW/ATgZ7BV7C7wjck3NnKEQs2iRu0AMaCAS7UoJEVfifkuBM
	XHyO1mfI2EErmrlkmoRtqjFHEoGfEEh42ovq5RtrEuUkf/zwyuJ8cCDFNcX2tQ5gEd/U
	V865PshjmBqGTPIq5IlfQAlIRMtaaiM5q81Mf9tCvNNxt+7Jgg9XV2ok6fUZxvtblohP
	wqg8nPc82kcDXFsVT00+zK6M5Fgj2vGldF9WDEnGfjpxM6xDmc9FZBXC36HzzCmX6l6E
	5IrQ==
X-Gm-Message-State: ALQs6tBet0BLMopK5lbNFQOUZi5bGjGTG7yjjq2r4mJjfWY00r1kOsiy
	A5fSp/aCRv90X1RYNGc8PYmmrWWtNIve5+h54pQ=
X-Google-Smtp-Source: AIpwx4/DQ9eUPilE64FrCvt8FvnIZHVpBK9C0hRLoDoewNJjJ5sgVRfkO9sOfyZ1ZxsqTAIvTsvDQbDeugB+ZTZJ3+c=
X-Received: by 10.28.132.211 with SMTP id g202mr1826247wmd.17.1523568073729;
	Thu, 12 Apr 2018 14:21:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 12 Apr 2018 14:21:13 -0700 (PDT)
In-Reply-To: <CA+chaQeW=C8ZAhUSyNBH8r1ptnotA_o3Chj-ysNUxVSGH3sXcg@mail.gmail.com>
References: <20180412190931.4057-1-daniel@zonque.org>
	<CA+chaQeW=C8ZAhUSyNBH8r1ptnotA_o3Chj-ysNUxVSGH3sXcg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Apr 2018 23:21:13 +0200
Message-ID: <CA+chaQfSC_iBD6osNhz1zmOZiuxFEpVBFjtn-AHNmeDwn3-6XQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Remove license files that were dropped in 5.9.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2018 21:21:13 -0000
Content-Type: text/plain; charset="UTF-8"

Included in rocko-next and jansa/rocko branches now, thanks.

On Thu, Apr 12, 2018 at 9:33 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Thanks I already have this part for qtxmlpatterns, will do the same for
> qtquickcontrols.
>
> On Thu, Apr 12, 2018 at 9:09 PM, Daniel Mack <daniel@zonque.org> wrote:
>
>> See upstream commits:
>>
>>   https://code.qt.io/cgit/qt/qtquickcontrols.git/commit/?h=5.
>> 9.5&id=a843884697602891d21b9f9bc62603548dd6a6b8
>>   https://code.qt.io/cgit/qt/qtxmlpatterns.git/commit/?h=5.9.
>> 5&id=81dd12388d67f6b2be253ea831b876c8dec2dca5
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>> Martin, you can squash that into your bump commit if you wish to do so.
>>
>>  recipes-qt/qt5/qtquickcontrols_git.bb | 3 ---
>>  recipes-qt/qt5/qtxmlpatterns_git.bb   | 3 ---
>>  2 files changed, 6 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
>> qtquickcontrols_git.bb
>> index 14b465a..c7c491d 100644
>> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
>> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
>> @@ -4,12 +4,9 @@ require qt5-git.inc
>>  LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
>> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
>> The-Qt-Company-Commercial )"
>>  LIC_FILES_CHKSUM = " \
>>      file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>> -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>>      file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>>      file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>> -    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
>> -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
>>      file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>>  "
>>
>> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
>> qtxmlpatterns_git.bb
>> index 3787b86..7a027b4 100644
>> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
>> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
>> @@ -6,12 +6,9 @@ HOMEPAGE = "http://www.qt.io"
>>  LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
>> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
>> The-Qt-Company-Commercial )"
>>  LIC_FILES_CHKSUM = " \
>>      file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>> -    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
>> -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>>      file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>>      file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>> -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
>>      file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
>>      file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>>  "
>> --
>> 2.14.3
>>
>>
>

