Return-Path: <timo.jyrinki@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE85786C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:40:58 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id j79so12723838oib.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ncplHd69dR4uZC6MK7rr8jBwnFTGEfD8UU9aIQAeTMk=;
	b=PmPvpmqaVFkXbd3uf0nBhVQ5HK5uDMqc3mb99CsvrldtGpMbB+hz681rFDRYfl/ilg
	vrJdJuLgpn7w7rgFQZlTJwO8/A5dcYeo/P8oCSRF5XNfCZHjNjqzTvKaFchVzBtpI0La
	KVVscAFyhgeJLZgERuslbx0LTXT1VnxJ/8IUBOauAOBE8QFKzRkRdhR64jFSQ/h7v37I
	WFfwk5l6ilA5THTDF+mE8MqcayZJ/QpW2/8erqcsHY1KGZXmUKq/RqV649iKjgdaB/qJ
	l51Xv1hE8/NnwoZ5cUdBFNCpy4JjXEZKGhg/3SqZh4mqisXARzNpGcD5lDoX06r11cde
	V4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ncplHd69dR4uZC6MK7rr8jBwnFTGEfD8UU9aIQAeTMk=;
	b=bGmZ3YvmaqSZiqyAAlERReykhJE+ZHlzWcfWFFdbAeRFTl+YtCaFQj04U1LZ9dcrw9
	KYheC0oQVV4jMt4Qmp5hORVuoFQZ5I+bTU50o5TKxF5+8Exvoo7wpM2IuJ76LH5w9Mvy
	2toVJfb7L/NutBh2EPxhBWnYFHD7dZJYV2f3+pC3ileeyjtUusPTPD9keen4GC3jZCRE
	bUkSPAS2h1+3SVzYRVk8bDpS8I5s9angXiCoMW/XjrOjYpe4cKkNK9uaWIW9lt9ygb2W
	pz5RjmmiJt1E+JhJDfIudWyOcSy/UIIeJRFf8rTqjugbDRUprebGLvH8C2qEgyt6n7Oq
	/IYA==
X-Gm-Message-State: APf1xPADdaZqTsUg0ZfmQu4JxMUSXV3uN+D9jRzRlI+sIcAk0cW0YHaw
	9PQBYjCvsxFWUC4/iEtNma2jqrqVwT6jBmE+uMY=
X-Google-Smtp-Source: AG47ELsDIuNmUYm6t4TWBXTd97vs9P4mR5hPR50/1wXYjmidB72LK+D8BJ9h/Ojhhehj5ItgWIYzLCVYb83t8hi146o=
X-Received: by 10.202.43.25 with SMTP id i25mr2595318oik.352.1519735260156;
	Tue, 27 Feb 2018 04:41:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.193.15 with HTTP; Tue, 27 Feb 2018 04:40:59 -0800 (PST)
In-Reply-To: <CA+chaQcr-xj-Ob24Npf8diTQ-F+zbywBzzBW9fhb-TG_1gomAQ@mail.gmail.com>
References: <1519637845-8644-1-git-send-email-timo.jyrinki@gmail.com>
	<CA+chaQcr-xj-Ob24Npf8diTQ-F+zbywBzzBW9fhb-TG_1gomAQ@mail.gmail.com>
From: Timo Jyrinki <timo.jyrinki@gmail.com>
Date: Tue, 27 Feb 2018 14:40:59 +0200
Message-ID: <CAJtFfx=R1dUYf6F5xJZJ4vex7xs00aKa7B4Ac9t1HN6iN7S62w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtlocation: Add licenses used under mapboxgl.
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
X-List-Received-Date: Tue, 27 Feb 2018 12:40:59 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thank you. I posted a v2 patch that includes a checksum for their
combined license & copyright file, for the version currently referred
to from the recipe.

2018-02-26 18:33 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Update LIC_FILES_CHKSUM to cover license files from mapboxgl.
>
> On Mon, Feb 26, 2018 at 10:37 AM, Timo Jyrinki <timo.jyrinki@gmail.com>
> wrote:
>>
>> These licenses are in use in the fetched mapboxgl submodule but not
>> currently listed in the recipe: Apache-2.0, MIT, openssl and BSL-1.0.
>>
>> Signed-off-by: Timo Jyrinki <timo.jyrinki@gmail.com>
>> ---
>>  recipes-qt/qt5/qtlocation_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtlocation_git.bb
>> b/recipes-qt/qt5/qtlocation_git.bb
>> index fce37b8..f6d3e09 100644
>> --- a/recipes-qt/qt5/qtlocation_git.bb
>> +++ b/recipes-qt/qt5/qtlocation_git.bb
>> @@ -1,7 +1,7 @@
>>  require qt5.inc
>>  require qt5-git.inc
>>
>> -LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 &
>> The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 |
>> The-Qt-Company-Commercial"
>> +LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD &
>> (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 |
>> The-Qt-Company-Commercial"
>>  LIC_FILES_CHKSUM = " \
>>      file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
>>      file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

