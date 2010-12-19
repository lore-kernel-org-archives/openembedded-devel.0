Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PURhN-0006Ee-GV
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Dec 2010 23:25:51 +0100
Received: (qmail 7263 invoked by uid 1003); 19 Dec 2010 22:25:43 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Dec 2010 22:25:43 -0000
Message-ID: <4D0E865D.8010002@balister.org>
Date: Sun, 19 Dec 2010 17:25:33 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
In-Reply-To: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
Subject: Re: python-inotify broken
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
X-List-Received-Date: Sun, 19 Dec 2010 22:25:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2010 05:18 PM, AJ ONeal wrote:
> python-inotify, (bearing no relation to pyinotify or python-inotifyx, btw)
> is broken.
> it compiles, but it doesn't work.
>
> Can someone else confirm?
> test case:
> https://github.com/coolaj86/python-examples/tree/master/inotify
>
> After a few events it just freezes.
>
> I've also informed the author.
>
> Generally speaking, is there much point in leaving a library in OE that
> gives false
> hope and then shatters dreams and crushes aspirations?

Now you know it is broken, you should fix. Better for people to have a 
place to start and not reinvent the wheel.

Deleting something just because it does not work is silly. Better to 
figure out why and fix it.

Philip


