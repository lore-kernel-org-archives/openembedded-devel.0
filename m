Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5C0C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 01:25:27 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.6415.1654565124394323603
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 18:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EE30+uq3;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id ew15so11658360qtb.2
        for <Openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=N8NGoqCWXiWxXNonenAjGQ45yrEcbeRbMwdHEt+24mE=;
        b=EE30+uq3OfpmIXpq88zJ6J5DvGR4idaq3GpQXFdrTQSM6PoF+9TrCeN4ceKkmHmTfP
         b6Z521xg4zCHm+LUdKADOYBDwgygruSt9LA6grvlBfk6m1gRg2QJnMBaXgft9/Iw2QIE
         PDaJqCi2K8q3YJlNE7OgbCXxf+0bEWaj7xsr9fDVx31vSGSrv5A5X4hbPOnVapUyxOND
         QlcKVi/1fFQjjnEnLUuBBqiMxQp1XMEunqZ6bOH4LZpqg0oA4XcVPocPueQCFg8IySYX
         Rbl010bhpUq5u7Sskh9YSp23qCTYAH54UJ5jytt2nrfUvekWhGCX2UTdzCsi0UwTRYr4
         1DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=N8NGoqCWXiWxXNonenAjGQ45yrEcbeRbMwdHEt+24mE=;
        b=pXCVDyxwKWt05Zm//Hw12UJKsQdxUPKWj7nzign86XWLiWSOf2M+tQAqxpJ0/ItFg3
         AUdg5WDiMpYumEF1kGmhmOrBTbCAeCJzYeAd4II4f20LwMEZvJIfhMcixUq9EsDRwnnw
         tykVW0lr62mD6ABBgnETUS2hMYlxHZwNgCvggVvT0AUKxbRHqJXyKWx0CieA+G8Cgoc5
         xWVYrWEIjGq76EGMSQVs4X4yctyx4LCntF+KfxSLCypC4GO2DZ+hY05XmJXCBHpMpsI7
         qYg3faePntkSZjoJuF257Ly6kln7iAMticj2oVbhU97zRTG4GuBBNd5uGl1AFLrJVF9l
         1P2Q==
X-Gm-Message-State: AOAM532vKU8zIFrNvPnyfhDzoXGWm48Lo7+j7b4L94tmB9OIiyOi7dSi
	R1PJTwIniiYZZqZsVgZfHujM9XwIjFsz681j2EX1VfQXm4g=
X-Google-Smtp-Source: 
 ABdhPJyCd2awFqj5tHDvJXBV1vJk/G8AXoZfCsAyNXWNdY4Rt3Ds/Lj6f+dlwtXuExC46VwGsTTO4rcqRYIdggshG0o=
X-Received: by 2002:ac8:5a93:0:b0:304:ec80:7943 with SMTP id
 c19-20020ac85a93000000b00304ec807943mr6538930qtc.330.1654565123318; Mon, 06
 Jun 2022 18:25:23 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jun 2022 18:24:57 -0700
Message-ID: 
 <CAMKF1sr2a6Xdg75E0oNV9CphBRgbNuQxisTSBmyPXLaHTtrkbA@mail.gmail.com>
Subject: Availability for next 3 weeks.
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jun 2022 01:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97437

Hello All,

I will be travelling internationally for the next three weeks until
June end. Therefore master maintenance will be a bit slow and my
responses will be delayed. Feel free to reach out
to other maintainers if something urgent pops up.

Thanks
-Khem

