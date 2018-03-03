Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A00E0788A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 04:15:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520050526; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=SJ496nZHM4cXAUqpIrx3UMzEXT2neTigXNLQ6Gtu8H8=;
	b=U+4LNbswBoxFlFHUUeiqCzPTd7wrXg1BYvPZ3kYMWfcV73UFyMAbR8+cHoIQVtPvD/G6mLzG
	QfkkvDNl7K+MudKLRivghz16hgvusmQcs7EPMScY16KEPXXJ+HPpnnphQZu2vqx5dJF3V/Nz
	hsCbcNrUOYZS0d9IInRS3BFuHRY=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mxa.mailgun.org with ESMTP id 5a9a215e.7f4bc45b25b0-smtp-out-n01;
	Sat, 03 Mar 2018 04:15:26 -0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id t6so14435431qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 20:15:25 -0800 (PST)
X-Gm-Message-State: AElRT7FcNl0oiWmVpe7yXbQ8buzyBw+d1gy1ulUG/60WGKKm03lkZ0Sr
	Uvwz0hUyYe6NA7TqmbvlXhC6w3cMwYi404boHIc=
X-Google-Smtp-Source: AG47ELuf+LqbYSwRc1IDyG9Fz5TINqa56O9Plvgkliu87D8mKTIESTIn1zKpHaxnZaZq87lLPMYKFEO5q1uL6WlV4hU=
X-Received: by 10.200.50.155 with SMTP id z27mr11479101qta.250.1520050525289; 
	Fri, 02 Mar 2018 20:15:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 20:15:24 -0800 (PST)
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 20:15:24 -0800 (PST)
In-Reply-To: <3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 2 Mar 2018 23:15:24 -0500
X-Gmail-Original-Message-ID: <CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
Message-ID: <CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
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
X-List-Received-Date: Sat, 03 Mar 2018 04:15:25 -0000
Content-Type: text/plain; charset="UTF-8"

What more would you like in the commit message?  The license terms are the
same; the copyright moved to 2018.  Do we really need to put the results of
the diff in the commit message?

On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:

On 3/2/18 6:06 AM, Derek Straka wrote:
> Update the license checksum and verify the terms remain the same
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6
+++---
>  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
=> python-sqlalchemy_1.1.17.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
=> python3-sqlalchemy_1.1.17.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> index 2683a6a..0c191ae 100644
> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational
Mapper that gives \
>  application developers the full power and flexibility of SQL"
>  HOMEPAGE = "http://www.sqlalchemy.org/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>

what changed here ?

