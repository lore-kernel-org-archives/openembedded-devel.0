Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1GuEkz-0004Jh-TS
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 22:01:46 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id CF5EB28C025; Tue, 12 Dec 2006 21:57:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180190218.adsl.alicedsl.de [85.180.190.218])
	by srv043.dedi23.de (Postfix) with ESMTP id 5CEBD28C022;
	Tue, 12 Dec 2006 21:57:09 +0100 (CET)
Date: Tue, 12 Dec 2006 22:00:07 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) UNREG / CD5BF9353B3B7091
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <193365758.20061212220007@vanille-media.de>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <26264111.20061212224755@gmail.com>
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>
	<457F1191.2050208@dominion.kabel.utwente.nl>
	<26264111.20061212224755@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE.
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
X-List-Received-Date: Tue, 12 Dec 2006 21:01:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>> You're free to re-add the fixed version that doesn't break apps depending on bluez-libs,
>> but not the broken version.

>   I'll probably will eat my dogfood of maintainer of a bit bitrotted
> stuff, and won't put outdated stuff back, but will look into
> upgrading OPIE to bluez3, when I get to that.

Not much action in upgrading necessary. The issue was (and still
remains) that bluez3 depends on dbus which in turn brings glib with it
and this is relatively huge.

The advantage of Opie fitting into 14.5MB flash like on Sharp SL5500 would
be void then.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



