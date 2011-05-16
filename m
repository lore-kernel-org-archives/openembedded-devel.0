Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLwGE-0007aK-9O
	for openembedded-devel@openembedded.org; Mon, 16 May 2011 13:46:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GBR71X018909
	for <openembedded-devel@openembedded.org>;
	Mon, 16 May 2011 12:27:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18804-02 for <openembedded-devel@openembedded.org>;
	Mon, 16 May 2011 12:27:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GBQx1f018903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 16 May 2011 12:27:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 16 May 2011 12:26:58 +0100
Message-ID: <1305545218.3424.29.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Mon, 16 May 2011 11:46:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

The TSC has been tasked with working out how OE and Yocto could work
together and people have no doubt seen the discussions about OE-Core.

We're now pleased to formally announce that we feel OE-Core is ready for
exposure to more users and we'd like to encourage people to have a look
at it and experiment and develop with it.

Just to recap on the background for this, splitting up OE into
components has been a topic of discussion for a long time, certainly at
every OEDEM. Until now this hasn't happened partly due to resource
issues but also lack of tooling and the lack of a well thought out plan.
We now feel these issues have been addressed and that we have a good
plan in place. The promotion and use of layers is the only real way OE
can scale as a project yet stay maintainable and testable.

Things that aren't part of oe-core fall to the meta-oe layer which is
where we intend the current wider support contained in oe-devel to be
maintained. The people working on meta-oe so far would love to see more
contributions. Both repositories are currently working on a "pull" model
and people using them so far have felt a benefit to this for code
quality.

Discussion and development on oe-core is happening on the
openembedded-core mailing list since otherwise it would be hard to
filter out which patches and discussion were for which repository. We
look forward to seeing more people getting involved there!

(http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core)

Cheers,

Richard
(Communicating on behalf of the TSC)










