Received: from [217.19.16.145] (helo=smeagol.cambrium.nl ident=qmailr)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jelledejong@powercraft.nl>) id 1JTk8a-0008B9-NH
	for openembedded-devel@openembedded.org; Mon, 25 Feb 2008 21:41:31 +0100
Received: (qmail 24799 invoked from network); 25 Feb 2008 20:40:54 -0000
Received: from unknown (HELO ashley.powercraft.nl) (84.245.7.46)
	by smeagol.cambrium.nl with SMTP; 25 Feb 2008 20:40:54 -0000
Received-SPF: none (smeagol.cambrium.nl: domain of jelledejong@powercraft.nl
	does not designate permitted sender hosts)
Received: by ashley.powercraft.nl (Postfix, from userid 108)
	id BD84C1C771; Mon, 25 Feb 2008 21:40:54 +0100 (CET)
Received: from [192.168.1.70] (ashley.powercraft.nl [84.245.7.46])
	by ashley.powercraft.nl (Postfix) with ESMTP id A21D81C4F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2008 21:40:54 +0100 (CET)
Message-ID: <47C327D6.6000107@powercraft.nl>
Date: Mon, 25 Feb 2008 21:40:54 +0100
From: Jelle de Jong <jelledejong@powercraft.nl>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47C313E7.4080202@gmail.com>
In-Reply-To: <47C313E7.4080202@gmail.com>
X-Enigmail-Version: 0.95.6
X-SA-Exim-Connect-IP: 217.19.16.145
X-SA-Exim-Mail-From: jelledejong@powercraft.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Google Summer of Code
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2008 20:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jacob Thebault-Spieker wrote:
> I'm a first year Computer Science major interested in participating in 
> Google Summer of Code. What's the process for doing this in OE? Is there 
> a process? Who should I talk to about mentoring? Are there any projects 
> that I could do? I'm relatively familiar with OE, specifically Angstrom, 
> as I have a two Zaurii, a C3200 and an SL-5500.
> 
> I don't know of anything specific about OE that's not fully functional, 
> although, one project I was thinking about was a GUI video player, as a 
> frontend for mplayer. This would incorporate the accelerated video that 
> some of the Zaurii have, and would be full screen. Ideally, it'd be able 
> to recognize that the screen is flipped, and potentially still allow for 
> landscape mode(where the zaurus would be in vertical position, but the 
> video would play in landscape/widescreen mode).
> 
> This is just a preliminary idea, I don't know how feasible it actually 
> is. Thanks

Hi Jacob,

Just to go a little further on your idea..

Why don't create a UMPC usable mobile player. You can use existing 
technology's and software.

I am wishing for somebody to fix totem to only use gtk libs and 
gstreamer libs, and to improve to gui a bit to render better on smaller 
screens.

Al the building blocks are there it would be great for the complete 
community if you can fix these issues and create a nice and molecular 
base platform that use totem and gstreamer.

Kind regards,

Jelle de Jong


