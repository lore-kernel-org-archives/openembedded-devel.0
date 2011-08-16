Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtE7o-0007oV-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 09:31:48 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	09:27:11 +0200
Date: Tue, 16 Aug 2011 09:27:21 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110816072713.GD22184@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1313478102.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <cover.1313478102.git.anders@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 0/1] Import ability for libx11 to skip itself
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
X-List-Received-Date: Tue, 16 Aug 2011 07:31:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Anders Darander <anders@chargestorm.se> [110816 09:13]:
> As of commit 2f94ff4fdb66755ba2448794baea19315ff96273 in oe-core, libx11 skips
> itself if x11 is not in DISTRO_FEATURES.

> Meta-oe has its own copy of libx11.inc, thus the commit has to be applied to
> meta-oe also. This patch does the import.

As is seen in the e-mail, the subject should have included [meta-oe]...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB	


