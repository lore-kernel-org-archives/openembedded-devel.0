Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id D75D6789C1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 04:44:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520052292; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=H2WlsNrHNcO2DbIqWWwmwTaZgjrDrBuY9pmGW2zub1g=;
	b=GDyhr0SalObWr5/eKSKyxIT4QXC4tq7vigRhQBmnJIwDFh4i3ExxggGEodhKhjmedVHDPRuj
	mlPXaV3A5+bvDjnPZr+7WpPF4GaKvtXvZIy5d5UB2trKX1RegVHJw8zJTwb7px3d92iganXO
	s5rtG6h/3a5QdAGW5tD1faTuhuI=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mxa.mailgun.org with ESMTP id 5a9a2844.7fab9c3970f0-smtp-out-n03;
	Sat, 03 Mar 2018 04:44:52 -0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id f25so14614491qkm.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 20:44:52 -0800 (PST)
X-Gm-Message-State: AElRT7Fy7EJd4kSXVTozNPzYp3HI/s8cPokS2MuCWpvovxcR5/2aj5Yb
	wgdf6v3kMotli0dlH/YK3tFg57y2UpNxt740h1k=
X-Google-Smtp-Source: AG47ELvjMT4ml3KNauGaE7Td/PJaJnzqs/MyxzYDEkECvNmzqDKqN9LI4FC41zP4DmYKtHzYKACrpB//PH8jGOva4IQ=
X-Received: by 10.55.20.233 with SMTP id 102mr11855211qku.18.1520052292160;
	Fri, 02 Mar 2018 20:44:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 20:44:51 -0800 (PST)
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 20:44:51 -0800 (PST)
In-Reply-To: <CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 2 Mar 2018 23:44:51 -0500
X-Gmail-Original-Message-ID: <CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
Message-ID: <CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 04:44:52 -0000
Content-Type: text/plain; charset="UTF-8"

This is the exact same commit message I've used at least 10s of times
without any negative feedback.  Saying the terms remain the same seems
sufficient to me to acknowledge the fact I looked at the license and it was
reviewed as you stated.  I can start putting the diff in the commit if it
adds value but let's start being consistent as a community in what we
expect.

Even as a maintainer of several layers in meta-openembedded I don't know
what we as a community expect...

On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:

On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
> What more would you like in the commit message?  The license terms are the
> same; the copyright moved to 2018.  Do we really need to put the results
of
> the diff in the commit message?
>

Not strictly, but you can. In general a line or two about the reason
is always a good thing.
The commit message wasn't clear about it.
This is essentially to let users as well as reviewers know that license
changes
were reviewed and a line in commit message is there for later to go back
and see what changed


>
> On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On 3/2/18 6:06 AM, Derek Straka wrote:
>> Update the license checksum and verify the terms remain the same
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6
>> +++---
>>  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>>  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>> => python-sqlalchemy_1.1.17.bb} (100%)
>>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>> => python3-sqlalchemy_1.1.17.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> index 2683a6a..0c191ae 100644
>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational
>> Mapper that gives \
>>  application developers the full power and flexibility of SQL"
>>  HOMEPAGE = "http://www.sqlalchemy.org/"
>>  LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>>
>
> what changed here ?
>
>

