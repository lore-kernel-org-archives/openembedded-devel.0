Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Ikd7i-0003Uw-T4
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2007 12:06:03 +0200
Received: by py-out-1112.google.com with SMTP id a25so666pyi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 02:58:47 -0700 (PDT)
Received: by 10.64.193.2 with SMTP id q2mr938703qbf.1193219926649;
	Wed, 24 Oct 2007 02:58:46 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id m1sm679281nzf.2007.10.24.02.58.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2007 02:58:46 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Wed, 24 Oct 2007 04:58:44 -0500
Date: Wed, 24 Oct 2007 04:58:44 -0500
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071024095844.GA9952@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: [doc] defining OpenEmbedded
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
X-List-Received-Date: Wed, 24 Oct 2007 10:06:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Getting started is coming along nicely.

I am strugging with the way open embedded uses to terms.
local.conf
metadata

In the first case, the term local.conf implies a configuration file
that makes a program work correctly on a local machine.  OE uses the
file local.conf to define the top level build parameters for a bitbake
build.  That is pretty confusing.  It would be more clear if
local.conf was called build.conf.

In the second case referring to OE as a collection of metadata is
confusing.  Metadata is data about the data.  OE is actually a
collection of patches, task lists, and configuration files.  I was
wondering if it would be more clear to refer to oe as either a ruleset
or task lists.

It seems like the term local.cconf and metadata may have outgrown
their original usage as OE became more advanced.

Thanks
David Farning


