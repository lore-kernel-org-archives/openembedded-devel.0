Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D27260053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:54:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l6so21050462wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=WmqqFWcnQ7fceJl7zsyXI7WGsm/G/fRIRhvT2E6GOTo=;
	b=kJZuKbekn3PW2cFeSd/ssdr17K1Z9RNBrT9OsOGiG1bovqxaIwknDdhEz6xZeDDVQy
	VTut9KPsD4Y0LLjfFT6HAc1G7RIek718d1fErnawIH4UQQjLp5JzFPVotUYNNkWttLXo
	JL5hrBT9ak2jwI2YyfLjthZ/bNHVErpnn+fE3snbi50Q2sczt5ii55DN7Xmri6tlZpW2
	DWSUwD2VCcgISMXe54r6tX376loimjVgXhqQr/r6p1BXdA/5dkLYRYxGqHQ6ZmqU0zbb
	dO6J2mUr2ffwdrf/oJZx8Ztv5ZcaQaONXum3UDAgoOvvg6UegeoyJYS4DBdvU5EkOyhB
	FxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WmqqFWcnQ7fceJl7zsyXI7WGsm/G/fRIRhvT2E6GOTo=;
	b=erE7GBlsf+erHUujiP3IS24olHYaBDJBlrQ/GIdKWR2tw2LyhMPdvzC9rYJGXi7Yb4
	Jz4MMf7N1I24o7/4CpqptqvohAcktheqbEc/u6E3Lg7U5v2itQATo+iFROyBzQoZhd2N
	iwAzKKXCWl7OOXy+2xA7HLQMefO/HhrYFKlkNf1xQnpN7Bpp/CpzvRfr2+f8HmeIbstI
	XZb8Ddeqik3Y1f/+WmUrXbwW0XinI9WY/71pbMF2yET0VWvlLUWwbsjLy1yjhPDcY8W1
	x9kibOD2IS1H1Ar1q8yKpeiEOOmt/Inu4mgkKqV3yrS3HLXH+KbGK/eIbGt+7ixlnXSv
	f5fQ==
X-Gm-Message-State: AD7BkJJFekEA+vkK2zBWEHXBoEPG8Fbfb6FqFpcC08t9tpliKqNtWs7OR2e5zOss5tMQxQ==
X-Received: by 10.28.35.82 with SMTP id j79mr18533565wmj.78.1460379270110;
	Mon, 11 Apr 2016 05:54:30 -0700 (PDT)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	gg7sm27778501wjd.10.2016.04.11.05.54.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2016 05:54:29 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
	<570B3E08.1070908@theqtcompany.com>
	<CALbNGRQfDnvkO4UT69fF9nPRQzf9L3Z2xZ7LkhCgGX+kDgk4uw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <570B9EA0.1010206@gmail.com>
Date: Mon, 11 Apr 2016 15:54:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQfDnvkO4UT69fF9nPRQzf9L3Z2xZ7LkhCgGX+kDgk4uw@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH v2 31/31] qtquickcontrols2: initial add 5.6.0
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
X-List-Received-Date: Mon, 11 Apr 2016 12:54:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.04.2016 14:09, Andreas Müller wrote:
> On Mon, Apr 11, 2016 at 8:02 AM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
>> On 10.04.2016 22:41, Andreas Müller wrote:
>>>
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>> ---
>>>    recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>    create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb
>>>
>>> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb
>>> b/recipes-qt/qt5/qtquickcontrols2_git.bb
>>> new file mode 100644
>>> index 0000000..41c781e
>>> --- /dev/null
>>> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
>>> @@ -0,0 +1,15 @@
>>> +require qt5.inc
>>> +require qt5-git.inc
>>> +
>>> +LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
>>> +LIC_FILES_CHKSUM = " \
>>> +    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>>> +    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
>>> +    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
>>> +"
>>> +
>>> +DEPENDS += "qtdeclarative"
>>> +
>>> +FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
>>
>>
>> all /designer/ files should go the ${PN}-designer package, since they are
>> not needed in the target.
>> Should be added by including one more level of subfolders in qt5.inc
>>
>>> +
>>> +SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
>>>
>> --
> I checked the image of qtquickcontrols2 for files matching your
> comment but can't find any. What files do you mean?
>
> Andreas
>

Without the FILES_${PN}-qmlplugins addition, bitbake throws error:

ERROR: QA Issue: qtquickcontrols2: Files/directories were installed but 
not shipped in any package:
   /usr/lib/qml/Qt/labs/controls/designer/qtlabscontrols.metainfo

This should go to ${PN}-qmldesigner package, as well as all the other 
files from /usr/lib/qml/Qt/labs/controls/designer/* that are now in 
${PN}-qmlplugins
See FILES_${PN}-qmldesigner in qt5.inc

-samuli

