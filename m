Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RO8NT-0006sx-6c
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 14:39:43 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Wed, 9 Nov 2011 14:32:20 +0100
Date: Wed, 9 Nov 2011 14:32:20 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111109133220.GB5579@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1320841846.git.anders@chargestorm.se>
	<af4142d54e9a7999e8e705495cb746c07c7d3990.1320841846.git.anders@chargestorm.se>
	<j9dugs$k6f$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j9dugs$k6f$1@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 1/1] rsyslog: change postrm to prerm
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
X-List-Received-Date: Wed, 09 Nov 2011 13:39:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [111109 14:18]:
> Op 09-11-11 13:32, Anders Darander schreef:
> > The systemd service can't be disabled if it already has been removed,
> > thus disable it prior to removing the package.

> > Signed-off-by: Anders Darander <anders@chargestorm.se>

> Applied. Next time could you please follow
> https://github.com/openembedded/meta-oe/blob/master/meta-oe/README and use
> [meta-oe] in the subject?

Yes, sure. Sorry that I forgot that....

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


