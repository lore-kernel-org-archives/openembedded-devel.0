Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1QKRb3-00085Y-H7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:50:13 +0200
Received: from [192.168.2.2] (e180152014.adsl.alicedsl.de [85.180.152.14])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id E327C58411D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 11:13:21 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305189154.4254.4.camel@mattotaupa>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-3-git-send-email-eric@eukrea.com>
	<1305189154.4254.4.camel@mattotaupa>
Organization: Vanille-Media
Date: Thu, 12 May 2011 10:47:39 +0200
Message-ID: <1305190059.11918.7.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2/6] minimal: prefer qt 4.7.3
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
X-List-Received-Date: Thu, 12 May 2011 08:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 12.05.2011, 10:32 +0200 schrieb Paul Menzel:
> sorry for the slight off-topic question. But I how I understand minimal,
> it normally takes the latest recipes available.

Not quite. Minimal's philosophy is to make sure that
the OE metadata are not faulty in itself, hence that
a reasonable set of DEFAULT_PREFERENCE exists, so that
we only have to pinpoint as little as necessary.

> So could setting the Qt
> version be actually be dropped in a future patch?

Fine with me.

Cheers,
-- 
:M:



