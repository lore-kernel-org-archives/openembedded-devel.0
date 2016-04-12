Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBDA60670
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:39:26 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x190so1013123vka.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 23:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=mp3ECqhjcwizoHxQwvOJE4A7IWBvItx7a9WZOamml+0=;
	b=CeiNk/+caz3ZmjJlqCJvSk1bB2KHQ/9EjynAYHkaXimuBuuZPZY9m+gebxqsSbgCLd
	DfeW6eXi8K6yBUhSFuqszdeEgNBWknvPU6v6q8PMyJenY3jkkyMVwJfgH4SFTl5IjjFR
	RLjD5pIWAedP+pwD84YlqYrMN4zSDX3bwLRGjKQiwfeChWA/OJcLmr9el4KY10pLQHHi
	TiWDmNUeEJGx+i0Vt1AQ+09xr2T2hxdx5MhzsO9sQ5e4Jpoi9rLZ6W7CU5pfQubbUBue
	FK7OykK92esJN725Exm/4U2wn5h+XJ/ouhbJgM1/QZph0mLSBsNv4w39XRLIQ2L+eDBt
	Vpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=mp3ECqhjcwizoHxQwvOJE4A7IWBvItx7a9WZOamml+0=;
	b=g+rky6IaexLJknNoEfMgLZuyiIIQo9QOrzzZYuziqOR0REz5uzRrBvQfyoBYvT3ybz
	yYIOknhU/nj3LQrpwPmN+z9STdqZVeo20yAYmaCdMffEh87iczfAenxFIn3HCDBguXfO
	sE6piDRbhskFNldbW77ggV0JhlnlwWnW0Qyp6pM7vrOvRKwLpxRIAmkNAV+qv63SSaiF
	CsDT10Un52/DVYCKXYBpEktrwjUQkVgJxDrUBnlL55tBHVo65n4RbC9RCDeDTPoXBRQx
	As/f8+CBfOpll5Uh+qsj4iaZVjVkkzTzyPBfqa94cCQTGAZUFEDsNvbkdt+hWBc7TgeI
	mcRg==
X-Gm-Message-State: AOPr4FUZNRxf9s/JqLz15gpoJVKK8IthyLOJO8x6TJ0Ixx03M35adHAm10HuY2+1LT4zpmPKki7VBjrdQzg9qg==
MIME-Version: 1.0
X-Received: by 10.31.192.78 with SMTP id q75mr819422vkf.96.1460443167289; Mon,
	11 Apr 2016 23:39:27 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Mon, 11 Apr 2016 23:39:27 -0700 (PDT)
In-Reply-To: <570B9EA0.1010206@gmail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
	<570B3E08.1070908@theqtcompany.com>
	<CALbNGRQfDnvkO4UT69fF9nPRQzf9L3Z2xZ7LkhCgGX+kDgk4uw@mail.gmail.com>
	<570B9EA0.1010206@gmail.com>
Date: Tue, 12 Apr 2016 08:39:27 +0200
Message-ID: <CALbNGRQg5=jAUhNvy8jqVW+6zfO5i1_eD0dpJp+3euR1143iPg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Apr 2016 06:39:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 2:54 PM, Samuli Piippo <samuli.piippo@gmail.com> wr=
ote:
> On 11.04.2016 14:09, Andreas M=C3=BCller wrote:
>>
>> On Mon, Apr 11, 2016 at 8:02 AM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>>>
>>> On 10.04.2016 22:41, Andreas M=C3=BCller wrote:
>>>>
>>>>
>>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>>> ---
>>>>    recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>    create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb
>>>>
>>>> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb
>>>> b/recipes-qt/qt5/qtquickcontrols2_git.bb
>>>> new file mode 100644
>>>> index 0000000..41c781e
>>>> --- /dev/null
>>>> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
>>>> @@ -0,0 +1,15 @@
>>>> +require qt5.inc
>>>> +require qt5-git.inc
>>>> +
>>>> +LICENSE =3D "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
>>>> +LIC_FILES_CHKSUM =3D " \
>>>> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>>>> +    file://LICENSE.LGPLv3;md5=3D8ba7f2099d17d636d5fcc8303bb17587 \
>>>> +    file://LICENSE.GPLv3;md5=3D40f9bf30e783ddc201497165dfb32afb \
>>>> +"
>>>> +
>>>> +DEPENDS +=3D "qtdeclarative"
>>>> +
>>>> +FILES_${PN}-qmlplugins +=3D "${libdir}/qt5/qml/Qt"
>>>
>>>
>>>
>>> all /designer/ files should go the ${PN}-designer package, since they a=
re
>>> not needed in the target.
>>> Should be added by including one more level of subfolders in qt5.inc
>>>
>>>> +
>>>> +SRCREV =3D "7fc567eda8a187e365f4c29c6e8f08440bf31218"
>>>>
>>> --
>>
>> I checked the image of qtquickcontrols2 for files matching your
>> comment but can't find any. What files do you mean?
>>
>> Andreas
>>
>
> Without the FILES_${PN}-qmlplugins addition, bitbake throws error:
>
> ERROR: QA Issue: qtquickcontrols2: Files/directories were installed but n=
ot
> shipped in any package:
>   /usr/lib/qml/Qt/labs/controls/designer/qtlabscontrols.metainfo
>
> This should go to ${PN}-qmldesigner package, as well as all the other fil=
es
> from /usr/lib/qml/Qt/labs/controls/designer/* that are now in
> ${PN}-qmlplugins
> See FILES_${PN}-qmldesigner in qt5.inc
>
To be honest: I don't exactly know which files should be splitted out.
What about the binaries in these folders? Aren't these part of the
functionality?

So: Would it be possible for you to create a patch on top of this series?

Andreas

