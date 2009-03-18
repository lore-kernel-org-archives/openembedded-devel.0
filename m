Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1Ljxra-000288-QE
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 16:39:29 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 8E8FE328330
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:38:28 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mR4V3xlttXH
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:38:28 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 6D0F5328422
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:38:27 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <01c401c9a7dd$8a20b4a0$9e621de0$@Willis@Distant-earth.com>
In-Reply-To: <01c401c9a7dd$8a20b4a0$9e621de0$@Willis@Distant-earth.com>
Date: Wed, 18 Mar 2009 15:38:15 -0000
Message-ID: <01c801c9a7df$8eee7e70$accb7b50$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acmn3YiCin2OBxB+Qgm4MHx0gIC3pgAAOwXw
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,MSGID_MULTIPLE_AT,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Loss of all package history following the recipe rename.
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
X-List-Received-Date: Wed, 18 Mar 2009 15:39:29 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

<snip>

After kergoth took the time to point out that I was just looking at this
'the wrong way' and not 'the GIT way' I think the mail can safely be
disregarded ;-). 

It still does not change the fact that the behavior of 'git log' gave me a
real panic moment but at least nothing is lost if your happy to dig (or
rather use git log --follow, ok, next time I promise to read the man page
before panicking ;-), I am just used to --follow functionality being a
default behavior).

Regards,

John





