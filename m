Received: from mail-vw0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1ywf-0002qy-5p
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 13:08:29 +0200
Received: by vwm42 with SMTP id 42so1024895vwm.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TwVFh+HESdX4XXL5Oujv47Rj46zGQbt7oYq/9BFBzI0=;
	b=COag0x9s4i9neJR6rrZsT4Fe+0QmbRyebGnKEZvy7bNvPYFRMKRaUwl12V7NafI+HM
	0azF1WUGeJ156cO0YGy6ej8G9a0esRKi7qjNeaxZGT4mjEb3pzBJIaue3HJ4EWELPaHd
	10TBxWBX1Q5B51yDmLzrEOahFHG/eE1Grw4/c=
MIME-Version: 1.0
Received: by 10.52.94.6 with SMTP id cy6mr2012086vdb.153.1315566204059; Fri,
	09 Sep 2011 04:03:24 -0700 (PDT)
Received: by 10.52.167.72 with HTTP; Fri, 9 Sep 2011 04:03:24 -0700 (PDT)
In-Reply-To: <20110909065128.GA4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
	<20110909065128.GA4124@jama.jama.net>
Date: Fri, 9 Sep 2011 12:03:24 +0100
Message-ID: <CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 11:08:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I see what happens now.

Ok, someone has committed the right
changes, could you please delete or
mark my patches invalid:
http://patches.openembedded.org/patch/11247/
http://patches.openembedded.org/patch/11245/
http://patches.openembedded.org/patch/11219/
http://patches.openembedded.org/patch/11217/

Regards,
-- 
Ilya


