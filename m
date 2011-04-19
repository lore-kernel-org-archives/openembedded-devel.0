Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QC93D-0004VS-QR
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:24:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A5B24315044D;
	Tue, 19 Apr 2011 13:22:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CPB2ZUMSyxET; Tue, 19 Apr 2011 13:22:33 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf9dc.pool.mediaWays.net
	[89.12.249.220])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 9BE38315044B;
	Tue, 19 Apr 2011 13:22:33 +0200 (CEST)
Message-ID: <4DAD7077.4020006@opendreambox.org>
Date: Tue, 19 Apr 2011 13:22:31 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110411 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: Stanislav Brabec <utx@penguin.cz>
References: <1302996184.3122.30.camel@utx.lan>
In-Reply-To: <1302996184.3122.30.camel@utx.lan>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 0/5] *.bbclass: search configs in D instead of S
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
X-List-Received-Date: Tue, 19 Apr 2011 11:24:59 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

On 04/17/2011 01:23 AM, Stanislav Brabec wrote:
> Following series of patches changes way how config files are populated.
> Searching for *-config and .pc config files in S makes more problems
> than it brings benefits. Searching in the installed root seems to be
> more logical.

The subject says 0/5, but only two patches appeared on the mailing list.

Regards,
Andreas


