Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1MnZ3x-0005K9-4R
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 16:31:24 +0200
Received: from m440536d0.tmodns.net ([208.54.5.68] helo=[192.168.2.1])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1MnZ3R-0002G9-Eh
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 07:30:50 -0700
Message-ID: <4AAFA50B.7000007@symas.com>
Date: Tue, 15 Sep 2009 07:30:35 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090909 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.15.1253008803.14572.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.15.1253008803.14572.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 64.71.152.235
X-SA-Exim-Mail-From: hyc@symas.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-wpactrl
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
X-List-Received-Date: Tue, 15 Sep 2009 14:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

openembedded-devel-request@lists.openembedded.org wrote:

> Date: Tue, 15 Sep 2009 09:13:22 +0100
> From: Phil Blundell<philb@gnu.org>

> On Sun, 2009-09-13 at 18:59 -0700, Howard Chu wrote:
>> Here's a recipe file for the python-wpactrl module, which connects to
>> wpa_supplicant's control interface. It works for me...
>
> Thanks for the patch.
>
> Your bb file is named "python-wpactrl_1.0", which would suggest that
> this is for version 1.0 of the package.  But the SRC_URI seems to point
> to some random-looking svn revision.  Can you clarify what the
> versioning situation is with that?

I'll use the svn revision number. I used 1.0 because that's the version number 
present in the various files of the repository. It may take a while before I 
get to reposting this, have a lot of other things on my plate.

> The patch looks fine to me otherwise.

Thanks for the review.

-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/


