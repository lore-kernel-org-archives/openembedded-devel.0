Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IpsZZ-0007q1-8y
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2007 22:36:30 +0100
Received: by wx-out-0506.google.com with SMTP id h27so2249994wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2007 13:35:34 -0800 (PST)
Received: by 10.101.67.11 with SMTP id u11mr11469939ank.1194465529779;
	Wed, 07 Nov 2007 11:58:49 -0800 (PST)
Received: from lenovo ( [68.187.118.242])
	by mx.google.com with ESMTPS id b45sm6646031hsa.2007.11.07.11.58.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Nov 2007 11:58:48 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Wed, 07 Nov 2007 13:58:46 -0600
Date: Wed, 7 Nov 2007 13:58:45 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071107195845.GA1583@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: naming tasks
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
X-List-Received-Date: Wed, 07 Nov 2007 21:36:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Still working on the manual!

I've come across a question on how tasks are named.  What is the
purpose of the prefix patch in the def patch_do_patch found in
the patch class?  Most task seems to be called do_taskname.
I am thinking that it has something to do with
scope but I am unsure.

addtask refers to do_patch and
EXPORT_FUNCTIONS refers to do_patch

Thanks
David


