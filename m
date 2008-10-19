Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KrbR1-000186-D7
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Oct 2008 18:47:19 +0200
Received: from andromeda.vanille.de (e180135172.adsl.alicedsl.de
	[85.180.135.172])
	by drlauer-research.com (Postfix) with ESMTP id AFFD8584708
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2008 19:00:19 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Oct 2008 18:47:04 +0200
User-Agent: KMail/1.9.10
References: <gdfm8d$apg$1@ger.gmane.org>
In-Reply-To: <gdfm8d$apg$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810191847.04533.mickey@vanille-media.de>
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Sun, 19 Oct 2008 16:47:19 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Sunday 19 October 2008 18:11:57 schrieb Koen Kooi:
> Hi,
>
> Why are people removing busybox recipes that angstrom has in
> PREFERRED_VERSIONS? QA gets really hard to do if things in
> PREFERRED_VERSIONS dissappear and unwanted versions get built....

Ack. Been bitten my that more than once. We should either leave the versions 
and just add newer ones or change the preferred-providers to match (if sure 
it's a minor update of a stable version). 

(This time it was an error on my side though.)

-- 
:M:


