Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1GuD9A-0001BI-Ju
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 20:18:36 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4637F28C025; Tue, 12 Dec 2006 20:14:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180190218.adsl.alicedsl.de [85.180.190.218])
	by srv043.dedi23.de (Postfix) with ESMTP id DA55828C022
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 20:14:00 +0100 (CET)
Date: Tue, 12 Dec 2006 20:17:00 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) UNREG / CD5BF9353B3B7091
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <747437870.20061212201700@vanille-media.de>
To: koen commit <openembedded-devel@lists.openembedded.org>
In-Reply-To: <E1Gu4iF-0003Rn-TF@linuxtogo.org>
References: <E1Gu4iF-0003Rn-TF@linuxtogo.org>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev libx11: don't use oe_runmake to build makekeys since that fails for cross-endian builds
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
X-List-Received-Date: Tue, 12 Dec 2006 19:18:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

koen commit wrote:
> libx11: don't use oe_runmake to build makekeys since that fails for cross-endian builds

This change breaks building libX11 for me. TARGET=armv4


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



