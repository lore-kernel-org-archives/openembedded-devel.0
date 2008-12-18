Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LDGPM-0005nF-Jv
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 11:47:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mBIAgLHM028468;
	Thu, 18 Dec 2008 10:42:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28384-02-2; Thu, 18 Dec 2008 10:42:13 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mBIAg4Oo028417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2008 10:42:04 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200812180155.31679.zecke@selfish.org>
References: <200812180155.31679.zecke@selfish.org>
Date: Thu, 18 Dec 2008 10:42:03 +0000
Message-Id: <1229596923.5390.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Bitbake: Switch to git?
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
X-List-Received-Date: Thu, 18 Dec 2008 10:47:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-12-18 at 01:55 +0100, Holger Freyther wrote:
> I think there is broad agreement on switching Bitbake over to git? Is there 
> any striking reason to not just create a bitbake repository on 
> git.openembedded.net and use git-svn to convert the whole svn repository?
> 
> Personally I think now would be a good time.

I agree we should move to git. 

I do want to see the history preserved though and the result of the
conversion to be sane and make sense. My experience of git-svn is that
it can sometimes need careful attention. I don't know how much churn
like layout changes the svn repository has had though...

So yes, I'm in favour as long as we do it properly. I'm still not happy
with the OE history but I just haven't got the time to do anything about
it :(.

Cheers,

Richard







