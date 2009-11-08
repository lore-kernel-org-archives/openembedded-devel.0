Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N76fh-0000NK-Um
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 13:15:08 +0100
Received: from [192.168.5.49] (castle.reciva.com [82.71.203.193])
	by drlauer-research.com (Postfix) with ESMTP id A6D02584F4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2009 13:59:29 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911071730.09092.mok@mnet-online.de>
References: <200910222339.32881.david.lanzendoerfer@o2s.ch>
	<200911052309.39050.marcin@juszkiewicz.com.pl>
	<1257460931.4676.9.camel@andromeda>
	<200911071730.09092.mok@mnet-online.de>
Organization: Vanille-Media
Date: Sun, 08 Nov 2009 13:13:46 +0100
Message-ID: <1257682426.26962.12.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patches
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
X-List-Received-Date: Sun, 08 Nov 2009 12:15:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 07.11.2009, 17:30 +0100 schrieb Klaus 'mrmoku' Kurzmann:
> As for the openmoko phones you can either use a tar.gz for booting from SD or 
> jffs2 to boot from flash. But I might just want to build one of those?

To me a sane default is to add the image fstypes _commonly_ are in use
with the devices in the machine configuration. If you have special
needs, you can add more in your local.conf. I would not consider the
additional time and space consumption necessary to build one or two more
formats which you don't need a severe problem.

:M:




