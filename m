Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nd1Vk-0003Rt-7y
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 14:12:47 +0100
Received: (qmail 9375 invoked by uid 1003); 4 Feb 2010 13:10:14 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 4 Feb 2010 13:10:14 -0000
Message-ID: <4B6AC734.4090807@balister.org>
Date: Thu, 04 Feb 2010 08:10:12 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>	<4B699C5A.70909@dresearch.de>	<20100203162120.GB26844@xora-build.xora.org.uk>
	<4B6AC59A.90000@dresearch.de>
In-Reply-To: <4B6AC59A.90000@dresearch.de>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 13:12:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2010 08:03 AM, Steffen Sledz wrote:
> Graeme Gregory wrote:
>>>> Since today i see a similar problem when doing a clean bitbake of
>>>> glib-2.0. It seems to be a problem with automake/automake. :(
>>>
>>> I think i've identified this patch as cause of the problems.
>>>
>>>    commit b1caa21ab2590689f3b6ff68483803701c12d721
>>>    Author: Graeme Gregory<dp@xora.org.uk>
>>>    Date:   Tue Jan 26 12:02:08 2010 +0000
>>>
>> Guys there is zero point sending me emails direct if you dont actually
>> tell me any information.
>
> Sorry about that. But i wasn't sure if you read the ml daily. So i put
> you on the Cc.
>
> BTW, i would call the hint, that your commit broke[1] the baking of at
> least glib-2.0 (which isn't that exotic) an 'information'.
>
> [1] I've rechecked this again with angstrom distro and hipox,
> beagleboard, and x86 machine making a clean build of glib-2.0:
>
>    rm -rf tmp.5
>    bitbake glib-2.0

glib-2.0 is building for me. Do you have an error log?

Philip


