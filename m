Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GYKfp-0004qA-J3 for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 12:53:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 91FE7D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:47:26 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 09980-07 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:47:22 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 92E14D3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 12:47:22 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <452B5D2B.3000806@dominion.kabel.utwente.nl>
References: <452B5D2B.3000806@dominion.kabel.utwente.nl>
Organization: VanilleMedia
Date: Fri, 13 Oct 2006 12:47:22 +0200
Message-Id: <1160736442.21755.89.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [RFC] removing pre-modular X from .dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 10:53:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> A number of users have been seeing problems with their builds due to mixing pre-modular X
> stuff with Xorg 7.x stuff. I want to propose the following:
> 
>   'Remove all pre-modular X servers, libraries, proto's and extentsions from .dev'

That's a good proposal. It is very inconevient to our users having to
choose between so many possible ways to end up with non-building stuff.
We have a branch where pre-modular Xorg builds fine and we have an SCM
for a reason.

Yank it!

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




