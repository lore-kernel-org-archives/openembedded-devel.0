Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NGSdl-0001Sb-JT
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 08:31:48 +0100
Received: from [192.168.1.105] (e180137005.adsl.alicedsl.de [85.180.137.5])
	by drlauer-research.com (Postfix) with ESMTP id 487B0584197
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 09:18:01 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
Organization: Vanille-Media
Date: Fri, 04 Dec 2009 08:29:43 +0100
Message-ID: <1259911783.1467.8.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 07:31:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Shouldn't that rather be DISTRO_APM? That way it looks less like an
override.

:M:





