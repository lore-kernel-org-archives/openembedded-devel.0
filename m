Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 614 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Sep 2017 17:40:43 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 314437804A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:40:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1505842844; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=1qG31ydOOcxHucQaTgy+o7ZEGthSbJyHRtWyjvaCzyw=;
	b=DWY9GGm5Wm5NI4/WtkYWkonuknE1JlAGS8xXui3oGplDMB6Zx99U7evDMQMzfeBAUmuAleV0
	poj7Tyg+OVmJwSimmgcmeCuqPteJsMnxDz43P6Crfs4R8GRsaEo+koVGga9gYUIpeC6hr6N1
	LJWwMdIu/G/Rc6adTN+HhfMCKqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=BbS12w/cebbG0zU1YTi650NNH02+Bai3PZmoP4gfOE0jElPr2Lz2ZAWXLg0Xi7wGozqxZO
	4gIuwzgdxXItKwVRhbHq3uyyxDQgnkmFT63DlCu/B9d3ZTmWr/TRsoDdRJhqERwZ3DFCuMRr
	F+vpWEMGpVCddAzTmuOVyRsZqrQeI=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 59c1541e.7fb7ec0d59b0-smtp-out-n02;
	Tue, 19 Sep 2017 17:30:06 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id o200so388299itg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:30:06 -0700 (PDT)
X-Gm-Message-State: AHPjjUi5i6y6/gbLUrxWq10U4LAP4+ldQeAilmS+nkEK/QQEEUho+unA
	X1ghwo6GjChB8NwBimEVfqeNA6tnJ1TjTnvQtNo=
X-Google-Smtp-Source: AOwi7QC0h4zC8sfnJwGS2Pp0Y0kNJjOaSqyJHm9QcU9cOFT3IEUDJDxMpWQ4fjf3Z37Xb0w9t39oZzhNyJ3k7zTTKpc=
X-Received: by 10.36.61.21 with SMTP id n21mr2855352itn.121.1505842206404;
	Tue, 19 Sep 2017 10:30:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.180.6 with HTTP; Tue, 19 Sep 2017 10:30:05 -0700 (PDT)
In-Reply-To: <CA+chaQfnk1t0P+omcSxwBGYgVawF=gf5my3+t8ouebHsYy9LTw@mail.gmail.com>
References: <1505841334-2527-1-git-send-email-derek@asterius.io>
	<CA+chaQfnk1t0P+omcSxwBGYgVawF=gf5my3+t8ouebHsYy9LTw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Sep 2017 13:30:05 -0400
X-Gmail-Original-Message-ID: <CADNbA1qq4jp1w-xUMsgyLkfuJ1JvTV_yrzO9tW77M4mWzt3vjw@mail.gmail.com>
Message-ID: <CADNbA1qq4jp1w-xUMsgyLkfuJ1JvTV_yrzO9tW77M4mWzt3vjw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] po4a: update to version 0.52
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
X-List-Received-Date: Tue, 19 Sep 2017 17:40:44 -0000
Content-Type: text/plain; charset="UTF-8"

I just realized I didn't git add the update after I moved it.  v2 coming
now.  Thanks.

On Tue, Sep 19, 2017 at 1:28 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Not even SRCREV update? I think this rename doesn't do anything.
>
> On Tue, Sep 19, 2017 at 7:15 PM, Derek Straka <derek@asterius.io> wrote:
>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} (100%)
>>
>> diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
>> b/meta-perl/recipes-perl/po4a/po4a_0.52.bb
>> similarity index 100%
>> rename from meta-perl/recipes-perl/po4a/po4a_0.49.bb
>> rename to meta-perl/recipes-perl/po4a/po4a_0.52.bb
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

