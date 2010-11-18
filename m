Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1PJ2j1-0005M5-D8
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 12:32:23 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PJ2hv-0002Ya-3f
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 11:31:15 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PJ2hu-0006Jm-T2
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 11:31:14 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimnEoW_9i8T65WTsQsYXc2E2gcx+015o13cVsKF@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
	<AANLkTimnEoW_9i8T65WTsQsYXc2E2gcx+015o13cVsKF@mail.gmail.com>
Date: Thu, 18 Nov 2010 11:31:14 +0000
Message-ID: <1290079874.3183.222.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 11:32:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-11-18 at 21:31 +1030, Graham Gower wrote:
> So, why not just branch it already and apply the same commit policy as 
> the existing stable branch.

Essentially because nobody has yet volunteered to do the ongoing
maintenance work that would be involved in having a long-lived stable
branch.  And, if OE is going to have releases off master on a fairly
frequent schedule (I think the proposal is four releases per year or
thereabouts) then the requirement for such a branch is somewhat
diminished.

If you're interested in doing the work to maintain a new stable branch
along the same lines as stable/2009, and you can commit the time that is
required to make it work, then you are certainly very welcome to do so.
You don't need any particular permission to do this: you can (subject to
the Branching Policy) create a new branch at any time.

p.




