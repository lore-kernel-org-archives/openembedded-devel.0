Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NNnF8-0002Me-12
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 13:56:41 +0100
Received: (qmail 19324 invoked by uid 1003); 24 Dec 2009 12:54:43 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 24 Dec 2009 12:54:43 -0000
Message-ID: <4B336493.9060706@balister.org>
Date: Thu, 24 Dec 2009 07:54:43 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u5fqn7fimn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5fqn7fimn1qzu@guohr-laptop-ubuntu>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: auto report bug onto bugzilla when building failure
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
X-List-Received-Date: Thu, 24 Dec 2009 12:56:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2009 04:15 AM, Guo Hongruan wrote:
> Hi guys?
> I found seppuku.bbclass and have some question about it.
>
> 1. Is it used to report building bug onto bugzilla automatically?
> 2. If so, anyone can give me some hint about how to use it?
> 3. will the bugzilla it reports automatically be related with
> http://tinderbox.openembedded.net/?

We found that automatically reporting things into bugzilla was not such 
a good idea. You end up with a lot of "bugs" that are user configuration 
issues that end up being hard to close without being arbitrary.

Philip


