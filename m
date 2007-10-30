Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1ImhLj-0001sa-94
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 04:01:03 +0100
Received: by an-out-0708.google.com with SMTP id c31so245042ana
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2007 20:01:00 -0700 (PDT)
Received: by 10.101.69.10 with SMTP id w10mr2144293ank.1193712857888;
	Mon, 29 Oct 2007 19:54:17 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id 23sm4978569nzn.2007.10.29.19.54.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2007 19:54:17 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Mon, 29 Oct 2007 21:54:14 -0500
Date: Mon, 29 Oct 2007 21:54:14 -0500
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071030025414.GA6660@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: [doc] OE the language?
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
X-List-Received-Date: Tue, 30 Oct 2007 03:01:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I was wondering if you would be interested in creating a formal language
to represent the data in bitbake files.

By splitting off bitbake you have already made a automatic
distribution development tool.  (think compiler)

What is now OpenEmbedded can be split in to 1. OE the language which
can be precisely defined in terms of syntax, and symantics, and
standard libaries.(bbclasses) and 2. OE data. (recipes)  This
separation would allow more abstraction between how recipies are
written and what the recipies do.  This separation would also allow
the language and standard libaries (api) to stablize into releases while the
data remains flexible.

The new language, which I am calling the distribution description language, 
would describe the datafiles (.bb) which are parsed by bitbake.

Thanks
David Farning


