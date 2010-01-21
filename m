Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NXzC3-0007YB-JN
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 16:43:46 +0100
Received: (qmail 9328 invoked by uid 1003); 21 Jan 2010 15:41:15 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Jan 2010 15:41:15 -0000
Message-ID: <4B587599.3030606@balister.org>
Date: Thu, 21 Jan 2010 10:41:13 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W59B276E6FE9342A67201CD8630@phx.gbl>
	<d1b08f941001210718u47fec267g35eefd9c9c0c33af@mail.gmail.com>
In-Reply-To: <d1b08f941001210718u47fec267g35eefd9c9c0c33af@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: problem in building console-iamge
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
X-List-Received-Date: Thu, 21 Jan 2010 15:43:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2010 10:18 AM, Andrea Adami wrote:
>>> BBFILES = "/oe/org.openembedded.dev/packages/*/*.bb  /oe/ossie_collection/packages/*/*.bb"
> This seems wrong
>
>>> NOTE: Handling BitBake files: \ (0014/0014) [100 %]
> In fact you get just 14 items...
>
> Dunno about ossie, but in openembedded we moved from 'packages' to 'recipes'.

Urg, good point, I need to fix that web page :)

Philip

>
> Regards
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


