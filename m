Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1QPfH6-0003Nf-TR
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 20:27:12 +0200
Received: from [192.168.2.2] (e180146252.adsl.alicedsl.de [85.180.146.252])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id D5107584104
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2011 20:51:16 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306341762-14961-1-git-send-email-morphis@gravedo.de>
References: <1306341762-14961-1-git-send-email-morphis@gravedo.de>
Organization: Vanille-Media
Date: Thu, 26 May 2011 20:24:11 +0200
Message-ID: <1306434251.5151.1.camel@dynamit>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] python-2.6.6: backport pkgconfig support from version 2.7.1 and bump PR
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
X-List-Received-Date: Thu, 26 May 2011 18:27:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 25.05.2011, 18:42 +0200 schrieb Simon Busch:
> Version 2.6.6 of python does not have support for pkgconfig and 2.7.1 is not yet ready in
> OE so I back-ported the new pkgconfig feature to 2.6.6.

That's a good idea.

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

-- 
:M:



