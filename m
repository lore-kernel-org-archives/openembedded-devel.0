Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Q9LCC-0002r8-4B
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 19:46:42 +0200
Received: from localhost (85.231.30.150) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Mon, 11 Apr 2011
	19:44:15 +0200
Date: Mon, 11 Apr 2011 19:44:15 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110411174403.GA3719@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
	<20110411080125.GB28101@jama.jama.net>
	<1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
	<20110411105712.GA5626@excalibur.local>
	<BANLkTikvA5bhUTJ0NhKXn158Y5RhZ8V-_g@mail.gmail.com>
	<20110411114116.GB5626@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110411114116.GB5626@excalibur.local>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 17:46:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

A third version has just been posted.

* Stefan Schmidt <stefan@datenfreihafen.org> [110411 13:41]:
> On Mon, 2011-04-11 at 13:29, Anders Darander wrote:
> > Yes, I agree with you that the correct fix is to update lowpan-tools
> > to use libnl2. However, due to time constraints, we opted for the
> > interim solution.

> Yup, no problem. I'm going to touch the ieee802154 kernel stack and
> maybe lowpan-tools the next weeks anyway I will try to squeeze in the
> change to libnl2.

Good news, such a change will definitely be appreciated. We had the same
idea, however, we won't be able to find the time for it for quite a
while...

Regarding your work touching the ieee802154 kernel stack, is the version
from the linux-zigbee-kernel tree? Or is it something getting mainlined?
We are currently in a prototype phase, especially when it comes to
zigbee, and both kernel version and additional kernel patches are
open...

Regards,
Anders

-- 
Anders Darander
ChargeStorm AB


