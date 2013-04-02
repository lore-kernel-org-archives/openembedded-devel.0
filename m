Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UMudK-0007GA-Rl
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:23:50 +0200
Received: by mail-ee0-f46.google.com with SMTP id e49so26796eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=adE7NIgZ7juhAsNHs7l1ImuTjlpxwl7v/TLxQT0xT6c=;
	b=UrSgUHUEvWOY33CLbgEKYDM82c6UlZb0EsG+M1DhbgcUJX9gV3uw+VDp3J3CGc8Jbv
	Xosxa2Yj+/8FMsPOCmjgnV9aOCX0sP/23jvqpAMo+iXVMTO+NbeqOtYtvkKmmeMN5euP
	V1ZoUJ5oYsfNnMUlYurq6wN97H6UUfvLZjEVXiZc5fAE8f/ekC67x7/B/1n4C902fYcl
	QXCyQeuHTninLSXB4tDiqegPpRxAErXh3N9YMeVzos30Y22CEAAeyCRX5OdUyjf6VIKl
	S8PDvs7FsPlKOZCIOlA+1U+jkqyBfy8YPvpt6dSbp/fDh8xQGP3+tebxMeEBw4RbvLKR
	aQbA==
X-Received: by 10.14.109.71 with SMTP id r47mr10085216eeg.25.1364882801378;
	Mon, 01 Apr 2013 23:06:41 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q42sm319769eem.14.2013.04.01.23.06.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:06:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130401210320.GA21215@windriver.com>
Date: Tue, 2 Apr 2013 08:06:38 +0200
Message-Id: <DA93B563-DB94-4BB5-8BE5-9F71295214A3@dominion.thruhere.net>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
	<20130401181357.GK10672@windriver.com>
	<23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
	<20130401182131.GL10672@windriver.com>
	<3B6011D6-AA55-4A46-849A-07484DEEA060@dominion.thruhere.net>
	<20130401210320.GA21215@windriver.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlb1VSmwr2dSpoAEFo7I2DJ+J2RJ5uXjsvn2xRq7Xq7S8u5E3DcrEEuDwmxXPnpzO6jyIlt
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1
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
X-List-Received-Date: Tue, 02 Apr 2013 06:23:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr. 2013, om 23:03 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:

> [Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.04.01 (Mon 22:33) Koen Kooi wrote:
>=20
>>=20
>> Op 1 apr. 2013, om 20:21 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:
>>=20
>>> [Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.04.01 (Mon 20:15) Koen Kooi wrote:
>>>=20
>>>>=20
>>>> Op 1 apr. 2013, om 20:13 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:
>>>>=20
>>>>> Hey Koen,
>>>>>=20
>>>>> [[oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.03.29 (Fri 15:25) Koen Kooi wrote:
>>>>>=20
>>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>>> ---
>>>>>> ...y-link-in-sysroot-not-in-host-directories.patch | 39 =
++++++++++++++++++++++
>>>>>> .../python/python-m2crypto_0.21.1.bb               | 19 =
+++++++++++
>>>>>> 2 files changed, 58 insertions(+)
>>>>>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysr=
oot-not-in-host-directories.patch
>>>>>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>>>>>>=20
>>>>>> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>>>>>> new file mode 100644
>>>>>> index 0000000..bcbdf24
>>>>>> --- /dev/null
>>>>>> +++ =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>>>>>> @@ -0,0 +1,39 @@
>>>>>> +=46rom f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 =
00:00:00 2001
>>>>>> +From: Koen Kooi <koen@dominion.thruhere.net>
>>>>>> +Date: Fri, 29 Mar 2013 15:17:17 +0100
>>>>>> +Subject: [PATCH] setup.py: link in sysroot, not in host =
directories
>>>>>> +
>>>>>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>>> +
>>>>>> +Upstream-status: Unknown
>>>>>=20
>>>>> Does this mean you haven't determined if it should be sent =
upstream yet,
>>>>> or you did and it's gone off into an apparent black hole of a =
mailing
>>>>> list somewhere?
>>>>=20
>>>> The former
>>>=20
>>> Okay.  Isn't that normally 'Pending' then?  I can make that tweak in =
my
>>> merge, but I wanted to confirm I had the right information there =
first.
>>=20
>> If you think 'Pending' reflects the status better than 'Unknown', go =
for it, but 'Pending' has been the catch-all for Upstream-status fields, =
so anytime you see 'Pending' you know you can't trust the =
Upstream-status field.=20
>=20
> Yeah, certainly no argument here, 'Pending' implies something to me =
that
> simply isn't so based both on experience and the strict definition on
> the website.  But that does seem to fit the definition reasonably =
well.
>=20
> So since the meta-networking bit depends on the meta-oe bit being
> merged, do you want me to merge both at the same time?  Or if you =
would
> prefer to do the merge, I'm happy with the meta-networking piece of
> this, so feel free.

Feel free to merge both=


