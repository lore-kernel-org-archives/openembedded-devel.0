Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuR3f-0001DF-Az
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 12:14:23 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 05B354CEFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:12:15 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 20 Nov 2007 06:12:15 -0500
X-Sasl-enc: 6ZevnNshev1LIeAXXxF84BfaMh2hLo6d8RC9UGcdy2jh 1195557134
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 3E132FCDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:12:13 -0500 (EST)
Message-ID: <4742C0FB.1010101@whitby.id.au>
Date: Tue, 20 Nov 2007 21:41:55 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>
	<4742AFCC.1060000@student.utwente.nl>
In-Reply-To: <4742AFCC.1060000@student.utwente.nl>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 11:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>> Show how you can use bitbake such that you can cd into a build area, and
>> type a *single* bitbake command to do a build, then cd into a different
>> build area (with a different distro and machine)
> 
> Why are you using a different build area for that? That's unnecessary.

Um, when the MokoMakefile was created, it *was* necessary to have a
different build area.  Direct your statements to the maintainers of the
distributions in question, not to those who are trying to help the
end-users use those build systems.

Isn't the creator of the OpenMoko build environment an OE core team
member?  Does the OpenMoko build environment setup documentation follow
your prescription for TMPDIR and multimachine?

Physician, heal thyself.

-- Rod


