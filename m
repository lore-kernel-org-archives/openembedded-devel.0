Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBSUw-0000KX-OB
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:22:03 +0100
Received: (qmail 22310 invoked by uid 1003); 20 Nov 2009 12:20:32 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Nov 2009 12:20:32 -0000
Message-ID: <4B06898F.1090408@balister.org>
Date: Fri, 20 Nov 2009 07:20:31 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B067785.50600@SSpaeth.de> <he5vbj$enr$1@ger.gmane.org>
In-Reply-To: <he5vbj$enr$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [Fwd: [Shr-Devel] [PATCH] ILLUME_CONFIG is now also set by a variable]
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
X-List-Received-Date: Fri, 20 Nov 2009 12:22:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2009 06:42 AM, Koen Kooi wrote:
> On 20-11-09 12:03, Sebastian Spaeth wrote:
>> See attached patch. We'd love to replace the default illume config with
>> our distro-specific version, so this will make the config RDEPENDS
>> overridable from our distro conf. Is such a change acceptable for OE?
>
> The change looks file, but the Author field is wrong (people have last
> names, unless you're called Wookie) and the commit message isn't to OE
> standards either.

Is Wookie his first name or last name?

Philip

> In the future fix up both before committing. It can get tedious, I know,
> I do it for my coworkers as well :)
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


