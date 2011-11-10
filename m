Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1ROXKG-0006Lv-4J
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:18:04 +0100
Received: (qmail 30124 invoked by uid 1003); 10 Nov 2011 16:11:46 -0000
Received: from unknown (HELO ?192.168.1.111?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Nov 2011 16:11:46 -0000
Message-ID: <4EBBF7C1.4030809@balister.org>
Date: Thu, 10 Nov 2011 11:11:45 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EBBF280.30301@freyther.de>
In-Reply-To: <4EBBF280.30301@freyther.de>
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
X-List-Received-Date: Thu, 10 Nov 2011 16:18:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/10/2011 10:49 AM, Holger Freyther wrote:
> Hi all, sysadmins,
> 
> could someone create a meta-telephony repository for me? In this repository I
> would like to maintain OpenBSC, osmocomBB, TETRA, mISDN, LCR, Asterisk (and
> probably more in the future).

Another thouht, rather than add another layer, wouldn't it make sense to
add a recipes-telephony directory to the existing
meta-openembedded/meta-oe directory?

Philip


