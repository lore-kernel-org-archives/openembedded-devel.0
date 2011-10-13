Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RE9OC-0001oO-LU
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 02:43:13 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 3DEDEE9D45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:37:28 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuEzAGwylk5T4zkNPGdsb2JhbAAMN4k8kCiMZIISAQEBATeCBQEBAQEDOEARCxgJFAIPCQMCAQIBMRQTCAEBwFqHWASTdZFW
X-IronPort-AV: E=Sophos;i="4.69,337,1315173600"; d="scan'208";a="130093811"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 13 Oct 2011 02:37:11 +0200
Message-ID: <4E9632B7.2010901@telia.com>
Date: Thu, 13 Oct 2011 02:37:11 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
In-Reply-To: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Thu, 13 Oct 2011 00:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-12 14:22, mgundes wrote:
>     Hi,
>
>     I think one of the big issue with OE is build time. It does everything
> for you, so that it takes too much times. I want to minimize build time and
> realized that OE creates ipkgs for almost every package. If there is a way
> to prevent creation of ipkgs it would be really good for me. In my opinion,
> it would be fine for other people too since usually rootfs directory is
> enough and ipkgs are not frequently used directly by developers.
>
>     I have asked in freenode oe room but friends said there no way to do that
> in OE system. If there is no way to do that in current OE, do you plan to
> add as a feature?
>
>     Thanks,
>
> Regards
>

Question: What do youj mean by long build time.
                 Building everything takes 1.5-2 hours.
                 Doing an incremental build is much less.

When I started, my laptop would take 42 hours to complete the build
(Calculated, I gave up way before), but then I got a decent machine.
If you consider 1.5 hours for the first build long, then you still have 
a problem

-- 
Best Regards
Ulf Samuelsson



