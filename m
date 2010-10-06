Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1P3WWX-00014G-LQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 18:07:22 +0200
Received: from [192.168.1.2] (e180149196.adsl.alicedsl.de [85.180.149.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id E36E1584112;
	Wed,  6 Oct 2010 18:14:42 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20101006141420.GI3264@jama>
References: <1286373970.3792.6.camel@mattotaupa> <20101006141420.GI3264@jama>
Organization: Vanille-Media
Date: Wed, 06 Oct 2010 18:07:34 +0200
Message-ID: <1286381254.15886.3.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: libfsotransport_git: `do_compile()` fails with error: Pointer arithmetic not supported for `void*'
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
X-List-Received-Date: Wed, 06 Oct 2010 16:07:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Should be fixed with 5f436b0997fdddb06cc17cbe4acfc89d01122795

Cheers,

:M:




