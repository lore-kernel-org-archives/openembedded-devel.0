Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>)
	id 1PSbCp-0002OF-4c; Tue, 14 Dec 2010 21:10:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oBEK92Vx011648;
	Tue, 14 Dec 2010 20:09:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11607-01; Tue, 14 Dec 2010 20:08:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oBEK8tno011642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 14 Dec 2010 20:08:56 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-members <openembedded-members@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Dec 2010 20:08:54 +0000
Message-ID: <1292357334.14420.3939.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: More about the Yocto Project
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
X-List-Received-Date: Tue, 14 Dec 2010 20:10:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its probably a good time to talk further about the Yocto Project,
OpenEmbedded, Poky and the Linux Foundation.

The Linux foundation isn't perhaps as well known in the OE community as
it is elsewhere but its the legal non-profit entity that represents
Linux and provides various support functions for Linux in a company
independent way. Its for this reason that the Yocto Project is a Linux
Foundation project and whilst the project was started by Wind River and
Intel, wider industry involvement in the project is actively being
sought.

Its for exactly this reason the Linux Foundation organised an Embedded
Linux summit recently to which key companies from the embedded industry
were invited along with a variety of representatives from a cross
section of the OE community. Notice was a little short for the meeting
and unfortunately not everyone invited was able to attend but there was
significant and representative attendance.

There was significant interest as there is a common problem faced by
many companies in the industry which is that they're all repeating
similar "commercialising" steps against OE in some form or another for
little differentiation. There is therefore great interest in being able
to do this in one shared place through the Yocto Project instead of
doing the same things.

There was some concern that a key architect and maintainer role for
Yocto was being played by me but I was working for Intel and there was
potential for conflict of interest. To address this it was announced at
the summit that I have been made a fellow of the Linux Foundation. This
is a great honour as other fellows include people like Linus Torvalds
and Andrew Morton.

One other major concern raised was the relationship between Poky and OE.
There is a strong value to the OE name, community, metadata and
everything it encompasses. Nobody at any of the companies involved in
the discussions, or in the Yocto Project or at the Linux Foundation
wants to damage this, its value is appreciated.

Its hard to put together something short which people will read yet
fully convey the opportunity here. To put it simply, the Yocto Project
has the potential to take OpenEmbedded to a whole new level. Jim Zemlin
(Executive Director of the Linux Foundation) had a good illustration of
this. He goes out to companies and raises literally millions of dollars
for Linux. The offer is the ability to do this for the "OpenEmbedded
Architecture". Funds can directly and indirectly benefit the project.
Some examples:

Developers - Being able to find ways to allow developers to focus not
just on their product but on improving the core architecture and add
missing features. I know all too well the pressures of needing to focus
on direct revenue generating work and not on the architecture but its
only a short term solution. 

Conferences - Conferences don't just happen, there is a heck of a lot of
work involved in the organisation of them as well as the funding. The LF
has people who can do this as well as systems for travel funds.

Standardisation - An implicit LF endorsement of OE as a technology is
not to be underestimated.

Education and Training - The LF recognises the shortage of Embedded
Linux developers and wants to help educate and train more people. This
translates to more people using the OE architecture and a strong
industry and community.

Jim needs something to work with to do this. This is pretty much what
the steering group within the Yocto governance model is for as it allows
sponsors of the project to have some involvement/influence. I cannot
stress enough that the model and setup is to actually never use this
influence though, crazy as it sounds. The maintainers are the people
with the power, they make the decisions and the steering group is only
there for oversight.

To fully realise these benefits, the relationship between Yocto and
OpenEmbedded or specifically OE and Poky needs to be established and
that probably means changes for both OE and Poky.

What changes these are and what the relationship could be needs
discussion and I don't want to start on that in this email. I think
people have ideas about what could work and we can get to that in
another email. Here, I wanted to highlight try and illustrate the
tremendous opportunity we have and why we should consider change.

Finally, I'd like to suggest people to talk to one another. We've now
had an OEDEM and the Embedded Summit mentioned above where these things
have been discussed and there have been plenty of OE developers and
users present at these. Please talk to people and see what their
impressions are.

Cheers,

Richard
-- 
Richard Purdie
Linux Foundation Fellow
(richard.purdie@linuxfoundation.org)
(Sent from my personal account, only as the members list wouldn't let me
post otherwise)




