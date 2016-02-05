Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D580F771F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 13:28:47 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c10so2578896pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=42FU4xilWANz/37GWCbB9KgNrZ0YhMsstYI5jk+hWj4=;
	b=EzUY+ErVbfp/ZF0dDpldiBZiPO5sAq2wVuRSUkd1dNbD/GzWOxVAUmi6cTYRWWrTRm
	fi2RBQYLgrX5JCBTxY4abzr6L2pRIB3cPgIST1uTNFSc3C4OzI1A7BTPRtTbw1Xo5iOa
	yAuXIQYigFp+O+5xSjjqTYa6gznKC6ugfYS/otOG1pYiJfu+MeN+8cDwp5acmBsg94JN
	Ypt7ubMLIAoUXaFIggjs7bxpaBDJCdjHQY6NJ9tb5ZRLCXH9HUrc9MmQiDDyscjiq3MV
	af2rqsU01OUhT3btRYP2xlApHsPK7JZ8NeHM60RKF2R4Nckm36rl5sml0q8GrNZ6J9hX
	MrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=42FU4xilWANz/37GWCbB9KgNrZ0YhMsstYI5jk+hWj4=;
	b=NzIdif4auQ1JGAcJWDr/qTN86dGpGllmxwFWr2fe0aDbFbRyGw4J8HxG5c7PrE8Jt6
	+Z117fVArrm2q5qGF4vbwI8MNls9ApL1hwuPfYxBBD9M1XsvR9DBU1HNYT9JH/JRvfIS
	xXS0zPZ3vgR6/IKGH7dYuOutrfbBDT3NLL+Qn4ljLKCet8FerizoqehbPIiNV0fqZ+y4
	+1nzk/0iNPxKAmvbKy5T7gySic4CHFXYrcn7G25bJR0Myc/OMDUK84UyrS257FtR3EGF
	D4ofGkHl/zPVqKIub6Mc5egGH+ex+9tJeKqx2Au/4SPPSgpHHWOmO6Nu7ijLKA+AbtB1
	z3CA==
X-Gm-Message-State: AG10YOTR1wpqc6u8Wg7yJnNcI7EI/aEJqh0hpGUOvDKobueHr++ja8pB91MYkyb0/abgXg==
X-Received: by 10.98.42.10 with SMTP id q10mr19838129pfq.73.1454678928236;
	Fri, 05 Feb 2016 05:28:48 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:fdc4:cb8e:dcc9:3b5b?
	([2601:202:4000:1239:fdc4:cb8e:dcc9:3b5b])
	by smtp.googlemail.com with ESMTPSA id
	c13sm24757184pat.8.2016.02.05.05.28.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Feb 2016 05:28:47 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1454613723-22027-1-git-send-email-akuster808@gmail.com>
	<CACS+7ZS4DzLZrYZXQ2Uk5vAn-oRSG+PDriOFhCjUsCvPSfnw_A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B4A38C.3090909@gmail.com>
Date: Fri, 5 Feb 2016 05:28:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZS4DzLZrYZXQ2Uk5vAn-oRSG+PDriOFhCjUsCvPSfnw_A@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Feb 2016 13:28:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/04/2016 11:51 PM, Dan McGregor wrote:
> On 4 Feb 2016 11:23 a.m., "Armin Kuster" <akuster808@gmail.com> wrote:
>>
>> Update to a LTS version which might EOL in April 2018
>>
>> The following security fixes are included;
>> CVE-2015-8213
>> CVE-2015-5964
>> CVE-2015-5963
>> CVE-2015-5145
>> CVE-2015-5144
>> CVE-2015-5143
>> CVE-2015-3982
>> CVE-2015-2317
>> CVE-2015-2316
>> CVE-2015-2241
>>
>> LIC_FILES_CHKSUM changed do to:
>>
> https://github.com/django/django/commit/1dae4ac1778f04805c0ed62c8debb13b281ba02b
>> * Removed trailing whitespace.
>> * Added newline to EOF if missing.
>> * Removed blank lines at EOF.
>> * Removed some stray tabs.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> 
> Looks good, but can we also keep 1.6? Bitbake uses 1.6 for toaster.
> Alternatively is updating bitbake's dependencies on the roadmap?

That would mean oe-core has a dependency on meta-openembedded. This
seems wrong.  BTW the requirements.txt for toaster says
"Django>1.8,<1.9" maybe that is a host requirement?

- armin

>> ---
>>  .../python/{python-django_1.6.10.bb => python-django_1.8.8.bb}    | 8
> ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python-django_1.6.10.bb =>
> python-django_1.8.8.bb} (60%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
> b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
>> similarity index 60%
>> rename from meta-python/recipes-devtools/python/python-django_1.6.10.bb
>> rename to meta-python/recipes-devtools/python/python-django_1.8.8.bb
>> index a7ca803..5e4c435 100644
>> --- a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
>> +++ b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
>> @@ -2,18 +2,18 @@ SUMMARY = "A high-level Python Web framework"
>>  HOMEPAGE = "http://www.djangoproject.com/"
>>  SECTION = "devel/python"
>>  LICENSE = "BSD-3-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>>
>>  SRCNAME = "Django"
>>
>>  SRC_URI = "
> https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> "
>>
>> -SRC_URI[md5sum] = "d7123f14ac19ae001be02ed841937b91"
>> -SRC_URI[sha256sum] =
> "54eb59ce785401c7d1fdeed245efce597e90f811d6a20f6b5c6931c0049d63a6"
>> +SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
>> +SRC_URI[sha256sum] =
> "8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
>>
>>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>>
>> -inherit distutils
>> +inherit setuptools
>>
>>  FILES_${PN} += "${datadir}/django"
>>
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

