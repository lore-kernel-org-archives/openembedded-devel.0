Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166AAC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 20:40:12 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web09.831.1645735200432473489
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 12:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [172.16.190.234] (unknown [172.16.190.234])
	by smtp0.taitradio.net (Postfix) with ESMTP id 95B2DE00EA;
	Fri, 25 Feb 2022 09:23:35 +1300 (NZDT)
Content-Type: multipart/alternative;
 boundary="------------hqkfRVm2vJDvsw923qmV5DWt"
Message-ID: <63cfbe7a-ac5a-064a-f467-6b23b520d1c9@taitradio.com>
Date: Fri, 25 Feb 2022 09:23:35 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: RRECOMMENDS bats,
 python3-packaging for libgpiod-ptest
Content-Language: en-GB
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220221041039.4036356-1-douglas.royds@taitradio.com>
 <CAFimOt5ZrGjVaec6Ox5eWYwSsGq3Fa_2q7AUuJfteFc+wJWRhw@mail.gmail.com>
 <daa393c2-b56f-a28b-6ebd-ccb77491c9c0@gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
In-Reply-To: <daa393c2-b56f-a28b-6ebd-ccb77491c9c0@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 20:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95515

This is a multi-part message in MIME format.
--------------hqkfRVm2vJDvsw923qmV5DWt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/02/22 3:37 pm, Khem Raj wrote:
> On 2/21/22 12:26 PM, Douglas via lists.openembedded.org wrote:
>> I should be adding this to the RDEPENDS:${PN}-ptest, not the 
>> RRECOMMENDS. I'll send another patch ...
>>
>
> OK thanks. I will wait for v2


Did you see this one? It doesn't seem to have made it into master-next ...

    https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg81249.html

--------------hqkfRVm2vJDvsw923qmV5DWt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 22/02/22 3:37 pm, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:daa393c2-b56f-a28b-6ebd-ccb77491c9c0@gmail.com">
      On 2/21/22 12:26 PM, Douglas via lists.openembedded.org wrote:
      <br>
      <blockquote type="cite">I should be adding this to the
        RDEPENDS:${PN}-ptest, not the RRECOMMENDS. I'll send another
        patch ...
        <br>
        <br>
      </blockquote>
      <br>
      OK thanks. I will wait for v2 <br>
    </blockquote>
    <p><br>
    </p>
    <p>Did you see this one? It doesn't seem to have made it into
      master-next ...</p>
    <blockquote>
      <p><a class="moz-txt-link-freetext" href="https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg81249.html">https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg81249.html</a><br>
      </p>
    </blockquote>
  </body>
</html>
--------------hqkfRVm2vJDvsw923qmV5DWt--


