Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Ljcku-0005Xr-1L
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 18:07:37 +0100
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n2HH54d7009824
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 10:05:04 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 17 Mar 2009 17:06:19 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	17 Mar 2009 17:06:19 +0000
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090317163556.GK26343@smtp.west.cox.net>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
	<49BFC107.5050806@dls.net> <20090317163556.GK26343@smtp.west.cox.net>
Organization: Atmel
Date: Tue, 17 Mar 2009 17:06:19 +0000
Message-Id: <1237309579.20770.17.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: Shane.Dixon@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 17:08:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-03-17 at 09:35 -0700, Tom Rini wrote:

> 
> I'd like to add Ubuntu 8.10.  Further, for each of these reference host
> configurations we need to say what's installed, preferably by meta
> packages (in Ubuntu's case, say ubuntu-minimal + ubuntu-standard) and
> specific packages ('gcc', 'g++', etc..).  And I too can help with the
> env.  FWIW, a chroot should be good enough for this..
> 

8.04 might be a better target for a "reference machine" because it's an
LTS release (although I personally use 8.10).  I think that the goal
should be solid support for the longest (within reason of course) amount
of time.  If I intend to write a document for a vendor explaining how to
use OE as a build environment for their code, the intent should be that
I don't have to re-write it again and again over the course of the next
year (Ubuntu releases every 6 months).  

I think that one of the greatest reasons for a good solid branch is that
documentation can truly be reliable because we're not aiming at a moving
target.

-- 
Shane Dixon
Linux Engineer
Atmel Corporation
Office: 719.540.1123
E-mail: shane.dixon@atmel.com


