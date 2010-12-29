Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1PY1el-0003e7-Ci
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 20:25:55 +0100
Received: from [192.168.1.2] (e180149243.adsl.alicedsl.de [85.180.149.243])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id BB8CE584136
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 20:40:25 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
References: <1293644563.4238.7.camel@mattotaupa>
	<1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
Organization: Vanille-Media
Date: Wed, 29 Dec 2010 20:25:36 +0100
Message-ID: <1293650736.2173.30.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 19:25:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for the patch, Martin.

Ack'ed by me as well, although ideally
we would outfactor something like dbus-headers,
since glib only requires the dbus headers, nothing
else.

Cheers,

:M:




