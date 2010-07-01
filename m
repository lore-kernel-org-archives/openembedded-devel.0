Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OUIc6-00021w-6M
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 14:11:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 70F28A5670
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:06:46 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id C2VrPCuYgmMF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:06:46 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id DAEFFA566E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:06:45 +0100 (BST)
Date: Thu, 1 Jul 2010 13:07:24 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100701130724.25b3c926@xora-desktop.xora.org.uk>
In-Reply-To: <AANLkTimkcS9sUwgwykKcksbWMJvo1jolGpB-oaznT2bg@mail.gmail.com>
References: <4C0F9119.3000909@freyther.de> <4C2B1BC4.2030808@freyther.de>
	<i0f8ct$acp$1@dough.gmane.org> <4C2B446A.5040301@freyther.de>
	<i0hl7b$8uu$1@dough.gmane.org>
	<AANLkTimkcS9sUwgwykKcksbWMJvo1jolGpB-oaznT2bg@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Jul 2010 12:11:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Jul 2010 13:52:26 +0200
Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> Net effect: either older versions are not updated, or the versions are
> updated but not tested. In both cases IMHO quality-wise a less
> desirable situation.
> 
> Then again, I tried to fight the version diarrhea, and I lost.So be
> it. But don't come and ask me to improve the quality of recipes that
> IMHO should have been discarded long time ago.
> 
Aaaaargh how many times do I have to say this, removing a recipe just
because it is old is not acceptable to me. Removing a recipe because
its discovered old versions are broken and no DISTRO is interested in
that old version is perfectly acceptable (as long as a strong
maintainer is kept in the loop if exists).

Graeme


