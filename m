Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDbfj-00065W-Kz
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 15:19:53 +0100
Received: by mail-ea0-f173.google.com with SMTP id i1so1593900eaa.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 06:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Fhm3faMB8lEhjYBHQOIeyI3AW0cnSBhSAraURAXk9Bg=;
	b=QL+jo8iAHJS5wgqeqYQ3xg8dRgocOjNESCECRLpp5j5pQJVvIbYpOgp7GJByxbOULH
	r5VDW5FM2TVhTv9J+SbS6zX4KfurOAUxJclfByyPl9dvg8xja7kg7Yw7xir5h41skeno
	WxfM6C+5eTd5wchHEqwbqIofasSvJzHcJoAHLH8CGsn4Htbu/aFDMGnJywkxMN2id2h0
	C+B+b+KRpLzhiggfeDzGKuBtex3o1nqIMkorqex5SncukF0sGMdnPbIZEQhjoTGJVo7A
	ZwMqr16JR2IUmbVAXBCvG5hHhhlh01684CVjA8Am3XR1U7NaWbQqwP+zp2YJ0CNqdr89
	9l2Q==
X-Received: by 10.14.206.132 with SMTP id l4mr93108209eeo.38.1362664999432;
	Thu, 07 Mar 2013 06:03:19 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f47sm2361199eep.13.2013.03.07.06.03.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 06:03:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130307130435.GI32228@jama.dyndns-home.com>
Date: Thu, 7 Mar 2013 15:03:17 +0100
Message-Id: <E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<20130307130435.GI32228@jama.dyndns-home.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQmTU6/Bj9FFfote+7YFqQgRe23oyhwO7G3J21Jv93nfh8VbHoL3coJivoYnhmXMB+c5OOMB
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 14:19:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mrt. 2013, om 14:04 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
>> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> README | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/README b/README
>>> index 0635e10..cab1e21 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
>>> Contributors:
>>> Copyright 2012 - Kai Kang
>>> Copyright 2013 - Khem Raj
>>> -Copyright 2012 - Koen Kooi
>>> +Copyright 2012, 2013 - Koen Kooi
>>> Copyright 2012 - Robert Yang
>>> Copyright 2011, 2012 - Samuel Stirtzel
>>>=20
>>> --
>>> 1.8.1.4
>>>=20
>>=20
>> Thanks for your patches,
>> I applied them all.
>>=20
>>=20
>> Unrelated to your patches:
>> There are some upcoming changes, but they don't fit into yocto 1.4
>> (assumed that yocto is the orientation point for third-party OE-layer
>> releases).
>> So there will be a yocto-1.4 branch in advance and the development
>> will continue on master.
>=20
> It would be nice to know yocto-1.4 release name in advance and name it
> the same as branch in oe-core/meta-oe will be (denzil, danny, ...), =
but
> I guess it can be renamed later.

For angstrom I'm going to use 'yocto-1.4' in the branch name, I have =
trouble remembering which names maps to which release. And the Yocto =
compliance program talks about 1.3, .14 etc, not about codenames.




