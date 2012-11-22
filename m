Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TbSka-0005jO-9K
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 10:07:14 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1055229wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 00:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kfRlqGqhU9IxjPBhi2AlWgsCHSnAIQL9enwDJTsan6Q=;
	b=o+lnW2SqB0qwAgWfq+1RqNIFMgt3OVXvSR/5gRwRzdJnK+t+yGE9lcNob7DvIffbIh
	wUHEOM6+6UM7RZuqIIXq4KZY1J95y9Y+Q0h26AZqCHYX9tLOxD/Z/gefNsvm/w4Yg4dU
	9lwCKuqA1kEmIAVqt+KfEvULc77bFmb0hI1F5haRaM6D8UWGUH3mrqRIFo8G06OPartv
	DuXbE/BLXk1flLNhY2jzBnOH+tFdSSDWct7GJIq6eekJh60dFHFfdNdaRzA1fmSU3NnP
	eCb+vlXjDdKkHVjxAjN4l6UcLfjesDaRcpUrZkvwL0/4zWMswvW+riG8yvwreDfIBefU
	m3Yg==
Received: by 10.180.106.34 with SMTP id gr2mr3181389wib.18.1353574386189;
	Thu, 22 Nov 2012 00:53:06 -0800 (PST)
Received: from [172.20.0.22] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t17sm2571330wiv.6.2012.11.22.00.53.04
	(version=SSLv3 cipher=OTHER); Thu, 22 Nov 2012 00:53:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrA=aEQhmBQaNvWpFP9-6T_Eq3ej6qFn0mDUoU_yX3s3Q@mail.gmail.com>
Date: Thu, 22 Nov 2012 09:53:04 +0100
Message-Id: <B4A87246-6282-45A5-BAD7-3D58CB20A5CB@dominion.thruhere.net>
References: <k6b5r8$edu$1@ger.gmane.org> <20121121161712.030af137@eb-e6520>
	<CAMKF1srnGbWDNjKx=6udw8EVLf_CFSaM5u7_TSmBfJx2xzpDSA@mail.gmail.com>
	<CAP9ODKrA=aEQhmBQaNvWpFP9-6T_Eq3ej6qFn0mDUoU_yX3s3Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnOYcEqO78L34KCEB7XT4+9IQYdu2ZkrggeKU0AXBBsZSHR1QyGdOBvfeb0gGJSIgJgRHk+
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Thu, 22 Nov 2012 09:07:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 nov. 2012, om 21:28 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Wed, Nov 21, 2012 at 2:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Eric
>>=20
>> If you have time thats good please go ahead with danny too. I have =
been
>> away for most of time after ELCE
>=20
> I am also fine with Eric being the maintainer.
>=20
> I can be a backup if need.

Can you guys cook up a patch to the README changing the requirements =
from 'master' to 'danny' for oe-core and replace me with the contact =
info for all the danny maintainters?

regards,

Koen=


