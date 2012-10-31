Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TTSGb-0005U4-2X
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 07:59:09 +0100
Received: from localhost (193.41.119.134) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Wed, 31 Oct 2012
	07:44:17 +0100
Date: Wed, 31 Oct 2012 07:44:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121031064424.GA30608@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1351607962-13469-1-git-send-email-otavio@ossystems.com.br>
	<1351607962-13469-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1351607962-13469-2-git-send-email-otavio@ossystems.com.br>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
Subject: Re: [meta-oe][PATCH 2/2] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p6
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
X-List-Received-Date: Wed, 31 Oct 2012 06:59:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [121030 15:39]:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} (100%)

Shouldn't this bump ntp to 4.2.6p5 instead of 4.2.6p6? At least 4.2.6.p5
is what I can see in meta-networking at the moment. Though, I might have
missed another patch floating around...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


