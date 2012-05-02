Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPXDH-0005Yl-Lm
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 12:55:19 +0200
Received: by wibhj13 with SMTP id hj13so3768931wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 03:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hXB6BmzGJF9GrkK1sypyosInNAmVMcdN1omB2D5mCD0=;
	b=AiupFOtD/M0SUbILlisUb2f1waoJ9EPvVsDz7WIxodUplPn0rhrkZQZ1Lp2hu7kmaM
	yzrCttwJd5Q+uOHNWtgyCFjK6+wKOPEDmWl0RlphhMcn2w4+1Clj03fpf7Ie3GcsN0DO
	3RLFhdKpMQ5Jvh83ZjDoO7BLL6y5f1EzmDS2yXszP/AqzvVLyArRrGDirPCw4qtEy3+5
	zbvz49tZxgxi7oJ1Gf0ZMtX3anEDV1W5AYUItslA4QZZtfQeJIMtPULUcnNuSyodZmwL
	WIlwneHBFGFsrT9Fm/pl7c7VVUGHhZSKVqFOo/lXfGuvKtH7meEk5oaM4KdvdsPMKWlP
	GFhw==
Received: by 10.180.83.38 with SMTP id n6mr13024960wiy.4.1335955529308;
	Wed, 02 May 2012 03:45:29 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ev10sm43461985wid.10.2012.05.02.03.45.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 03:45:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120502123556.0f72b7da@eb-e6520>
Date: Wed, 2 May 2012 12:45:20 +0200
Message-Id: <7680A3B1-C1E4-4B6B-ADFB-CC9FD44B5B71@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<20120502123556.0f72b7da@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn2x60Q76yi5rmtAnNSYnRjjDh7tZFbSwimJp/Ubg1bNBNp1OKlKZaN3I/AqDs1nnmYDZK1
Cc: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 10:55:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 12:35 heeft Eric B=E9nard het volgende geschreven:

> Hi,
>=20
> Le Wed, 2 May 2012 11:51:50 +0200,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
>=20
>> On Wed, May 02, 2012 at 11:45:30AM +0200, Koen Kooi wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>=20
>> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
>> gcc-4.7 and other gcc changes were in oe-core only after release =
AFAIK.
>>=20
> as I'm supposed to maintain meta-oe/denzil I would prefer that we keep =
a
> few days before pushing patches to this branch.

The OE-classic release branches usually had rules like "wait at least 24 =
hours between post and push", so your idea makes a lot of sense.

regards,

Koen=


