Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1InMtv-00029Z-NK
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2007 00:23:07 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 97D2B451C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 19:03:42 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 31 Oct 2007 19:03:42 -0400
X-Sasl-enc: +IJz+uDqF9ZdJktdks+gYeyccbHSj55E2W+yk4TWZJbZ 1193871822
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id B43AE23A5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 19:03:41 -0400 (EDT)
Message-ID: <472909CA.2090303@whitby.id.au>
Date: Thu, 01 Nov 2007 09:33:38 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.6 (Windows/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4727C038.10002@gmx.net>
	<f96d234e0710311001p6d8c205fp6ecf8829bd8edf6c@mail.gmail.com>
In-Reply-To: <f96d234e0710311001p6d8c205fp6ecf8829bd8edf6c@mail.gmail.com>
Subject: Re: I want your autobuilder scripts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2007 23:23:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On 10/30/07, Robert Schuster <theBohemian@gmx.net> wrote:
>> Hi,
>> at OEDEM it was my impression that several of you have working
>> autobuilder setups for OpenEmbedded. Can I get the scripts that make
>> that possible from somewhere?
> 
> The build setup I use is:
> https://dev.bec-systems.com/svn/oe/build
> 
> It is loosely based off the openmoko makefile (mostly just
> documentation), and with a directory setup that allows me to build for
> multiple machines, distros, OE trees, etc.

The MokoMakefile[1] and the nslu2-linux Master Makefile[2] are what I
use.  Of course, using either of these will put you in the bad books of
the OE elite  ;-)

[1]: http://svn.nslu2-linux.org/svnroot/mokomakefile/trunk/Makefile
[2]: http://www.nslu2-linux.org/Makefile

-- Rod


