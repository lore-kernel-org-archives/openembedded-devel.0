Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LcF6E-0005Oz-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 09:26:39 +0100
Received: from [192.168.1.105] (e180139171.adsl.alicedsl.de [85.180.139.171])
	by drlauer-research.com (Postfix) with ESMTP id 726F7584146
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 09:47:35 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <go2tlk$akt$2@ger.gmane.org>
References: <49A4EAFC.3080806@dls.net>  <go2tlk$akt$2@ger.gmane.org>
Organization: Vanille-Media
Date: Wed, 25 Feb 2009 09:23:29 +0100
Message-Id: <1235550209.2621.28.camel@andromeda>
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
X-List-Received-Date: Wed, 25 Feb 2009 08:26:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 25.02.2009, 08:57 +0100 schrieb Koen Kooi:
> On 25-02-09 07:53, Mike (mwester) wrote:
> > fakeroot fails to build -- any idea how we can fix this?
> 
> By reverting the merge of the sane-defaults branch that got merged with 
> zero review

Ah right, I probably didn't wait long enough. Ok, I might as well revert
it and continue working in other branches. Is there a command to revert
merging a whole branch or do I need to call git-revert for every
revision?

Cheers,

-- 
:M:



