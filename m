Received: from [209.85.134.185] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J2SIO-0001bv-8y
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 15:10:44 +0100
Received: by mu-out-0910.google.com with SMTP id w8so411656mue.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2007 06:06:24 -0800 (PST)
Received: by 10.82.146.14 with SMTP id t14mr1960649bud.9.1197468384630;
	Wed, 12 Dec 2007 06:06:24 -0800 (PST)
Received: from ?192.168.61.156? ( [194.79.8.34])
	by mx.google.com with ESMTPS id c28sm8453700fka.2007.12.12.06.06.22
	(version=SSLv3 cipher=OTHER); Wed, 12 Dec 2007 06:06:23 -0800 (PST)
Date: Wed, 12 Dec 2007 16:09:58 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <64103649.20071212160958@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <475FAB62.3090702@student.utwente.nl>
References: <1617210780.20071212000416@gmail.com>
	<31294197.20071212092006@vanille-media.de>
	<475FAB62.3090702@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [Angstrom-devel] [RFC] Using ${PR} instead of ${DATETIME} in deployed kernel image filename
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2007 14:10:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, December 12, 2007, 11:35:30 AM, you wrote:

[]
>>> I'd like to propose using the following filename pattern for deployed
>>> kernel images: "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}", instead

>>> 2. Otherwise, I'm going to change this for linux-handhelds-2.6, and
>>> would like to encourage maintainers of the other kernel recipes to do
>>> the same.
>> 
>> Isn't it already deployed in linux.inc? I remember I had to catch up
>> linux-openmoko.inc because of that change.

> It is. Remaining 'offenders' are linux-hh and linux-rp, and maybe some
> other kernel recipes I never look at.

  Aha, perfect. So I guess, we can bring all kernel recipes to
consistency, like in one-week frame...

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



