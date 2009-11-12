Received: from [62.2.86.239] (helo=a.mx.bitcloner.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1N8YcB-0003xa-IV
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:17:30 +0100
Received: from p5b2cfc14.dip.t-dialin.net ([91.44.252.20] helo=127.0.0.1)
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <betheg@bitcloner.org>)
	id 1N8Yaw-0002Zy-KT for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:16:10 +0100
Date: Thu, 12 Nov 2009 13:16:09 +0100
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112121609.GA23707@localhost>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1257957707-31349-1-git-send-email-betheg@bitcloner.org>
MIME-Version: 1.0
In-Reply-To: <1257957707-31349-1-git-send-email-betheg@bitcloner.org>
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 0/3] tzdata fix and update version
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
X-List-Received-Date: Thu, 12 Nov 2009 12:17:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The patchs are not working so please ignore this patches.
Sorry i was to fast and yesterday i have not testet these patches very
well. The iso3166.tab an zone.tab are not included in the package
because the reciept copy it in the wrong place (${D}${prefix} insteed of 
${D}${datadir}/zoneinfo).


greets
Michael


