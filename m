Received: from [194.158.229.47] (helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1N8j3W-000774-G6
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 00:26:25 +0100
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	nACNP55O019293; Fri, 13 Nov 2009 00:25:05 +0100
Message-ID: <4AFC99C2.4090201@vollmann.ch>
Date: Fri, 13 Nov 2009 00:26:58 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258014540.6879.18.camel@opal>
In-Reply-To: <1258014540.6879.18.camel@opal>
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of the 'Splitting the tree' session
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
X-List-Received-Date: Thu, 12 Nov 2009 23:26:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/09 09:29, Michael 'Mickey' Lauer wrote:

> base (10% underlying recipes)
> toolchain
> x11
> framebuffer
> gtk (includes gnome apps)
> qte (includes opie and kde)
> efl

There are quite a number of packages that could be built for
X11, framebuffer or qte.  I'd propose a separate directory
for that.
And of course something like 'other'.
And I'd actively discourage to have much more, as then the
problem that a package belongs to more than one category
grows, which counteract the goal to make it aesier to find
things.

   Detlef



