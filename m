Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IIm4A-0006fx-Ku
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 15:59:14 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 39C2B28C013; Wed,  8 Aug 2007 15:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180177247.adsl.alicedsl.de [85.180.177.247])
	by srv043.dedi23.de (Postfix) with ESMTP id 36CC628C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2007 15:54:13 +0200 (CEST)
Date: Wed, 8 Aug 2007 15:56:34 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <236686022.20070808155634@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B9BFC9.60402@dominion.kabel.utwente.nl>
References: <E1IIkwT-00010u-Ld@linuxtogo.org>
	<46B9BFC9.60402@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev matchbox-panel2 ship plugin *.la in debug package (QA fix)
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
X-List-Received-Date: Wed, 08 Aug 2007 13:59:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> mickeyl commit schreef:
>> matchbox-panel2 ship plugin *.la in debug package (QA fix)

>> +FILES_${PN}-dbg += "${libdir}/matchbox-panel/lib*.a ${libdir}/matchbox-panel/lib*.la"

> No, those go into -dev packages.

Good catch. Thanks.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



