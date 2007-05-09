Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Hljtg-0005MK-Hq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 12:59:52 +0200
Received: by py-out-1112.google.com with SMTP id n39so110112pyh
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2007 03:59:19 -0700 (PDT)
Received: by 10.65.206.7 with SMTP id i7mr783876qbq.1178708359145;
	Wed, 09 May 2007 03:59:19 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 38sm38546406nza.2007.05.09.03.59.18;
	Wed, 09 May 2007 03:59:18 -0700 (PDT)
Message-ID: <4641A902.6020506@gmail.com>
Date: Wed, 09 May 2007 05:57:06 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <464130FC.7030008@gmail.com>
	<02827798.20070509123821@gmail.com>	<4641A311.4030907@klever.net>
	<4641A5A2.8050108@dominion.kabel.utwente.nl>
In-Reply-To: <4641A5A2.8050108@dominion.kabel.utwente.nl>
Subject: Re: QA for intentionally unpackaged files
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
X-List-Received-Date: Wed, 09 May 2007 10:59:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Or we could patch package.bbclass[1] to do:
>
> PACKAGES += "${PN}-leftovers"
> FILES_${PN}-leftovers = "/"
>
> I'm not sure if that works, but if it does, we would be able to spot leftovers more easily
> by looking at deploy.

Again, how do you know which one is "intentionally" left-over vs. which 
one is not?

Gordon



