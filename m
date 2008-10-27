Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KuRlH-0008JL-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 14:03:59 +0100
Received: from andromeda.vanille.de (e180160026.adsl.alicedsl.de
	[85.180.160.26])
	by drlauer-research.com (Postfix) with ESMTP id 3F642584BC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2008 14:17:03 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Oct 2008 14:03:09 +0100
User-Agent: KMail/1.9.10
References: <ge211u$h4r$1@ger.gmane.org> <490599E4.5090409@balister.org>
	<200810271345.22194.zecke@selfish.org>
In-Reply-To: <200810271345.22194.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810271403.09864.mickey@vanille-media.de>
Subject: Re: Reverting recent openmoko commit
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
X-List-Received-Date: Mon, 27 Oct 2008 13:03:59 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Where from here?
> 	- I will merge yesterday's work again as is?

Yes.

> 	- I will ask our OM developers to use a different style in the commit
> message (even if this is not mandated) to not use braces but colons. And
> yes I think I asked them to use [] as I'm used to this from various other
> projects, I will ask them to change and change it myself.

Sounds good. Again, my take on this is: These policies are guidelines, not 
strict requirements. If we decide otherwise, we need to have restrictive 
commit hooks or switch over to a completely different model of working 
together.

-- 
:M:


