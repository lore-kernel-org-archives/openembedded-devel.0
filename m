Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JxGHj-0005WN-Nm
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 May 2008 08:52:51 +0200
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 403EC3EA0DB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2008 08:50:56 +0200 (CEST)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 277B03EA0CD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2008 08:50:56 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id CCF6A1840B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2008 08:51:06 +0200 (CEST)
Message-ID: <482E805A.6010506@bolloretelecom.eu>
Date: Sat, 17 May 2008 08:51:06 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.14) Gecko/20080509 Lightning/0.8 Thunderbird/2.0.0.14
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g0ke5t$s9n$1@ger.gmane.org> <482DC846.1040301@bolloretelecom.eu>
	<g0kkgn$kc8$1@ger.gmane.org>
In-Reply-To: <g0kkgn$kc8$1@ger.gmane.org>
Subject: Re: disapproval or revision	462968658bdc2a3c48a8d634f9be59d450259f49
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 17 May 2008 06:52:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> Sorry for the mess, I committed a new revision that removes the exports
>> and makes 0.9.8m the default again, since it now builds (probably due to
>> having correct CFLAG this time *cough*).

Cool... well, nearly! openssl-native_0.9.8g.bb still contains
DEFAULT_PREFERENCE = "-1".

If it's OK with you I'd like to see 0.9.8g as the default for native
builds too, so we only download one .tar.gz by default.

Cheers,
Jeremy


