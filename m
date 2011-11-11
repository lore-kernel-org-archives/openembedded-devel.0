Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1ROs1b-0001Vc-Nk
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 15:24:22 +0100
Received: (qmail 10893 invoked by uid 1003); 11 Nov 2011 14:17:53 -0000
Received: from unknown (HELO ?192.168.1.111?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Nov 2011 14:17:52 -0000
Message-ID: <4EBD2E8F.6060400@balister.org>
Date: Fri, 11 Nov 2011 09:17:51 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: Guidelines for creating a layer
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
X-List-Received-Date: Fri, 11 Nov 2011 14:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sorry to hack the subject and delete the earlier conversation, but Koen
raises a good point here and I do not want it lost in the earlier
discussion since I among others stopped reading the emails in detail.

Is there a good set of guidelines on the web site (not buried in a git
repo) to guide people making the decision when to create a new layer, as
opposed to contributing to an existing layer?

How do we make sure layers are well thought out and not people taking
the path of least resistance?

Philip

-------- Original Message --------
Subject: Re: [oe] RFC Creation of a meta-telephony repository
Date: Fri, 11 Nov 2011 11:45:52 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
Reply-To: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org


Having worked with layers for quite a while now I go through the following
list before creating one:

Does it need to be a layer? -> no -> send patches to existing layers
	|
	yes
	|
Does it need to be a seperate repo? -> no -> send patches to existing repos
	|
	yes
	|
Is github/gitorious/etc good enough? -> no -> ...
	|
	yes
	|
Create repo + layer

And after a I while re-evaluate it.

regards,

Koen


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



