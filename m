Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pi2rJ-0003aA-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:44:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 2C669A4EB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:43:31 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 5B7BmiyRqqOk
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:43:30 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 6AAD6A4EAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:43:30 +0000 (GMT)
Message-ID: <4D3FFB03.9010206@xora.org.uk>
Date: Wed, 26 Jan 2011 10:44:19 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110126102308.GA29416@excalibur.local>
In-Reply-To: <20110126102308.GA29416@excalibur.local>
X-Enigmail-Version: 1.1.1
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Wed, 26 Jan 2011 10:44:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26/01/2011 10:23, Stefan Schmidt wrote:
> Hello.
>
> During last OEDEM we set out a timeline for quarterly releases. The first one
> hit on time in december 2010 (Thanks Khem).
>
> The next one would be scheduled for 2011-03. As our plans towards oe-core are
> getting into shape I wonder if and how these both are going to conflict.
>
> Will we go ahead and make the 2011-03 release, maybe the last one before moving
> over to oe-core? Personally I don't think these two block each other. Syncing
> would be needed, but people will keep working on the OE repo for a bit longer
> anyway I would think.
>
> If we are going to scratch the release what would be the next target for it?
> Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
> for this in time, including yocto movs to it and we base the rest of OE on top
> of it. Am I wrong here and that is the actual plan?
>
>
My opinion is 2010-03 should be the last release on the old source tree.
Releases after this should be on the new oe-core layer system. I don't
think we should scrap the release as its going to take some time to kick
oe-core into shape and finish the poky merge. Then there is work on
meta-openembedded and meta-distro to do on top of that.

Graeme




