Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1ME9KX-0001gv-F2
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 23:58:06 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n59LmDSe027213 for <openembedded-devel@openembedded.org>;
	Tue, 9 Jun 2009 22:48:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tkpms13IPwp0 for <openembedded-devel@openembedded.org>;
	Tue,  9 Jun 2009 22:48:13 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n59Lm93E027181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Tue, 9 Jun 2009 22:48:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1244582165.6677.3.camel@port4>
References: <f96d234e0906080759q40afd1dau930f93999048fbd9@mail.gmail.com>
	<200906081747.04528.marcin@juszkiewicz.com.pl>
	<1244582165.6677.3.camel@port4>
Date: Tue, 09 Jun 2009 22:47:16 +0100
Message-Id: <1244584036.5998.44.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: OE weekly changelog 2009-06-01 to 2009-06-08
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
X-List-Received-Date: Tue, 09 Jun 2009 21:58:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-09 at 23:16 +0200, GNUtoo wrote:
> On Mon, 2009-06-08 at 17:46 +0200, Marcin Juszkiewicz wrote:
> > Maybe will also teach contributors to write shorter summaries ;)
> I often(but not always) write long summaries for giving info on why I
> did it this way to it's easier to maintain...
> So If it's better to write shorter summaries...where should I write the
> long version?

You write a short summary as the first line of your commit message and
the longer description then goes underneath. Both are useful.

Cheers,

Richard



