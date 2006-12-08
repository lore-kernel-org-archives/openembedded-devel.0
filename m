Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1Gsj5k-0000pg-F8
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Dec 2006 18:01:13 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 7499F28C022; Fri,  8 Dec 2006 17:56:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=MISSING_HEADERS,
	RCVD_IN_NJABL_DUL,RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180147124.adsl.alicedsl.de [85.180.147.124])
	by srv043.dedi23.de (Postfix) with ESMTP id 894EA28C021
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2006 17:56:51 +0100 (CET)
Date: Fri, 8 Dec 2006 17:59:39 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) UNREG / CD5BF9353B3B7091
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <444521399.20061208175939@vanille-media.de>
CC: openembedded-devel@lists.openembedded.org
In-Reply-To: <1165496944.5601.32.camel@localhost.localdomain>
References: <456B0DC2.90300@dominion.kabel.utwente.nl>
	<45780B2E.4020906@dominion.kabel.utwente.nl>
	<1165496944.5601.32.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: To be removed recipes
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
X-List-Received-Date: Fri, 08 Dec 2006 17:01:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Thu, 2006-12-07 at 13:38 +0100, Koen Kooi wrote:
>> > In case people didn't notice,
>> > http://www.openembedded.org/repo/org.openembedded.dev/removal.txt has a few entries now,
>> > which will be removed on the specified dates.
>> 
>> Only 5 days left till the first batch gets removed.

>> Package Name:   Maemo
>> Reason:         Unfetchable, obsoleted by IT2006 release.

> I don't know what we should do with these for the best. The end result
> will be maemo being near enough totally removed from OE which sends out
> the wrong message. I would ultimately like to see maemo in OE...

> Maybe a contender for moving to non-working?

I agree.

>> Package Name:   bluez*2.*
>> Reason:         Obsolete by, and conflicts with bluez 3.7               

> Fine with me.

This can be a problem for Opie, since we used the no-dbus version for
quite some time to save space.

>> Package Name:   zeecookbook
>> Reason:         Not maintained upstream, not fetchable

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



