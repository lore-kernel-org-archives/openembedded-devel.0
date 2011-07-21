Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjqKm-0005Ju-Kd for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 12:18:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LA5i7j031705;
	Thu, 21 Jul 2011 11:05:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30977-05; Thu, 21 Jul 2011 11:05:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LA5Z7Y031699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 21 Jul 2011 11:05:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAHQecY4g64igX0+=-Rsr==sDe+YmTKNhNhpk-7eKe069u2aP2A@mail.gmail.com>
References: <CAHQecY4g64igX0+=-Rsr==sDe+YmTKNhNhpk-7eKe069u2aP2A@mail.gmail.com>
Date: Thu, 21 Jul 2011 11:05:30 +0100
Message-ID: <1311242730.2344.76.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Tom King <ka6sox@gmail.com>
Subject: Re: git server
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
X-List-Received-Date: Thu, 21 Jul 2011 10:18:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 20:10 -0700, Tom King wrote:
> approximately 0400UTC the git server was migrated from the failing Melo
> instance to another instance on another machine while we continue to
> troubleshoot melo.

Fir reference the machine ssh keys changed as a result of this
triggering security warnings. 

Something is also wrong with the bitbake repository as I can no longer
access it:

$ git pull
fatal: 'repositories/bitbake.git' does not appear to be a git repository
fatal: The remote end hung up unexpectedly

Cheers,

Richard



