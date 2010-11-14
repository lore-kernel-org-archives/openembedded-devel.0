Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PHiBq-0003rD-TU
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 20:24:39 +0100
Received: by qyk34 with SMTP id 34so1144729qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 11:23:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.202.3 with SMTP id fc3mr4941122qab.64.1289762615001; Sun,
	14 Nov 2010 11:23:35 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sun, 14 Nov 2010 11:23:34 -0800 (PST)
X-Originating-IP: [93.81.138.51]
In-Reply-To: <4CE02C8A.2040002@mentor.com>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTinuoktvgvT9V7OX1=FkMfeAgztmDaOCFMdH5x7d@mail.gmail.com>
	<4CE02C8A.2040002@mentor.com>
Date: Sun, 14 Nov 2010 22:23:34 +0300
X-Google-Sender-Auth: ZOC3LZzHi_gdESylcC-n2ZGWE_Y
Message-ID: <AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Sun, 14 Nov 2010 19:24:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/14 Tom Rini <tom_rini@mentor.com>:
> On 11/14/2010 11:11 AM, Frans Meulenbroeks wrote:
>>
>> 2010/11/12 Cliff Brake<cliff.brake@gmail.com>:
>>>
>>> testing-next is ready for clean builds. =A0Not many builds succeeded
>>> last week--I suspect people have been busy:
>>
>> Actually my builds also succeeded (apart from the neek one which seem
>> to require some more love). The autobuilder did it's job quite nicely,
>> but I was just not around to verify the results and update the page.
>> The neek requires at least the os2 patch.
>>
>> Testing 2010-11-12 gives the same results. updated the testing page.
>
> After my first week of doing some testing branch test builds I was thinki=
ng,
> would some form of either automated result submitting or form-based resul=
t
> submitting be a good idea? =A0We could try and use a google doc spreadshe=
et /
> form, for example. =A0Thoughts?

I'll prefer to use our oestats-server to auto-publish builds data.
Oestats have complete information about builds.

--=20
Yury Bushmelev


