Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1HyHMN-0003tN-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2007 03:09:19 +0200
Received: by wx-out-0506.google.com with SMTP id h29so35184wxd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2007 18:06:20 -0700 (PDT)
Received: by 10.90.50.1 with SMTP id x1mr25504agx.1181696780508;
	Tue, 12 Jun 2007 18:06:20 -0700 (PDT)
Received: by 10.90.68.14 with HTTP; Tue, 12 Jun 2007 18:06:20 -0700 (PDT)
Message-ID: <a7f8874a0706121806r5e5bc00bte17b6e593ec2d52d@mail.gmail.com>
Date: Tue, 12 Jun 2007 18:06:20 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: sourceforge SVN change
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
X-List-Received-Date: Wed, 13 Jun 2007 01:09:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

It looks like sourceforge is changing the svn urls. Are we using the new
scheme or do we need to check the metadata and update accordingly?


-------------------------------quote
start---------------------------------------------

Legacy Subversion Access Method Going Away
------------------------------------------

Back in November of 2006, we added a new preferred access method for our
Subversion offering that solved most of the spurious error messages and
other problems with our initial SVN rollout.  The change introduced a
new URL scheme:

https://PROJECTNAME.svn.sourceforge.net/svnroot/PROJECTNAME<https://projectname.svn.sourceforge.net/svnroot/PROJECTNAME>

Users have been receiving the notice to upgrade via a Site Status
announcement and as needed via Support Request when problems were reported.

As a part of our ongoing infrastructure improvements to our Subversion
offering and other services, we will be decommissioning the legacy
access method (the one without the PROJECTNAME prefix for the hostname)
as of June 28.  Past that time, Subversion operations that use the old
URL scheme will no longer work.  You may change over any existing
Subversion checkouts you have by following the instructions detailed here:

https://sourceforge.net/docs/E09#notice



-------------------------------quote
end---------------------------------------------

