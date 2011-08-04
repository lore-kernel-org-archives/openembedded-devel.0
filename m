Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Qosmt-0006YA-HI
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:56:17 +0200
Received: by fxg11 with SMTP id 11so549960fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 00:51:52 -0700 (PDT)
Received: by 10.204.14.139 with SMTP id g11mr146265bka.274.1312444311913;
	Thu, 04 Aug 2011 00:51:51 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id t19sm452273bku.7.2011.08.04.00.51.50
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 00:51:50 -0700 (PDT)
Message-ID: <4E3A4F95.7090402@dresearch-fe.de>
Date: Thu, 04 Aug 2011 09:51:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312192798-18259-1-git-send-email-koen@openembedded.org>
	<4E36AAB5.4080307@dresearch-fe.de>
	<4E3A472D.3030001@dresearch-fe.de> <j1diae$tc1$1@dough.gmane.org>
In-Reply-To: <j1diae$tc1$1@dough.gmane.org>
X-Enigmail-Version: 1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Thu, 04 Aug 2011 07:56:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2011 09:38, Koen Kooi wrote:
> Op 04-08-11 09:15, Steffen Sledz schreef:
>> On 01.08.2011 15:31, Steffen Sledz wrote:
>>> On 01.08.2011 11:59, Koen Kooi wrote:
>>>> Also import a fix from OE-core for setting the loader dir.
>>>> 
>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>> 
>>>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>>> 
>>> Acked-by: Steffen Sledz <sledz@dresearch-fe.de>
> 
>> Ping!
> 
>>> Thx for this. Would be nice, if this patch could find it's way to 2011.03-maintenance branch too.
> 
> Wasn't this in the pull request you did this week?

Not yet. I would like to wait until it made it's way to oe-dev master.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


