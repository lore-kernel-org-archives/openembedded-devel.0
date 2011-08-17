Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZCt-00031T-F2
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:02:27 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	07:57:48 +0200
Date: Wed, 17 Aug 2011 07:57:59 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110817055759.GA7904@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1313496291.git.anders@chargestorm.se>
	<c0f2c59a9aca500b4be0c93de85a2a4390b2b115.1313496291.git.anders@chargestorm.se>
	<1313507126.4418.6.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313507126.4418.6.camel@mattotaupa>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v2 1/2] ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
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
X-List-Received-Date: Wed, 17 Aug 2011 06:02:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Menzel <paulepanter@users.sourceforge.net> [110816 17:05]:
 
> Am Dienstag, den 16.08.2011, 14:05 +0200 schrieb Anders Darander:
> > +LICENSE = "Kermit"
> > +LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=17dabbd2543933464b6d32083c3a3596"
> > +SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
> > +PR = "r3"

> could you please edit this commit and make that `r0`.

Sorry, I missed your previous comment on PR. Sure, I'll send an updated
patch shortly.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


