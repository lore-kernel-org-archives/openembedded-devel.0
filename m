Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TznAJ-0008JR-Rr
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 12:46:47 +0100
Received: by mail-ea0-f175.google.com with SMTP id d1so1087109eab.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rzYDcOkoS4qekr7xs440eZWtxG52bsrh2sTYfDWN0Rw=;
	b=XQnE2wVfiUheOrJyH/vL5T5oxbPyXdo3JKKWnpbFLdnuw9FC+1+0Aq2COcR6uemVWw
	QvRferI8+TdTfeqXWOZ20/AkAf9Z90y4lYtXCWOutIj7fZ8kqnn6U6nR3pbDXVYjm6wm
	QX8HvXg5xGYzxyLnhaj8VspTzZyVjZBbGtvjGtddyUXKboju8kOxZB6x4OApI1w9ufwk
	KTTBy2LaUK1/vdCjx7s9e6Vdfhu49e/m4T9ZqOCVc/29YxdGQDqAKEuCKcBcfzBHks0E
	Gaj2OvHJ777qP5BH9Wcp5H3gTGsdGKKU3ST+zA2pwv0B64l8JTZ77PneGC/NX+XYoACa
	pwcA==
X-Received: by 10.14.219.5 with SMTP id l5mr18004109eep.7.1359372641549;
	Mon, 28 Jan 2013 03:30:41 -0800 (PST)
Received: from ?IPv6:2001:610:612::1c07:3abe:32b3:815c?
	([2001:610:612:0:1c07:3abe:32b3:815c])
	by mx.google.com with ESMTPS id 6sm15565886eea.3.2013.01.28.03.30.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 03:30:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130128104307.GW16904@jama.palm1.palmone.com>
Date: Mon, 28 Jan 2013 12:30:41 +0100
Message-Id: <77662C11-494E-42BB-9824-799DFA29F7F8@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
	<20130128104307.GW16904@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnm0KXRtXxHwuexyLO/7L4eAofSOuOiPZ8PQKYl/SrS/Oe+WRyll3bJEqg9tbuD3Z+Pkb2w
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/7] libebml: add 1.2.2
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
X-List-Received-Date: Mon, 28 Jan 2013 11:46:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jan. 2013, om 11:43 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Sun, Jan 27, 2013 at 04:41:16PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> All applied, Thanks.=20
>=20
> Now I have only:
> 3424ca7 wscan: add 20121111
> 5c7cfdd xbmc: first try at making it build for non-GLES platforms
> pending from you :).

Still haven't had the time to look at fixing wscan and xbmc is a =
*$(*$(#*$(@ mess when trying to make it build against EMGD libs=


