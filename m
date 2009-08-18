Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdPQd-0001Jg-V5
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:12:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 34CD7540E69
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 09:55:43 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18144-03 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 18 Aug 2009 09:55:43 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 076BB540DCC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 09:55:43 -0400 (EDT)
Message-ID: <4A8AB2DE.7040801@cbnco.com>
Date: Tue, 18 Aug 2009 09:55:42 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>	<1250515743-10823-2-git-send-email-msmith@cbnco.com>	<200908171611.08535.holger+oe@freyther.de>
	<be7a9f3d0908180202t125e5c21tf77ed80c0ab07d22@mail.gmail.com>
In-Reply-To: <be7a9f3d0908180202t125e5c21tf77ed80c0ab07d22@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/3] mtools: don't install-info; fixes build on non-Debian hosts
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
X-List-Received-Date: Tue, 18 Aug 2009 14:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:

> Not bumping them can cause a change, that breaks something, to not be
> noticed for long time.
> 
> In my opinion we ought to _always_ bump PR when changing the recipe.
> This ensure it is widely tested and deployed.

OK, I think that's 2 for bumping PR and 1 for not, so I will bump it. I 
guess there is a website called youtube now, you can go watch it while 
glibc recompiles itself. :P

Mike


