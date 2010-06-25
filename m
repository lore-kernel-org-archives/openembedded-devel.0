Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OS8Dd-0008WF-DJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:41:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id B6357A5533
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 13:36:39 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id QBz5yggX58B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 13:36:37 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 9E4C6A5516
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 13:36:37 +0100 (BST)
Date: Fri, 25 Jun 2010 13:36:58 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100625133658.5f77ac1f@xora-desktop.xora.org.uk>
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
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
Subject: Re: recipes/mesa cleanup
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
X-List-Received-Date: Fri, 25 Jun 2010 12:41:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Jun 2010 14:19:34 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi,
> 
> i know the rules about removing old versions, but in this dir there
> were versions really old and I'm pretty sure they cant be even built
> with current OE (I tried in few cases and then refused to spend whole
> day just to confirm that some 6.0 version still builds after
> converting to new staging and cleanups..).
> 
> Please review/test.
> 
> FYI: all those patches are often rebased on top of oe.dev also here 
> http://gitorious.org/~jama/angstrom/jama-shr-experimental 
> if cherry-picking is more effective way for you to test
> 

Looks good to me, there is no problem with removing broken recipes.
Whole series

Acked-by: Graeme Gregory <dp@xora.org.uk>

G


