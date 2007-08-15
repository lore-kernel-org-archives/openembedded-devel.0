Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1ILQTg-0001f4-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2007 23:32:32 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id BB72128C013; Wed, 15 Aug 2007 23:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180135152.adsl.alicedsl.de [85.180.135.152])
	by srv043.dedi23.de (Postfix) with ESMTP id 45EF428C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2007 23:29:27 +0200 (CEST)
Date: Wed, 15 Aug 2007 23:32:04 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <29741134.20070815233204@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <a7f8874a0708151329r4a4a51fxe081b077ea7fa758@mail.gmail.com>
References: <977083614.20070815195126@vanille-media.de>
	<a7f8874a0708151329r4a4a51fxe081b077ea7fa758@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Python 2.5.1 coming / End-of-life for PyQt-Embedded
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
X-List-Received-Date: Wed, 15 Aug 2007 21:32:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hans Henry von Tresckow wrote:
> On 8/15/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
>>
>> Hi guys,
>>
>> I'm going to push a major Python upgrade in the next couple of days.
>> The migration to 2.5.1 should be fairly painless with the exception of
>> a couple of end-of-life-packages for which no 2.5.x support exists.
>>
>> The main problem is PyQt for Qt/Embedded 2.x. I would like to
>> completely drop support for all this or hand it over to someone else.
>> Is anyone actually running pyqt applications on Opie these days
>> anyways?
>>
>> Regards,
>>
>> :M:
>> --
>> Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de
>>
>> Is there a way to keep the python 2.4 stuff around for a bit longer? PyQt
> might be useful for prototyping purposes.

Yes, I won't remove it. However, I won't support building both 2.5 and
2.4 in one tree, so you'll have to decide on one.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



