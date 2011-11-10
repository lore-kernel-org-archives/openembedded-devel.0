Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1ROWDj-0004LZ-TG
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 16:07:16 +0100
Received: (qmail 13974 invoked by uid 1003); 10 Nov 2011 15:00:53 -0000
Received: from unknown (HELO ?192.168.1.111?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Nov 2011 15:00:53 -0000
Message-ID: <4EBBE725.8000107@balister.org>
Date: Thu, 10 Nov 2011 10:00:53 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EBBE67F.20300@freyther.de>
In-Reply-To: <4EBBE67F.20300@freyther.de>
X-Enigmail-Version: 1.1.2
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Thu, 10 Nov 2011 15:07:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/10/2011 09:58 AM, Holger Freyther wrote:
> Hi all, sysadmins,
> 
> could someone create a meta-telephony repository for me? In this repository I
> would like to maintain OpenBSC, osmocomBB, TETRA, mISDN, LCR, Asterisk (and
> probably more in the future).

What about OpenBTS also :) And what about the libraries needed to build
these? It would be good to minimize layer inter-dependencies.

Philip

> 
> cheers
> 	holger
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


