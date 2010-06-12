Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1ONPG5-0005LZ-Cr
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 13:52:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 59F85A525C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 12:47:53 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 3uzxLGZyl-SD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 12:47:51 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id AC3A6A525B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 12:47:51 +0100 (BST)
Date: Sat, 12 Jun 2010 12:47:48 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100612124748.03c3f00e@xora-desktop.xora.org.uk>
In-Reply-To: <AANLkTile7PE4T0U7yeW73jGm2nlpMrAg4Dn4bqmyClbF@mail.gmail.com>
References: <4C0F9119.3000909@freyther.de>
	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
	<hutv9r$ekh$1@dough.gmane.org> <1276292268.29314.2660.camel@rex>
	<AANLkTile7PE4T0U7yeW73jGm2nlpMrAg4Dn4bqmyClbF@mail.gmail.com>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Sat, 12 Jun 2010 11:52:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Jun 2010 13:12:18 +0200
Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> If people pick up actions (like removing old minor versions of
> recipes, someone will complain that they are touching other peoples'
> recipes without consent, RFC or whatever.
> It would be nice if  owners/maintainers of recipes would start to
> implement the policies as outlined  by the TSC, instead of bashing
> others. But no, instead of having 8 abiword recies (when I tables this
> issue) we now have 10.

This is one of the issues we still have in our way of thinking, you see
having 10 recipes as a huge issue that has to be fixed. Some of us
don't see any need to delete recipes that are not broken. I would
expect (as one of the abiword maintainers) if I went in and do some
major change to packaging and couldnt be bothered to backport it I
would delete some of those recipes.

G


