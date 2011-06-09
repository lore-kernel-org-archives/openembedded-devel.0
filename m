Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QUew0-0002an-DA
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 15:06:05 +0200
Received: by fxm19 with SMTP id 19so1096850fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 06:02:45 -0700 (PDT)
Received: by 10.223.28.19 with SMTP id k19mr749091fac.139.1307624564727;
	Thu, 09 Jun 2011 06:02:44 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id q10sm648731fan.32.2011.06.09.06.02.43
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 06:02:44 -0700 (PDT)
Message-ID: <4DF0C472.4030608@dresearch-fe.de>
Date: Thu, 09 Jun 2011 15:02:42 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110414 SUSE/3.1.10 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Distros supporting older kernels?
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
X-List-Received-Date: Thu, 09 Jun 2011 13:06:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Distro Maintainers,

as you could read in earlier messages of mine, we're forced to use an older kernel version (2.6.24) for our hardware. This brings a lot of problems as you can imagine (e.g. we're also bound to udev-141).

Until now we've used angstrom-2008.1 with some own patches according to the linux-libc-headers and udev versions for our hardware which were reasonably not accepted by the Angstrom maintainers (see discussions [1] or [2]).

In there current situation (angstrom-2008.1 is deprecated, the new layer concept will come up) we're looking for a new, better, less hacky solution.

My first question therefor is if there are any distros explicitely supporting older kernels (pre 2.6.27) yet? Or are willing to work on it?

[1] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/32375>
[2] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/42628>

Thx,
Steffen

PS: Does anybody know a good overview which Linux Kernel API changes were made in which kernel version?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


