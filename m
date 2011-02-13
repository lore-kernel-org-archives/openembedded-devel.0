Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PojfE-0003au-H6
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 22:39:32 +0100
Received: (qmail 9575 invoked by uid 1003); 13 Feb 2011 21:38:14 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Feb 2011 21:38:14 -0000
Message-ID: <4D584F40.80009@balister.org>
Date: Sun, 13 Feb 2011 16:38:08 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ij8d1t$cd9$1@dough.gmane.org>
In-Reply-To: <ij8d1t$cd9$1@dough.gmane.org>
Subject: Re: TSC agenda items for the next meeting
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
X-List-Received-Date: Sun, 13 Feb 2011 21:39:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2011 05:50 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> The new TSC is holding a meeting next week and we wanted to see if
> anyone wants to suggest items we put in the agenda for the meeting.
>
> If you have such items, please let us know by replying to this mail.

I'd like to see definitive guidelines for creating board support 
packages. This should address:

1) Where to define toolchains and versions.
2) How to create kernel bb files. (Per board, or per kernel version)
3) Same for u-boot, how to pin u-boot versions for BSP's.

Basically, we should identify all the BSP's issues that create 
discussions on the list and work out a best practices document so we can 
have more consistency.

A similar set of guidelines defining what a a distro's responsibility 
would also be good.

Philip


