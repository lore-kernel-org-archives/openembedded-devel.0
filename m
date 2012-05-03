Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPjhB-0004nC-3N
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 02:14:57 +0200
Received: by lbol5 with SMTP id l5so719902lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/hnFTsJONA1Es5iFMxN76khCcF9q0qL3hrmCR/3YFiM=;
	b=YyrtEEzt1cbNYjJgBo7Xou5/yVoP9CdO26a/J8c87i7sTFIYlOGRHGw/sqDJE0X6s0
	MrWico+0Veyo/JYYPlBtNeLk4aAaN9yFoSR6x1C9zBV5PAIpP+uQVnS7CARubP5vOquc
	zLOkPy6C7Ik+BnMk1szIgltWzaI9MvSVxBCinly6M69YECsSDHJqpOP0jiaMYNDrlFN8
	61Oc2mt71ZPJ8S6uY1WgN2IOsXLaIZsu+F0WmzjdNuc/MZkuI4h6IwXFdUC8LWdGXSV6
	dBJZsHG4xISdO0tq5I0zLNe1h6czmKqe+vphxJfG6MwW5kRoLcrxNds6PIt9fhTI2f8j
	OJ+w==
Received: by 10.152.111.198 with SMTP id ik6mr69523lab.38.1336003512316; Wed,
	02 May 2012 17:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 2 May 2012 17:04:42 -0700 (PDT)
In-Reply-To: <20120502221055.GB4581@denix.org>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
	<20120502182913.GA4658@jama.jama.net> <4FA1A48A.2040605@gmail.com>
	<20120502221055.GB4581@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 May 2012 17:04:42 -0700
Message-ID: <CAMKF1so1Qi3D==OqBFjLo6AEaJR6318NdJs7vVuqYb=T=c-xHQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Thu, 03 May 2012 00:14:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 2, 2012 at 3:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> good and as Koen is nodding I assume angstrom is fine too. So I think
>> we should drop the layer from master.
>
> Yes, but not immediately - give one or two week notice, please :) Actually,
> this should be considered as a notice and the actual commit to remove should
> be executed later, if nobody says otherwise... Basically, sending an RFC patch
> for review that deletes gcc-4.5 and waiting few days should do it.

OK consider that as notice then


