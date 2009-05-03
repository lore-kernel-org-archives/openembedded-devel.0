Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1M0ey1-0005fK-3Q
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 18:55:05 +0200
Received: from [192.168.1.114] (95-90-225-217-dynip.superkabel.de
	[95.90.225.217])
	by dd20204.kasserver.com (Postfix) with ESMTP id 55CD5180F7BAD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 May 2009 18:49:27 +0200 (CEST)
Message-ID: <49FDCB08.4010803@opensimpad.org>
Date: Sun, 03 May 2009 18:49:12 +0200
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>	<49FD9A75.3000609@balister.org>
	<49FD9EEA.4030608@dls.net>
	<ac9c93b10905030918t25211118yc27bb1177f1e65cb@mail.gmail.com>
In-Reply-To: <ac9c93b10905030918t25211118yc27bb1177f1e65cb@mail.gmail.com>
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Sun, 03 May 2009 16:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> I do agree that PR = "r0" in a recipe should be ok. (actually I think
> that unaware of this I violated that rule a number of times :-) )
>
>   
I like PR = "r0"
Else it is easy to forget to bump it on updates. The manual also mention 
it [1].

best regards
Bernhard Guillon

1 http://docs.openembedded.org/usermanual/usermanual.html#recipes_versioning


