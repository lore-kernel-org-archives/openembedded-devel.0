Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IkqYj-0001ui-N9
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2007 02:26:49 +0200
Received: by py-out-1112.google.com with SMTP id a25so518766pyi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 17:19:30 -0700 (PDT)
Received: by 10.64.210.3 with SMTP id i3mr2550552qbg.1193271570119;
	Wed, 24 Oct 2007 17:19:30 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id 36sm1276130nza.2007.10.24.17.19.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2007 17:19:29 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Wed, 24 Oct 2007 19:19:26 -0500
Date: Wed, 24 Oct 2007 19:19:26 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071025001926.GA14645@lenovo>
References: <471FC1C0.4010103@linux.it>
MIME-Version: 1.0
In-Reply-To: <471FC1C0.4010103@linux.it>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: getting started - docbook
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
X-List-Received-Date: Thu, 25 Oct 2007 00:26:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I'm writing few notes on a doc just for me, called "OE Journey",
> explaining what are basic steps in OE, basic tasks, dependencies graphs,
> few examples... now it's just 10 pages, can it be useful? Should I
> continue in this ooffice doc or can be more useful to others if I change
> format (eg. wiki)???
> 
> thank you,
>     phy
> 
> P.S. also writing a simple .dot-graphviz files manipulator to produce
> nice graph dependencies with base packages collapsed... (was trying
> patching bitbake, but then it's much more confortable an interactive way
> like I'm doing now, in php on my localhost)

It would be very helpful to me to see your personal journey.  The
dependancy graph stuff would be very helpful. This evening I was
manually tracing some dependancy graphs.

The biggest challange is deciding on the correct terminology.
I think that I will start creating a glossary so new users can look up
terms and experienced users can use 'approved term' consistently. (to
keep the new users from getting unnecessarily confused) A bitbake
file, a recipe, and a package all seem to be the same thing.  I didn't
realize that they were all the same thing until this afternoon.

Thanks
David Farning


