Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QRIyb-0005yB-CJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 09:02:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 5DF932C812
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 06:58:37 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Mgp4imY06Eu
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 06:58:33 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id DB3BA2C7D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 06:58:32 +0000 (UTC)
Message-ID: <4DE491DA.2000404@gmail.com>
Date: Tue, 31 May 2011 08:59:38 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DE352E5.7090604@gmail.com> <is0a7n$4j8$1@dough.gmane.org>
In-Reply-To: <is0a7n$4j8$1@dough.gmane.org>
Subject: Re: Error building qt4e-base-image with angstrom-2010.x
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
X-List-Received-Date: Tue, 31 May 2011 07:02:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto, Il 30/05/2011 16:39:
> On 30-05-11 10:18, Marco Cavallini wrote:
>> Hi,
>> I'm facing to a problem building qt4e-base-image with angstrom-2010.x on
>> a Debian lenny host, is it normal?
>> http://pastebin.com/6SnFSYs6
>> I suspect a Debian lenny issue with new OE stuff.
> 
> I just tried this on my debian box (dunno which version):
> 
> NOTE: package qt4-embedded-4.7.3-r33.1: task do_build: Succeeded


Which machine did you set?


BTW looks like I have a major problem with gcc 4.4 and armel - the ABI
of va_list changed (for c++ libraries)
I see the same error with 'micro' distro.
My machine is MACHINE ?= "ronetix-pm9263"


TIA
--
Marco



