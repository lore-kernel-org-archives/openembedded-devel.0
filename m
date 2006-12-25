Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1Gydqq-0000D1-QO
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Dec 2006 01:38:00 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 6AD0928C022; Mon, 25 Dec 2006 01:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180160219.adsl.alicedsl.de [85.180.160.219])
	by srv043.dedi23.de (Postfix) with ESMTP id E169328C021
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2006 01:34:19 +0100 (CET)
Date: Mon, 25 Dec 2006 01:35:42 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1765228861.20061225013542@vanille-media.de>
To: Dmitry Nezhevenko <openembedded-devel@lists.openembedded.org>
In-Reply-To: <20061225001648.GA21942@debian.deb>
References: <20061225001648.GA21942@debian.deb>
MIME-Version: 1.0
Subject: Re: Trying to build opie-image
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
X-List-Received-Date: Mon, 25 Dec 2006 00:38:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dmitry Nezhevenko wrote:
> NOTE: multiple providers are available (glibc, glibc-intermediate);
> NOTE: consider defining
> PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
> ERROR: Nothing provides dependency task-bootstrap
> ERROR: dependency task-bootstrap (for opie-image) not satisfied
> NOTE: no buildable providers for opie-image

Do you have any local changes to opie-image.bb? The one in the
repository no longer depends on task-bootstrap.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



