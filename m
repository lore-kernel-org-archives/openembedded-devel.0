Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NF4Q0-0007Ej-6h
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 12:27:51 +0100
Received: (qmail 1624 invoked by uid 1003); 30 Nov 2009 11:26:13 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 30 Nov 2009 11:26:12 -0000
Message-ID: <4B13ABD4.7080604@balister.org>
Date: Mon, 30 Nov 2009 06:26:12 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <dc530dbf0911300212i2f8567c5leec880e91ec2ac84@mail.gmail.com>
In-Reply-To: <dc530dbf0911300212i2f8567c5leec880e91ec2ac84@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kubuntu and opemembedded
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
X-List-Received-Date: Mon, 30 Nov 2009 11:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2009 05:12 AM, fabio ferrario wrote:
> I'm pretty much a newby in using both bitbake and openembedded but thing is
> that I cannot get bitbake working my recipe out.
>
> I followed the 'official' guide
> http://wiki.openembedded.net/index.php/Getting_started and eventually, after
> sourcing the environment and adding bitbake to my path I see bitbake being
> called properly (bitbake --help for instance) I see the recipe being read
> (some fake statements are detected) but any time I try to bitbake something
> (bitbake nano, bitbake console-image..) I am bounched back with
>
> NO RULE TO MAKE TARGET whatever my target is..
>
> any hint?

Check BBPATH env var.

Philip

>
> Thanks
>
> Fabio
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


