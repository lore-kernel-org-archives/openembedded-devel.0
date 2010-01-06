Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NSYk4-0004ad-9w
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 17:28:19 +0100
Received: (qmail 24146 invoked by uid 1003); 6 Jan 2010 16:26:09 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 6 Jan 2010 16:26:09 -0000
Message-ID: <4B44B99F.9050508@balister.org>
Date: Wed, 06 Jan 2010 11:26:07 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W279A13B86B227AAF2D8080D8720@phx.gbl>
In-Reply-To: <BAY127-W279A13B86B227AAF2D8080D8720@phx.gbl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem using output of console-image
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
X-List-Received-Date: Wed, 06 Jan 2010 16:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2010 10:25 AM, saleh usman wrote:
>
> Hi
> I've built console-image for omap5912osk machine but I am facing problem in using output.There are four folders named all, armv5te, i686, omap5912osk in /temp/deploy/glibc/ipk.and so many ipk files in these folders.
> Which files exactly I should use to run the output on my target platform and how to run these files.
> Wheather to install these files, any other package  or directly run them just by typing their names.
> Since
> linux is running on ARM9 GPP of machine ,should I take care of u-boot, kernel version or
> anything else to run generated output on my target platform

The file console-image* in tmp/deploy/.../images/omap5912osk/ will have 
copies of the root file system in various formats. The directories you 
mention are in tmp/deploy/..../ipks.

Philip


>
> Saleh 		 	   		
> _________________________________________________________________
> Windows Live: Friends get your Flickr, Yelp, and Digg updates when they e-mail you.
> http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_3:092010
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


