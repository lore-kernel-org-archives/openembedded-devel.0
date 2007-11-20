Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuRZC-0005ui-N0
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 12:46:58 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id E35244C8C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:44:49 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 20 Nov 2007 06:44:49 -0500
X-Sasl-enc: FOslNE/uolS9P87MZD9StSD+oiP9RN/RgaqKuC6hAPbB 1195559089
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 31709FCEA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:44:48 -0500 (EST)
Message-ID: <4742C89E.4070909@whitby.id.au>
Date: Tue, 20 Nov 2007 22:14:30 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
In-Reply-To: <4742217C.9060506@whitby.id.au>
X-Enigmail-Version: 0.95.5
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
X-List-Received-Date: Tue, 20 Nov 2007 11:46:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Koen Kooi wrote:
>> David Farning schreef:
>>> $make setup
>> nice
>>
>>> $make build-package-vim
>> $deity just killed a few hundred kittens.
>> At OEDEM we decided that we won't tolerate kindergarten-like,
>> hand-holding wrappers around bitbake. Typing 'bitbake vim' isn't rocket
>> science. To paraphrase Mickey: "If typing 'bitbake <foo>' is too hard,
>> you shouldn't be using OE".

The thing that I don't understand is that "bitbake <foo>" is eleven less
characters to type than "make build-package-<foo>", so the question we
should be asking is:

Why are people prepared to type ten extra characters every time they
want to build a package rather than using bitbake directly?

The answer to that question holds the key to the way forward on this issue.

Are the powers of persuasion of the various Makefile authors so great
that they can convince people to type more characters, even when the
documentation, wiki and tutorials provided by OE explicitly tell people
to use a command which involves typing less characters?

-- Rod


