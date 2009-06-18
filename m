Received: from [17.148.16.87] (helo=asmtpout012.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MH9VQ-0006VK-DT
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 06:45:44 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp012.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00K1B3EG6560@asmtp012.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 21:35:10 -0700 (PDT)
Message-id: <E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Robert Schuster <theBohemian@gmx.net>
In-reply-to: <4A396EBD.2010207@gmx.net>
Date: Thu, 18 Jun 2009 08:34:52 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Thu, 18 Jun 2009 04:45:44 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Robert,

On Jun 18, 2009, at 2:31 AM, Robert Schuster wrote:

> First thing to know is: What version of OE are you using? Is this the
> development branch (org.openembedded.dev)?

I was using the overo-oe repository

git clone git://gitorious.org/gumstix-oe/mainline.git  
org.openembedded.dev

After you email, I also checked the openembedded repository

git://git.openembedded.org/openembedded


> If so I am wondering why you are not seeing a recipe for jamvm-native
> 1.5.3. Such a recipe should be there and work just fine.

Both these repositories don't have a jamvm_1.5.3.bb recipe.

I am on the org.openembedded.dev branch.

Can you point me to a location where I can get the latest recipes for  
jamvm and classpath?

Best regards,

Elvis



