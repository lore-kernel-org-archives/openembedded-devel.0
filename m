Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TbQOv-0002M7-CK
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 07:36:42 +0100
Received: from ad.chargestorm.se (83.252.253.85) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 22 Nov 2012 07:21:26 +0100
Date: Thu, 22 Nov 2012 07:22:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121122062224.GB5468@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<1351681706-12778-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1351681706-12778-2-git-send-email-otavio@ossystems.com.br>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v2 2/3] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
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
X-List-Received-Date: Thu, 22 Nov 2012 06:36:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [121031 12:08]:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} (100%)

Ping?

Could we have this patch (and the 1/3, which moved systemd-support to
meta-systemd/meta-networking/....) applied?

meta-systemd has been unparsable for quite some time now, as
meta-networking has ntp 4.2.6p5, and the bbappend in meta-systemd is for
4.2.6p3...

/Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


