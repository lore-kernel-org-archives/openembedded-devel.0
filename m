Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SaNTg-0003Gx-QK
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 10:45:01 +0200
Received: by dalh21 with SMTP id h21so2554855dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 01:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oHv38zbcMBKlmEXReP8DvCO6MfIDiQSpSNFk/UXHgbM=;
	b=s283dasYhyh1S7ljerT2o5+QBS964BRvGN2RT0gl5CcgmRMpRt6/WReSH7DmAO1WRd
	jp9KbMfwRmGljqU8UVY1C7n6XhHKA0oaAougTZQ5If891KZZ8nZEfrct8rjZDnAe9npZ
	Gaxvds9hPTXqheP/SDEj839kAYfFs62d0tvDPKPrqh5QqExTHkuexSC64b8LlDS7TkMQ
	MTGRWw0cxhZ9xrLh1iJXvkgtN/oQDIxmqBvNPBZmlH2eTmH31ktFKg+tgH34S5vUEWqv
	vsSMEnm1kt6GqdtA/qZ0aBBNCFMMNWIU0ffHw3QDsw4u5a5B2YhRfEipb0LWejfgFWql
	X7hA==
MIME-Version: 1.0
Received: by 10.68.191.8 with SMTP id gu8mr8555353pbc.0.1338539679281; Fri, 01
	Jun 2012 01:34:39 -0700 (PDT)
Received: by 10.143.63.11 with HTTP; Fri, 1 Jun 2012 01:34:38 -0700 (PDT)
In-Reply-To: <CAAQYJAuo1WBzJUeVDuuG8Ju=f686E9yGQT_gcZTjSLjHiMUDUg@mail.gmail.com>
References: <1338507062-24643-1-git-send-email-andrea.adami@gmail.com>
	<jq9qlk$qd8$1@dough.gmane.org>
	<CAAQYJAuo1WBzJUeVDuuG8Ju=f686E9yGQT_gcZTjSLjHiMUDUg@mail.gmail.com>
Date: Fri, 1 Jun 2012 10:34:39 +0200
Message-ID: <CAAQYJAsA89mmHR5Z+1tZ4+boPx8_JoKSrXe6t9jgsDsWJVD6xA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH] klibc: release klibc 2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 08:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 1, 2012 at 10:11 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Jun 1, 2012 at 9:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 01-06-12 01:31, Andrea Adami schreef:
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>
>> error: patch failed: meta-initramfs/recipes-devtools/klibc/klibc.inc:10
>> error: meta-initramfs/recipes-devtools/klibc/klibc.inc: patch does not apply
>> Patch failed at 0001 klibc: release klibc 2.0
>>
>

Please note this patch goes on the top of  patchwork's #28903 and #28905.

Regards

Andrea


> Hm.. something wrong... and I ever tried to rename properly with 'git -A'...
> I'll fix that in a few hours.
>
> Sorry for the noise
>
> Andrea
>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iQIcBAEBAgAGBQJPyG3zAAoJEHZqAkdh1vT6rwQP/RQB+hmY/RANmjJtEeJoez/4
>> 6c36JPjGhRfdXIdtTTBlq9dZPGgt7fmpKRPaAOWPjn9/6WWUMELaTflRq1JJS3O4
>> h7itaJgPdDSw1ejOGujlECNFdFTrL3RU0xzDTTOkgMzDtTxXtOkEWzyQBY9yHSKF
>> HKzc5KRLZUEQvoMyufFUtxsm9st+zdn92hv+KkJ6iXtJWGwvb8MmVOVIrFGA6YRq
>> OCi2xOS89SDOHS1ktITvuCbx2z0ddiF0SdCa+UGFPO9zaVJUieYMsZwovWtVI7PY
>> jAOh6UbTq/zXU7rZplB98neGyAhORYElTQ56irUFC9GCJWQtEIzfV0sTnXEj+pt/
>> JQozPwP5no52Bs17rCL1Pdm8t5/CT5/bq3AfYGkZJTdJPbddfUBcodHgzTIwQJQm
>> zXZrZLY83A6rUio00gyR+s9sbvsN28PRXIjiCSiBMO/O0H4Y8+Mf/8/3n1BdmyOf
>> 7Aj2OIxNt6xO3aSFDO7fFKGot9gJyYZNZFlLZ6w4GTOf4ShjRANqVmYdZIZj2pJU
>> oLzwzaVMvngiWkx/6K3pqya2byGH1zGMQ9oyYOO31YG7DZbvwpXshTKMtzQ5o5P9
>> KRaV6Xf41JC9XmoTO8Tps+75FZFd4HgKnuC0XWO2yqzEPnAMSvpg/+aS5cmbGrxB
>> aJKU9mVafr0oudrBB8qj
>> =9IvJ
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


