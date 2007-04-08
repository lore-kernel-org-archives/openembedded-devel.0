Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HafOp-0008WC-PW
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 23:58:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38LwFxS030772
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 22:58:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30713-01 for <openembedded-devel@openembedded.org>;
	Sun,  8 Apr 2007 22:58:12 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38Lw9Mv030765
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 22:58:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46191FDD.1000406@dominion.kabel.utwente.nl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<1176048832.5844.1.camel@localhost.localdomain>
	<46191FDD.1000406@dominion.kabel.utwente.nl>
Date: Sun, 08 Apr 2007 22:58:09 +0100
Message-Id: <1176069490.5844.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sun, 08 Apr 2007 21:58:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-04-08 at 19:01 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > As I see it, rm_work is a policy which can be applied by an individual
> > or a distro. I don't think it should be mandatory but if certain distros
> > wish to use it be default, that is up to them and I'm fine with that.
> 
> Right, my proposal does that, but skips the need to add it to INHERITS manually. It's a
> small nuance, but not big enough to discuss further :)

Well, your proposed solution requires a magic new variable, using
INHERITS requires no new magic variable and use a standardised method
already used for other such features...

Lets not over complicate things...

Cheers,

Richard







