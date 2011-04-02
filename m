Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Q5wQ2-00041s-B9
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 10:42:54 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 781761D360AA; Sat,  2 Apr 2011 10:40:25 +0200 (CEST)
Date: Sat, 2 Apr 2011 10:40:25 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110402084025.GD2681@ibawizard.net>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-4-git-send-email-v2g.udel@gmail.com>
	<1301496042.11614.15.camel@localhost>
	<BA1E2EAB-64FF-47E0-AB46-407D19D68B6D@gmail.com>
MIME-Version: 1.0
In-Reply-To: <BA1E2EAB-64FF-47E0-AB46-407D19D68B6D@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 4/6] Add recipes for building TS75xx userspace	utilities
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
X-List-Received-Date: Sat, 02 Apr 2011 08:42:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sachin Kamboj <v2g.udel@gmail.com> [2011-03-30 12:55:35]:

> We'll discuss this with the vendor - however, can we include these tarballs
> in the interim?

Maybe, that you can skip the vendor part, make GitHub account, add all the
files in one project and make ts75xx-utils versioned package and recipe. I
don't see any point why it should be in separate recipe. It's possible to make
different packages from one recipe.

-- ynezz


