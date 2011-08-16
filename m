Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtFiJ-0002zy-I0
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 11:13:35 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	11:08:58 +0200
Date: Tue, 16 Aug 2011 11:09:09 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20110816090908.GF22184@chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20110816074907.GE22184@chargestorm.se>
	<201108160959.36103.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201108160959.36103.paul.eggleton@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC] Need for qmake_base.bbclass?
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
X-List-Received-Date: Tue, 16 Aug 2011 09:13:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [110816 10:59]:
> On Tuesday 16 August 2011 08:49:08 Anders Darander wrote:
> > I'd like to get rid of qmake_base.bbclass in oe-core.

> Presumably you mean "in meta-oe" here...

Yes, that's right. (I don't know what it is with me and e-mail the
latest couple of days...)

> > If we merge the second hunk of the diff to oe-core, do we risk getting
> > any failures/problems?

> Looks pretty reasonable to me, at a glance I can't see it causing any issues.

Good to hear. If no-one else has any objections, I'll submit a patch
delete qmake_base.bbclass, after submitting and getting my oe-core
patches merged.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


