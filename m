Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I8N2h-0006gs-Id
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 23:14:54 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1444690ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 14:08:55 -0700 (PDT)
Received: by 10.86.77.5 with SMTP id z5mr738221fga.1184101735631;
	Tue, 10 Jul 2007 14:08:55 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id w7sm59715657mue.2007.07.10.14.08.54
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2007 14:08:55 -0700 (PDT)
Date: Wed, 11 Jul 2007 00:08:36 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1782937254.20070711000836@gmail.com>
To: Sergey Lapin <slapinid@gmail.com>
In-Reply-To: <4693D9F4.5030000@gmail.com>
References: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
	<40479847.20070710211608@gmail.com> <4693D9F4.5030000@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Palms commits.
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
X-List-Received-Date: Tue, 10 Jul 2007 21:15:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Tuesday, July 10, 2007, 10:11:48 PM, you wrote:

[]

>>   Summing up, by investing 50% more effort into that, there can be 5
>> times more outcome. And as a "fresh blood" in OE, you're in good
>> position to lead this, as other developers are of course stuck with
>> other issues.

> Do you count yourself in this 50%, btw?

  Absolutely. I contemplated such a change for a long time, actually
current work on adding missing hh.org machine to OE and switching to
defconfiman kernel configuration management are initial steps on that
way. I didn't proceed with OE machine configs cleanup, because well,
it takes some real world dataset to make it general enough, and
because HH.org kernel project was literally the only stakeholder for
such changes, with couple of dozens of machines and counting (whereas
even Zaurus project has around half-dozen architecturally different
machines). So, I eagerly awaited other projects, like Hackhdev to join
more actively with OE, to tackle these issues together.

  I understand your worktime constraints, and the need to get practice
with OE and mtn, but there're other creative ways to get it - like,
for example, adding support for other 8 or so Palm devices in addition
to 4 already in OE. This would be pretty worthy a job for Palm devices
maintainer, and at the same time would happen to give us mentioned raw
dataset to base firm decisions on. And there's also good chance for us
to get in sync, so all Palm and PocketPC devices are in OE, that can't
be checked off for both projects, and we can proceed further with
better support and maintenance facilitation. Of course, this all is
from my side of view, YMMV.

> Best regards,

> S.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



