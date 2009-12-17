Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NLI03-0006lE-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 16:10:46 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 9744BB94011
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2009 16:08:55 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NLHyJ-00050S-Gm for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 16:08:55 +0100
Date: Thu, 17 Dec 2009 16:08:55 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091217150855.GC32444@lundinova.se>
References: <1261060246-15099-1-git-send-email-johan.hovold@lundinova.se>
	<4B2A41C2.10802@balister.org>
MIME-Version: 1.0
In-Reply-To: <4B2A41C2.10802@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wxwidgets: add 2.9.0 and clean up recipes
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
X-List-Received-Date: Thu, 17 Dec 2009 15:10:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> >   recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb          |    5 ++
> >   recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb        |    7 +++
> >   recipes/wxwidgets/wxwidgets_2.9.0.bb               |    3 +
> >   recipes/wxwidgets/wxwidgets_2.9.0.inc              |   44 ++++++++++++++++++++
> 
> Shouldn't the include file be called wxwidgets-2.9.0.inc?

You tell me. :) Both variants occur under recipes but dash (-) as you
propose seem to be 2-3 times as common indeed. Shall I change it?

Thanks,
Johan



