Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M3iDU-0003n0-KK
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 04:59:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6CB794AA18B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 22:53:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05490-06 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 11 May 2009 22:53:05 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 49A9B498083
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 22:53:05 -0400 (EDT)
Date: Mon, 11 May 2009 22:53:05 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0905112249550.6446@juice.ott.cti.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
	<c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Tue, 12 May 2009 02:59:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 7 May 2009, Leon Woestenberg wrote:

> I think we can agree that we do not install GRUB by and on the target itself.
> 
> Proposal: add a new package "grub-install" that contains
> "grub-install" and the {libdir} stuff.

Coming right up...

Mike


