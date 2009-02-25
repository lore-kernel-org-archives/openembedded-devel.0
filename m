Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LcEpj-0006Lq-Tj
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 09:09:35 +0100
Received: from [192.168.1.105] (e180139171.adsl.alicedsl.de [85.180.139.171])
	by drlauer-research.com (Postfix) with ESMTP id 0262E584149
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 09:30:32 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49A4EAFC.3080806@dls.net>
References: <49A4EAFC.3080806@dls.net>
Organization: Vanille-Media
Date: Wed, 25 Feb 2009 09:06:27 +0100
Message-Id: <1235549187.2621.21.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: fakeroot fails to build
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
X-List-Received-Date: Wed, 25 Feb 2009 08:09:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 25.02.2009, 00:53 -0600 schrieb Mike (mwester):
> fakeroot fails to build -- any idea how we can fix this?

I'm afraid newer fakeroot versions need libtool2 and automake1.10. Can
you check whether these have been built?


-- 
:M:



