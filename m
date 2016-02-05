Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7F3C731AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 15:48:51 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id e6so58732130vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ef03AdfId6lH5TBwwUiIPH/5YF+k14eYGL5ZjKdsyXA=;
	b=lHVvSntW7kuD7zg1nqgcx0ZtXfxvqypjAikQGGCGXgs/g+SdxZp7Zlc/Mgodc5bkr6
	B/7uollEztRlLhIwufUdq5YKooMXsIaSLQquXDt4oWOz3oZIcY+810E4DomzK4Qt/ucE
	qV1FE6KQEiwO/JUSYoqe2GB1PmD5MVkWyDSNIM8cWNjSBpu/49ma3likg8eujY1ykgFy
	qblDFx1dxR+1/u5yaETbCPAXjd+aGQMFH59Wg8klR7Ua+wCP/zRZftaf174NFNd+lmVA
	cKdNavysE3u3H+foQCmcRZTW+OOtP9kYgCG4mqkZ8iM7NVXT9liTdI6YF1aur8uRByRN
	ZzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ef03AdfId6lH5TBwwUiIPH/5YF+k14eYGL5ZjKdsyXA=;
	b=MNLM7cqhaoUkV16WuMtQfz7cjfuOTxLQDyc9H+rWqNcPKMbvPeP8rt+ibIQipJjqI4
	4H2WkXMct2ziaOjkqsk1Y4f/Irnr1026vqEDqBJzdy0C4buru8kjWHVX9ABI8bXQZXsl
	/64KI16A7Td/Z/sSSK0Y8ZQfJulZuPwNkajl+H2QQG0OsKgIsNj4awGFIYnlqEcv6SQ6
	o92b74S7VaJXd0My4xs15FP/cphYP/ryiCusAXQyJjXd/MHhn1CGM5acYSvIgdGcvY+5
	xqWfouCEa63WX+qZ3a4F/hYvOc9iE2AvRoKOKo7gxU41UcaB7D6lutasF0uQk60wR9OQ
	vgmQ==
X-Gm-Message-State: AG10YOQI7IxnjfnslMB4FY9C0Tc0kS/nKqjFUlLcOiI/GgAT3fqCVIshiOSqvv3ot4RbF+nqo8oYWGMMm1WSog==
MIME-Version: 1.0
X-Received: by 10.31.137.11 with SMTP id l11mr9045387vkd.98.1454687332314;
	Fri, 05 Feb 2016 07:48:52 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Fri, 5 Feb 2016 07:48:52 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Fri, 5 Feb 2016 07:48:52 -0800 (PST)
In-Reply-To: <56B4A38C.3090909@gmail.com>
References: <1454613723-22027-1-git-send-email-akuster808@gmail.com>
	<CACS+7ZS4DzLZrYZXQ2Uk5vAn-oRSG+PDriOFhCjUsCvPSfnw_A@mail.gmail.com>
	<56B4A38C.3090909@gmail.com>
Date: Fri, 5 Feb 2016 09:48:52 -0600
Message-ID: <CACS+7ZQQqAp-jC6ZRz98R7P94S4=TSf_09bEzLn8vPqSae_Crw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-django: update package to 1.8.9
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
X-List-Received-Date: Fri, 05 Feb 2016 15:48:55 -0000
Content-Type: text/plain; charset=UTF-8

On 5 Feb 2016 5:29 a.m., "akuster808" <akuster808@gmail.com> wrote:
>
>
>
> On 02/04/2016 11:51 PM, Dan McGregor wrote:
> > On 4 Feb 2016 11:23 a.m., "Armin Kuster" <akuster808@gmail.com> wrote:
> >>
> >> Update to a LTS version which might EOL in April 2018
> >>
> >> The following security fixes are included;
> >> CVE-2015-8213
> >> CVE-2015-5964
> >> CVE-2015-5963
> >> CVE-2015-5145
> >> CVE-2015-5144
> >> CVE-2015-5143
> >> CVE-2015-3982
> >> CVE-2015-2317
> >> CVE-2015-2316
> >> CVE-2015-2241
> >>
> >> LIC_FILES_CHKSUM changed do to:
> >>
> >
https://github.com/django/django/commit/1dae4ac1778f04805c0ed62c8debb13b281ba02b
> >> * Removed trailing whitespace.
> >> * Added newline to EOF if missing.
> >> * Removed blank lines at EOF.
> >> * Removed some stray tabs.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >
> > Looks good, but can we also keep 1.6? Bitbake uses 1.6 for toaster.
> > Alternatively is updating bitbake's dependencies on the roadmap?
>
> That would mean oe-core has a dependency on meta-openembedded. This
> seems wrong.  BTW the requirements.txt for toaster says
> "Django>1.8,<1.9" maybe that is a host requirement?
>

Indeed you are correct. I only looked at jethro. Master this is good.

OE-core still wouldn't have a dependency on meta-openembedded because
toaster is optional. As it stands to make toaster work on jethro one needs
pip.

This is of course talking about a self-hosted openembedded build machine.
(oe-core's build appliance for example)

> - armin
>
> >> ---
> >>  .../python/{python-django_1.6.10.bb => python-django_1.8.8.bb}    | 8
> > ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>  rename meta-python/recipes-devtools/python/{python-django_1.6.10.bb =>
> > python-django_1.8.8.bb} (60%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
python-django_1.6.10.bb
> > b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
> >> similarity index 60%
> >> rename from meta-python/recipes-devtools/python/python-django_1.6.10.bb
> >> rename to meta-python/recipes-devtools/python/python-django_1.8.8.bb
> >> index a7ca803..5e4c435 100644
> >> --- a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
> >> +++ b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
> >> @@ -2,18 +2,18 @@ SUMMARY = "A high-level Python Web framework"
> >>  HOMEPAGE = "http://www.djangoproject.com/"
> >>  SECTION = "devel/python"
> >>  LICENSE = "BSD-3-Clause"
> >> -LIC_FILES_CHKSUM =
"file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
> >> +LIC_FILES_CHKSUM =
"file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
> >>
> >>  SRCNAME = "Django"
> >>
> >>  SRC_URI = "
> >
https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> > "
> >>
> >> -SRC_URI[md5sum] = "d7123f14ac19ae001be02ed841937b91"
> >> -SRC_URI[sha256sum] =
> > "54eb59ce785401c7d1fdeed245efce597e90f811d6a20f6b5c6931c0049d63a6"
> >> +SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
> >> +SRC_URI[sha256sum] =
> > "8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
> >>
> >>  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >>
> >> -inherit distutils
> >> +inherit setuptools
> >>
> >>  FILES_${PN} += "${datadir}/django"
> >>
> >> --
> >> 2.3.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

